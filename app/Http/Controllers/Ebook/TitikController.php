<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Ebooks\Ebook_titik_baca;

class TitikController extends Controller
{

    //
    public function index()
    {
        $titiks = Ebook_titik_baca::latest()->get();

        return Inertia::render('ebook/titikbaca/page', [
            'titiks' => $titiks,
        ]);
    }

    public function create()
    {
        return Inertia::render('ebook/titikbaca/create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama' => ['required', 'string', 'max:255'],
            'latitude' => ['required', 'numeric'],
            'longitude' => ['required', 'numeric'],
            'radius' => ['required', 'integer', 'min:1'],
            'is_active' => ['required', 'boolean'],
        ]);

        Ebook_titik_baca::create($validated);

        return redirect('/titik-ebooks')->with('success', 'Titik baca berhasil ditambahkan');
    }

    public function edit(Ebook_titik_baca $ebook)
    {
        return Inertia::render('ebook/titikbaca/edit', [
            'titik' => $ebook,
        ]);
    }

    public function update(Request $request,Ebook_titik_baca $ebook)
    {
        $validated = $request->validate([
            'nama' => ['required', 'string', 'max:255'],
            'latitude' => ['required', 'numeric'],
            'longitude' => ['required', 'numeric'],
            'radius' => ['required', 'integer', 'min:1'],
            'is_active' => ['required', 'boolean'],
        ]);

        $ebook->update($validated);

        return redirect('/titik-ebooks')->with('success', 'Titik baca berhasil diperbarui');
    }

    public function destroy(Ebook_titik_baca $ebook)
    {
        $ebook->delete();

        return redirect('/titik-ebooks')->with('success', 'Titik baca berhasil dihapus');
    }
}
