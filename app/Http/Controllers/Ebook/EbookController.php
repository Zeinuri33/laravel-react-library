<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use App\Models\Ebooks\Ebook_klasifikasi;
use Illuminate\Http\Request;
use App\Models\Ebooks\Ebook;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Inertia\Inertia;
use Smalot\PdfParser\Parser;
use Spatie\PdfToImage\Pdf;

class EbookController extends Controller
{
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

                Storage::disk('public')->makeDirectory('ebooks/pdfs');

                $newName = Str::uuid() . '.pdf';
                $newPath = 'ebooks/pdfs/' . $newName;

                Storage::disk('public')->move($oldPath, $newPath);

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

                // URL preview
                'file' => $ebook->file
                    ? Storage::url($ebook->file)
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
                // hapus pdf lama
                if ($ebook->file) {
                    Storage::disk('public')->delete($ebook->file);
                }
                $newPdfName = Str::uuid() . '.pdf';
                $newPdfPath = 'ebooks/pdfs/' . $newPdfName;
                Storage::disk('public')->makeDirectory('ebooks/pdfs');
                Storage::disk('public')->move(
                    $oldTempPdf,
                    $newPdfPath
                );
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


    public function destroy(Ebook $ebook)
    {
        // -----------------------------
        // HAPUS FILE PDF
        // -----------------------------
        if ($ebook->file && Storage::disk('public')->exists($ebook->file)) {
            Storage::disk('public')->delete($ebook->file);
        }

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
