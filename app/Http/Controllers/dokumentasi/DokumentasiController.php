<?php

namespace App\Http\Controllers\dokumentasi;

use App\Http\Controllers\Controller;
use App\Models\DocKategori;
use App\Models\Dokumentasi;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Str;

class DokumentasiController extends Controller
{
    public function index()
    {
        $dokumentasi = Dokumentasi::with('kategori')
            ->latest()
            ->get();

        $kategori = DocKategori::orderBy('kategori')
            ->get();

        return Inertia::render('dokumentasi/page', [
            'dokumentasi' => $dokumentasi,
            'kategori' => $kategori,
        ]);
    }

    public function docs($slug = null)
    {
        $dokumentasi = Dokumentasi::with('kategori')
            ->get();

        $activeDoc = null;

        if ($slug) {

            $activeDoc = Dokumentasi::with('kategori')
                ->where('slug', $slug)
                ->firstOrFail();

        } else {

            $activeDoc = $dokumentasi->first();
        }

        return Inertia::render('docs', [
            'dokumentasi' => $dokumentasi,
            'activeDoc' => $activeDoc,
        ]);
    }

    /**
     * FORM CREATE
     */
    public function create()
    {
        $kategori = DocKategori::orderBy('kategori')
            ->get();

        return Inertia::render('dokumentasi/create', [
            'kategori' => $kategori,
        ]);
    }

    /**
     * STORE
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'kategori' => ['required', 'string'],
            'judul' => ['required'],
            'konten' => ['required'],
        ]);

        $kategori = DocKategori::firstOrCreate([
            'kategori' => trim($validated['kategori'])
        ]);

        // GENERATE SLUG
        $baseSlug = Str::slug($validated['judul']);

        $slug = $baseSlug;

        $count = 1;

        while (
            Dokumentasi::where('slug', $slug)->exists()
        ) {
            $slug = $baseSlug . '-' . $count++;
        }

        Dokumentasi::create([
            'doc_kategori_id' => $kategori->id,
            'judul' => $validated['judul'],
            'slug' => $slug,
            'konten' => $validated['konten'],
        ]);

        return redirect()
            ->route('dokumentasi.index')
            ->with(
                'success',
                'Dokumentasi berhasil ditambahkan.'
            );
    }

    // SLUG
    public function show($slug)
    {
        $dokumentasi = Dokumentasi::where(
            'slug',
            $slug
        )->firstOrFail();

        return Inertia::render(
            'docs/show',
            [
                'dokumentasi' => $dokumentasi,
            ]
        );
    }

    /**
     * FORM EDIT
     */
    public function edit(Dokumentasi $dokumentasi)
    {
        $kategori = DocKategori::orderBy('kategori')
            ->get();

        return Inertia::render('dokumentasi/edit', [
            'dokumentasi' => $dokumentasi->load('kategori'),
            'kategori' => $kategori,
        ]);
    }

    /**
     * UPDATE
     */
    public function update(Request $request, Dokumentasi $dokumentasi)
    {
        $validated = $request->validate([
            'kategori' => ['required', 'string'],
            'judul' => ['required'],
            'konten' => ['required'],
        ]);

        $oldKategoriId = $dokumentasi->doc_kategori_id;

        $kategori = DocKategori::firstOrCreate([
            'kategori' => trim($validated['kategori'])
        ]);

        $dokumentasi->update([
            'doc_kategori_id' => $kategori->id,
            'judul' => $validated['judul'],
            'konten' => $validated['konten'],
        ]);

        // HAPUS KATEGORI LAMA JIKA KOSONG
        $oldKategori = DocKategori::find($oldKategoriId);

        if (
            $oldKategori &&
            !$oldKategori->dokumentasi()->exists()
        ) {
            $oldKategori->delete();
        }

        // $this->deleteUnusedKategori();

        return redirect()
            ->route('dokumentasi.index')
            ->with('success', 'Dokumentasi berhasil diupdate.');
    }

    /**
     * DELETE
     */
    public function destroy(Dokumentasi $dokumentasi)
    {
        $kategoriId = $dokumentasi->doc_kategori_id;

        $dokumentasi->delete();

        // HAPUS KATEGORI JIKA SUDAH TIDAK DIPAKAI
        DocKategori::where('id', $kategoriId)
            ->doesntHave('dokumentasi')
            ->delete();

        $this->deleteUnusedKategori();

        return back()
            ->with('success', 'Dokumentasi berhasil dihapus.');
    }

    //  UPLOAD IMAGE
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => ['required', 'image', 'max:2048'],
        ]);

        $path = $request
            ->file('image')
            ->store('dokumentasi', 'public');

        return response()->json([
            'url' => asset('storage/' . $path),
        ]);
    }

    // Kategori
    private function deleteUnusedKategori(): void
    {
        DocKategori::doesntHave('dokumentasi')
            ->delete();
    }

    public function updateKategori(
        Request $request,
        DocKategori $kategori
    ) {
        $validated = $request->validate([
            'kategori' => ['required', 'string', 'max:255'],
        ]);

        $newKategori = trim($validated['kategori']);

        // CEGAH DUPLIKAT
        $exists = DocKategori::where('id', '!=', $kategori->id)
            ->whereRaw('LOWER(kategori) = ?', [
                strtolower($newKategori)
            ])
            ->first();

        // JIKA SUDAH ADA
        if ($exists) {

            // PINDAHKAN SEMUA DOKUMENTASI
            Dokumentasi::where(
                'doc_kategori_id',
                $kategori->id
            )->update([
                'doc_kategori_id' => $exists->id
            ]);

            // HAPUS KATEGORI LAMA
            $kategori->delete();

        } else {

            // UPDATE LANGSUNG
            $kategori->update([
                'kategori' => $newKategori
            ]);
        }

        return back()->with(
            'success',
            'Kategori berhasil diupdate.'
        );
    }
    
}