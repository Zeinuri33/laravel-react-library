<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ebooks\Ebook_klasifikasi;
use Inertia\Inertia;

class EbookKlasifikasiController extends Controller
{
    //
    public function index()
    {
        return Inertia::render('ebook/klasifikasi/page', [
            'klasifikasis' => Ebook_klasifikasi::latest()->get(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'kode' => ['required', 'string', 'max:50'],
            'kategori' => ['nullable', 'string', 'max:255'],
            'deskripsi' => ['required', 'string'],
        ]);

        Ebook_klasifikasi::create($validated);

        return back()->with(
            'success',
            'Klasifikasi berhasil ditambahkan'
        );
    }

    public function update(
        Request $request,
        Ebook_klasifikasi $klasifikasi_ebook
    ) {
        $validated = $request->validate([
            'kode' => ['required', 'string', 'max:50'],
            'kategori' => ['nullable', 'string', 'max:255'],
            'deskripsi' => ['required', 'string'],
        ]);

        $klasifikasi_ebook->update($validated);

        return back();
    }

    public function destroy(
        Ebook_klasifikasi $klasifikasi_ebook
    ) {
        $klasifikasi_ebook->delete();

        return back()->with(
            'success',
            'Klasifikasi berhasil dihapus'
        );
    }
}
