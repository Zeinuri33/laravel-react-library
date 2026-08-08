<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use App\Models\Ebooks\EbookBacaHistory;
use App\Models\Ebooks\Ebook_klasifikasi;
use App\Models\Ebooks\Ebook_titik_baca;
use Illuminate\Http\Request;
use App\Models\Ebooks\Ebook;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Inertia\Inertia;
use Smalot\PdfParser\Parser;
use Spatie\PdfToImage\Pdf;

class EbookController extends Controller
{
    /**
     * Masa berlaku verifikasi lokasi perangkat di session (detik).
     * Disegarkan oleh heartbeat selama sesi membaca aktif.
     */
    private const ZONA_VERIFICATION_TTL = 1800;

    public function extract(Request $request)
    {
        $request->validate([
            'file' => ['required', 'mimes:pdf'],
        ]);

        /*
        |----------------------------------------
        | SIMPAN PDF TEMP
        |----------------------------------------
        */
        $pdfFile = $request->file('file');

        $tempName = Str::uuid() . '.pdf';

        $pdfPath = $pdfFile->storeAs(
            'temp/pdfs',
            $tempName,
            'public'
        );

        $fullPdfPath = storage_path(
            'app/public/' . $pdfPath
        );

        Log::info('PDF Upload', [
            'name' => $pdfFile->getClientOriginalName(),
            'size_mb' => round(
                $pdfFile->getSize() / 1024 / 1024,
                2
            ),
        ]);

        /*
        |----------------------------------------
        | DEFAULT VALUE
        |----------------------------------------
        */
        $metadata = [];
        $firstPageText = '';

        /*
        |----------------------------------------
        | PARSE PDF
        |----------------------------------------
        */
        try {

            $parser = new Parser();

            $document = $parser->parseFile(
                $fullPdfPath
            );

            $metadata = $document->getDetails();

            Log::info(
                'PDF Metadata',
                $metadata
            );

            $pages = $document->getPages();

            if (count($pages) > 0) {
                $firstPageText =
                    $pages[0]->getText() ?? '';
            }

        } catch (\Throwable $e) {

            Log::error(
                'PDF Parse Error',
                [
                    'file' => $pdfFile->getClientOriginalName(),
                    'message' => $e->getMessage(),
                ]
            );
        }

        /*
        |----------------------------------------
        | EXTRACT DATA
        |----------------------------------------
        */
        preg_match(
            '/ISBN(?:-13)?[\s:]*([0-9\-]+)/i',
            $firstPageText,
            $isbnMatch
        );

        $isbn = $isbnMatch[1] ?? null;

        preg_match(
            '/(19|20)\d{2}/',
            $firstPageText,
            $yearMatch
        );

        $tahun = $yearMatch[0] ?? null;

        /*
        |----------------------------------------
        | GENERATE COVER
        |----------------------------------------
        */
        $coverPath = null;

        try {

            $coverName = Str::uuid() . '.jpg';

            $tmpPath = storage_path(
                'app/public/temp_cover_' .
                Str::uuid() .
                '.jpg'
            );

            $pdf = new Pdf(
                $fullPdfPath
            );

            $pdf
                ->selectPage(1)
                ->save($tmpPath);

            $destinationDir = storage_path(
                'app/public/temp/covers'
            );

            if (!file_exists($destinationDir)) {
                mkdir(
                    $destinationDir,
                    0755,
                    true
                );
            }

            if (file_exists($tmpPath)) {

                rename(
                    $tmpPath,
                    $destinationDir .
                    '/' .
                    $coverName
                );

                $coverPath =
                    'temp/covers/' .
                    $coverName;
            }

        } catch (\Throwable $e) {

            Log::error(
                'PDF Cover Error',
                [
                    'file' => $pdfFile->getClientOriginalName(),
                    'message' => $e->getMessage(),
                ]
            );
        }

        /*
        |----------------------------------------
        | METADATA
        |----------------------------------------
        */
        $judul = pathinfo(
            $pdfFile->getClientOriginalName(),
            PATHINFO_FILENAME
        );

        $penulis =
            $metadata['Author'] ?? '';

        $penerbit =
            $metadata['Producer'] ?? '';

        $kategori =
            $metadata['Subject'] ?? '';

        $deskripsi = substr(
            preg_replace(
                '/\s+/',
                ' ',
                $firstPageText
            ),
            0,
            1000
        );

        /*
        |----------------------------------------
        | RESPONSE
        |----------------------------------------
        */
        return response()->json([
            'judul' => $judul,
            'isbn' => $isbn,
            'eisbn' => '',
            'tahun_terbit' => $tahun,
            'penulis' => $penulis,
            'penerbit' => $penerbit,
            'kategori' => $kategori,
            'deskripsi' => $deskripsi,

            'cover' => $coverPath
                ? asset('storage/' . $coverPath)
                : null,

            'cover_path' => $coverPath,

            'file_path' => $pdfPath,
        ]);
    }

    public function cleanupTemp(Request $request)
    {
        $data = $request->json()->all(); // 👈 PENTING

        $filePath = $data['file_path'] ?? null;
        $coverPath = $data['cover_path'] ?? null;

        if ($filePath && Storage::disk('public')->exists($filePath)) {
            Storage::disk('public')->delete($filePath);
        }

        if ($coverPath && Storage::disk('public')->exists($coverPath)) {
            Storage::disk('public')->delete($coverPath);
        }

        return response()->json(['ok' => true]);
    }


    public function index()
    {
        $ebooks = Ebook::query()
            ->with('klasifikasi')
            ->leftJoin(
                'ebook_klasifikasis',
                'ebooks.klasifikasi_id',
                '=',
                'ebook_klasifikasis.id'
            )
            ->select('ebooks.*')
            // ->orderBy('ebook_klasifikasis.kode')
            ->latest()->get();

        return Inertia::render('ebook/page', [
            'ebooks' => $ebooks,
        ]);
    }

    public function create()
    {
        return Inertia::render('ebook/create', [
            'klasifikasis' => Ebook_klasifikasi::orderBy('kode')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul' => ['required', 'string', 'max:255'],
            'isbn' => ['nullable', 'string', 'max:255'],
            'eisbn' => ['nullable', 'string', 'max:255'],
            'tahun_terbit' => ['nullable', 'string', 'max:10'],
            'penulis' => ['nullable', 'string', 'max:255'],
            'penerbit' => ['nullable', 'string', 'max:255'],
            'klasifikasi_id' => ['nullable', 'integer'], // ✅ INI WAJIB TAMBAH
            'deskripsi' => ['nullable', 'string'],
            'file' => ['nullable', 'mimes:pdf'],
            'file_path' => ['required', 'string'],
            'cover_path' => ['nullable', 'string'],
        ]);

        /*
        |----------------------------------------
        | PINDAH PDF: temp/pdfs → ebooks/pdfs
        |----------------------------------------
        */
        $filePath = null;

        if (!empty($validated['file_path'])) {

            $oldPath = $validated['file_path'];
            // temp/pdfs/xxx.pdf

            if (Storage::disk('public')->exists($oldPath)) {

                $newName = Str::uuid() . '.pdf';
                $newPath = 'ebooks/pdfs/' . $newName;

                // Simpan ke disk privat (bukan storage publik) agar tidak bisa
                // diakses langsung lewat URL /storage/...
                Storage::disk('local')->writeStream(
                    $newPath,
                    Storage::disk('public')->readStream($oldPath)
                );
                Storage::disk('public')->delete($oldPath);

                $filePath = $newPath;
            }
        }

        /*
        |----------------------------------------
        | HANDLE COVER (AMAN TANPA move())
        |----------------------------------------
        */
        $coverFinalPath = null;

    /*
    |----------------------------------------
    | USER UPLOAD COVER (PRIORITY 1)
    |----------------------------------------
    */
    if ($request->hasFile('cover')) {

        $coverFile = $request->file('cover');

        $coverName = Str::uuid() . '.' . $coverFile->getClientOriginalExtension();

        $coverFile->storeAs(
            'ebooks/covers',
            $coverName,
            'public'
        );

        $coverFinalPath = 'ebooks/covers/' . $coverName;

        /*
        |----------------------------------------
        | HAPUS COVER TEMP (JIKA ADA)
        |----------------------------------------
        */
        if (!empty($validated['cover_path'])) {

            Storage::disk('public')->delete($validated['cover_path']);
        }

    /*
    |----------------------------------------
    | AUTO COVER DARI PDF
    |----------------------------------------
    */
    } elseif (!empty($validated['cover_path'])) {

        $oldPath = $validated['cover_path'];

        $sourcePath = storage_path('app/public/' . $oldPath);

        if (file_exists($sourcePath)) {

            $newName = Str::uuid() . '.jpg';

            $destinationDir = storage_path('app/public/ebooks/covers');

            if (!file_exists($destinationDir)) {
                mkdir($destinationDir, 0755, true);
            }

            $newPath = $destinationDir . '/' . $newName;

            rename($sourcePath, $newPath);

            $coverFinalPath = 'ebooks/covers/' . $newName;
        }
    }

        /*
        |----------------------------------------
        | SIMPAN DATABASE
        |----------------------------------------
        */
        $ebook = Ebook::create([
            'judul' => $validated['judul'],
            'isbn' => $validated['isbn'] ?? null,
            'eisbn' => $validated['eisbn'] ?? null,
            'tahun_terbit' => $validated['tahun_terbit'] ?? null,
            'penulis' => $validated['penulis'] ?? null,
            'penerbit' => $validated['penerbit'] ?? null,
            'klasifikasi_id' => $validated['klasifikasi_id'] ?? null,
            'deskripsi' => $validated['deskripsi'] ?? null,
            'file' => $filePath,
            'cover' => $coverFinalPath,
        ]);

        return redirect('/list-ebooks')
            ->with('success', 'Ebook berhasil disimpan');
    }

    public function edit(Ebook $ebook)
    {
        return Inertia::render('ebook/edit', [
            'ebook' => [
                'id' => $ebook->id,
                'judul' => $ebook->judul,
                'isbn' => $ebook->isbn,
                'eisbn' => $ebook->eisbn,
                'tahun_terbit' => $ebook->tahun_terbit,
                'penulis' => $ebook->penulis,
                'penerbit' => $ebook->penerbit,
                'klasifikasi_id' => $ebook->klasifikasi_id,
                'deskripsi' => $ebook->deskripsi,

                // URL preview (signed URL sementara — bukan storage publik)
                'file' => $ebook->file
                    ? URL::temporarySignedRoute('zonabaca.pdf', now()->addHour(), ['ebook' => $ebook->id])
                    : null,

                'cover' => $ebook->cover
                    ? asset('storage/' . $ebook->cover)
                    : null,

                // path asli untuk kebutuhan update
                'file_path' => $ebook->file,
                'cover_path' => $ebook->cover,
            ],
            'klasifikasis' => Ebook_klasifikasi::orderBy('kode')->get(),
        ]);
    }



    public function update(Request $request, Ebook $ebook)
    {
        $validated = $request->validate([
            'judul' => ['required', 'string', 'max:255'],
            'isbn' => ['nullable', 'string', 'max:255'],
            'eisbn' => ['nullable', 'string', 'max:255'],
            'tahun_terbit' => ['nullable', 'string', 'max:10'],
            'penulis' => ['nullable', 'string', 'max:255'],
            'penerbit' => ['nullable', 'string', 'max:255'],
            'klasifikasi_id' => ['nullable', 'integer'],
            'deskripsi' => ['nullable', 'string'],
            'file_path' => ['nullable', 'string'],
            'cover_path' => ['nullable', 'string'],
            'cover' => ['nullable', 'image'],
        ]);

        /*
        |----------------------------------------
        | PDF
        |----------------------------------------
        */
        $filePath = $ebook->file;
        if (!empty($validated['file_path'])) {
            $oldTempPdf = $validated['file_path'];
            if (Storage::disk('public')->exists($oldTempPdf)) {
                $newPdfName = Str::uuid() . '.pdf';
                $newPdfPath = 'ebooks/pdfs/' . $newPdfName;

                // Simpan file baru ke disk privat terlebih dahulu,
                // baru hapus yang lama (hindari kehilangan data jika gagal)
                Storage::disk('local')->writeStream(
                    $newPdfPath,
                    Storage::disk('public')->readStream($oldTempPdf)
                );
                Storage::disk('public')->delete($oldTempPdf);
                $this->deleteEbookFile($ebook->file);

                $filePath = $newPdfPath;
            }
        }

        /*
        |----------------------------------------
        | COVER
        |----------------------------------------
        */
        $coverPath = $ebook->cover;
        // COVER MANUAL
        if ($request->hasFile('cover')) {
            // hapus cover lama
            if ($ebook->cover) {
                Storage::disk('public')->delete($ebook->cover);
            }
            // hapus cover temp extract
            if (!empty($validated['cover_path'])) {
                Storage::disk('public')->delete(
                    $validated['cover_path']
                );
            }
            $coverFile = $request->file('cover');
            $coverName = Str::uuid() . '.' .
                $coverFile->getClientOriginalExtension();
            $coverFile->storeAs(
                'ebooks/covers',
                $coverName,
                'public'
            );
            $coverPath = 'ebooks/covers/' . $coverName;
        }

        // COVER HASIL EXTRACT PDF
        elseif (!empty($validated['cover_path'])) {
            if (Storage::disk('public')->exists($validated['cover_path'])) {
                // hapus cover lama
                if ($ebook->cover) {
                    Storage::disk('public')->delete($ebook->cover);
                }
                $newCoverName = Str::uuid() . '.jpg';
                $newCoverPath = 'ebooks/covers/' . $newCoverName;
                Storage::disk('public')->makeDirectory('ebooks/covers');
                Storage::disk('public')->move(
                    $validated['cover_path'],
                    $newCoverPath
                );
                $coverPath = $newCoverPath;
            }
        }

        /*
        |----------------------------------------
        | UPDATE DATABASE
        |----------------------------------------
        */
        $ebook->update([
            'judul' => $validated['judul'],
            'isbn' => $validated['isbn'] ?? null,
            'eisbn' => $validated['eisbn'] ?? null,
            'tahun_terbit' => $validated['tahun_terbit'] ?? null,
            'penulis' => $validated['penulis'] ?? null,
            'penerbit' => $validated['penerbit'] ?? null,
            'klasifikasi_id' => $validated['klasifikasi_id'] ?? null,
            'deskripsi' => $validated['deskripsi'] ?? null,
            'file' => $filePath,
            'cover' => $coverPath,
        ]);

        return redirect('/list-ebooks')
            ->with('success', 'E-Book berhasil diperbarui');
    }


    public function zonaBaca()
    {
        $ebooks = Ebook::with('klasifikasi')
            ->withCount('bacaHistories')
            ->where('is_active', true)
            ->latest()
            ->get();

        $titiks = Ebook_titik_baca::where('is_active', true)->get();

        return Inertia::render('zonabaca', [
            'ebooks' => $ebooks,
            'titiks' => $titiks,
        ]);
    }

    /**
     * Verify if the given coordinates are within any active zona baca.
     */
    public function verifyLocation(Request $request)
    {
        $validated = $request->validate([
            'latitude' => ['required', 'numeric', 'between:-90,90'],
            'longitude' => ['required', 'numeric', 'between:-180,180'],
        ]);

        $latitude = (float) $validated['latitude'];
        $longitude = (float) $validated['longitude'];

        $titik = $this->findTitikInZona($latitude, $longitude);

        if ($titik) {
            $distance = $this->haversineDistance(
                $latitude,
                $longitude,
                (float) $titik->latitude,
                (float) $titik->longitude
            );

            // Simpan verifikasi lokasi perangkat ke session (bukan di URL),
            // agar URL e-book bisa dibagikan tanpa membocorkan koordinat.
            session([
                'zonabaca_verified' => true,
                'zonabaca_verified_at' => now()->timestamp,
                'zonabaca_titik_id' => $titik->id,
            ]);

            return response()->json([
                'allowed' => true,
                'message' => 'Lokasi Anda berada dalam area zona baca: ' . $titik->nama,
                'titik' => [
                    'id' => $titik->id,
                    'nama' => $titik->nama,
                    'jarak' => round($distance, 1),
                ],
            ]);
        }

        // Tidak berada di area mana pun — cabut verifikasi yang lama
        session()->forget(['zonabaca_verified', 'zonabaca_verified_at', 'zonabaca_titik_id']);

        // Cari zona terdekat untuk pesan bantuan pengguna
        $titiks = Ebook_titik_baca::where('is_active', true)->get();

        $nearestTitik = null;
        $minDistance = PHP_FLOAT_MAX;

        foreach ($titiks as $titik) {
            $distance = $this->haversineDistance(
                $latitude,
                $longitude,
                (float) $titik->latitude,
                (float) $titik->longitude
            );

            if ($distance < $minDistance) {
                $minDistance = $distance;
                $nearestTitik = $titik;
            }
        }

        return response()->json([
            'allowed' => false,
            'message' => 'Anda berada di luar area zona baca. Untuk membaca e-book, silakan datang ke lokasi zona baca terdekat.',
            'nearest_titik' => $nearestTitik ? [
                'id' => $nearestTitik->id,
                'nama' => $nearestTitik->nama,
                'jarak' => round($minDistance, 1),
            ] : null,
        ]);
    }

    /**
     * Calculate the distance between two coordinates using the Haversine formula.
     */
    private function haversineDistance(float $lat1, float $lon1, float $lat2, float $lon2): float
    {
        $earthRadius = 6371000; // meters

        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return $earthRadius * $c;
    }

    public function baca(Ebook $ebook)
    {
        // Lokasi perangkat diverifikasi lewat /zonabaca/verify-location yang
        // menyimpan hasilnya di session. URL halaman ini bersih (tanpa lat/lng)
        // sehingga aman untuk dibagikan.

        $ebook->load('klasifikasi');
        $ebook->loadCount('bacaHistories');

        $totalMenit = (int) ceil(
            EbookBacaHistory::where('ebook_id', $ebook->id)->sum('duration_seconds') / 60
        );

        return Inertia::render('ebook/baca', [
            'ebook' => [
                'id' => $ebook->id,
                'judul' => $ebook->judul,
                'penulis' => $ebook->penulis,
                'penerbit' => $ebook->penerbit,
                'tahun_terbit' => $ebook->tahun_terbit,
                'deskripsi' => $ebook->deskripsi,
                'cover' => $ebook->cover ? asset('storage/' . $ebook->cover) : null,
                // File PDF dialirkan lewat route /zonabaca/{id}/pdf yang
                // memverifikasi lokasi di backend — bukan URL storage publik.
                'file' => $ebook->file ? url('/zonabaca/' . $ebook->id . '/pdf') : null,
                'klasifikasi' => $ebook->klasifikasi,
                'total_dibaca' => $ebook->baca_histories_count,
                'total_menit_baca' => $totalMenit,
            ],
            'preVerified' => $this->isDeviceVerified(),
        ]);
    }

    public function startSession(Request $request)
    {
        // Hanya perangkat yang sudah terverifikasi lokasinya yang boleh
        // memulai sesi membaca (cegah penggelembungan statistik).
        if (!$this->isDeviceVerified()) {
            abort(403, 'Lokasi perangkat belum terverifikasi.');
        }

        $validated = $request->validate([
            'ebook_id' => ['required', 'exists:ebooks,id'],
            'titik_baca_id' => ['nullable', 'exists:ebook_titik_bacas,id'],
        ]);

        $sessionId = Str::uuid()->toString();

        $history = EbookBacaHistory::create([
            'ebook_id' => $validated['ebook_id'],
            'titik_baca_id' => $validated['titik_baca_id'] ?? session('zonabaca_titik_id'),
            'session_id' => $sessionId,
            'ip_address' => $request->ip(),
            'user_agent' => $request->userAgent(),
            'started_at' => now(),
            'last_heartbeat_at' => now(),
        ]);

        return response()->json([
            'session_id' => $sessionId,
            'history_id' => $history->id,
        ]);
    }

    /**
     * Alirkan file PDF melalui backend. Akses hanya diizinkan jika:
     * 1. Perangkat sudah diverifikasi lokasinya (session), ATAU
     * 2. Request memakai signed URL (untuk preview admin di halaman edit).
     */
    public function pdf(Request $request, Ebook $ebook)
    {
        // Preview admin via signed URL (expired setelah 1 jam)
        if ($request->hasValidSignature()) {
            return $this->streamEbookFile($ebook);
        }

        if (!$this->isDeviceVerified()) {
            abort(403, 'Lokasi perangkat belum terverifikasi. Silakan buka e-book melalui halaman zona baca.');
        }

        return $this->streamEbookFile($ebook);
    }

    /**
     * Cek apakah perangkat sudah melewati verifikasi lokasi zona baca
     * (hasilnya disimpan di session, berlaku sementara & disegarkan oleh
     * heartbeat selama sesi membaca aktif).
     */
    private function isDeviceVerified(): bool
    {
        if (!session('zonabaca_verified')) {
            return false;
        }

        $verifiedAt = (int) session('zonabaca_verified_at', 0);

        return (now()->timestamp - $verifiedAt) <= self::ZONA_VERIFICATION_TTL;
    }

    /**
     * Cari zona baca aktif pertama yang mencakup koordinat yang diberikan.
     */
    private function findTitikInZona(float $latitude, float $longitude): ?Ebook_titik_baca
    {
        $titiks = Ebook_titik_baca::where('is_active', true)->get();

        foreach ($titiks as $titik) {
            $distance = $this->haversineDistance(
                $latitude,
                $longitude,
                (float) $titik->latitude,
                (float) $titik->longitude
            );

            if ($distance <= $titik->radius) {
                return $titik;
            }
        }

        return null;
    }

    /**
     * Alirkan file PDF dari disk privat. File lama (legacy) yang masih di
     * disk publik otomatis dipindahkan ke disk privat saat pertama diakses.
     * Gunakan response()->file() (BinaryFileResponse) agar mendukung
     * HTTP Range requests yang dipakai pdf.js.
     */
    private function streamEbookFile(Ebook $ebook)
    {
        if (!$ebook->file) {
            abort(404);
        }

        // File baru tersimpan di disk privat (storage/app/private)
        if (Storage::disk('local')->exists($ebook->file)) {
            return $this->privateFileResponse($ebook->file);
        }

        // File lama yang masih di storage publik — migrasikan ke privat
        if (Storage::disk('public')->exists($ebook->file)) {
            Storage::disk('local')->writeStream(
                $ebook->file,
                Storage::disk('public')->readStream($ebook->file)
            );
            Storage::disk('public')->delete($ebook->file);

            return $this->privateFileResponse($ebook->file);
        }

        abort(404);
    }

    /**
     * Respons file dari disk privat dengan dukungan Range requests.
     */
    private function privateFileResponse(string $path)
    {
        return response()->file(storage_path('app/private/' . $path), [
            'Content-Type' => 'application/pdf',
        ]);
    }

    /**
     * Hapus file dari semua disk (privat maupun publik legacy).
     */
    private function deleteEbookFile(?string $path): void
    {
        if (!$path) {
            return;
        }

        if (Storage::disk('local')->exists($path)) {
            Storage::disk('local')->delete($path);
        }

        if (Storage::disk('public')->exists($path)) {
            Storage::disk('public')->delete($path);
        }
    }

    public function heartbeat(Request $request)
    {
        $validated = $request->validate([
            'session_id' => ['required', 'string'],
            'current_page' => ['required', 'integer', 'min:1'],
            'total_pages' => ['required', 'integer', 'min:1'],
        ]);

        $history = EbookBacaHistory::where('session_id', $validated['session_id'])
            ->whereNull('ended_at')
            ->first();

        if (!$history) {
            return response()->json(['error' => 'Session not found'], 404);
        }

        // Segarkan verifikasi lokasi selama user masih aktif membaca
        if (session('zonabaca_verified')) {
            session(['zonabaca_verified_at' => now()->timestamp]);
        }

        $now = now();
        $lastHeartbeat = $history->last_heartbeat_at;

        if ($lastHeartbeat) {
            $secondsSinceLastBeat = $lastHeartbeat->diffInSeconds($now);
            // Only count if reasonable (max 120 seconds between beats)
            if ($secondsSinceLastBeat > 0 && $secondsSinceLastBeat <= 120) {
                $history->increment('duration_seconds', $secondsSinceLastBeat);
            }
        }

        $history->update([
            'last_heartbeat_at' => $now,
            'total_pages_viewed' => $validated['total_pages'],
            'max_page_reached' => max($history->max_page_reached, $validated['current_page']),
        ]);

        $totalSeconds = EbookBacaHistory::where('ebook_id', $history->ebook_id)->sum('duration_seconds');

        return response()->json([
            'session_duration_seconds' => $history->duration_seconds,
            'total_menit_baca' => (int) ceil($totalSeconds / 60),
        ]);
    }

    public function endSession(Request $request)
    {
        $validated = $request->validate([
            'session_id' => ['required', 'string'],
            'current_page' => ['required', 'integer', 'min:1'],
            'total_pages' => ['required', 'integer', 'min:1'],
        ]);

        $history = EbookBacaHistory::where('session_id', $validated['session_id'])
            ->whereNull('ended_at')
            ->first();

        if (!$history) {
            return response()->json(['error' => 'Session not found'], 404);
        }

        $now = now();
        $lastHeartbeat = $history->last_heartbeat_at;

        if ($lastHeartbeat) {
            $secondsSinceLastBeat = $lastHeartbeat->diffInSeconds($now);
            if ($secondsSinceLastBeat > 0 && $secondsSinceLastBeat <= 120) {
                $history->increment('duration_seconds', $secondsSinceLastBeat);
            }
        }

        $history->update([
            'last_heartbeat_at' => $now,
            'ended_at' => $now,
            'total_pages_viewed' => $validated['total_pages'],
            'max_page_reached' => max($history->max_page_reached, $validated['current_page']),
        ]);

        return response()->json(['status' => 'ok']);
    }

    public function destroy(Ebook $ebook)
    {
        // -----------------------------
        // HAPUS FILE PDF
        // -----------------------------
        $this->deleteEbookFile($ebook->file);

        // -----------------------------
        // HAPUS COVER
        // -----------------------------
        if ($ebook->cover && Storage::disk('public')->exists($ebook->cover)) {
            Storage::disk('public')->delete($ebook->cover);
        }

        // -----------------------------
        // HAPUS DATABASE
        // -----------------------------
        $ebook->delete();

        return back()->with(
            'success',
            'E-Book berhasil dihapus'
        );
    }
}
