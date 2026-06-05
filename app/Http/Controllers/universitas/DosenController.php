<?php

namespace App\Http\Controllers\universitas;

use App\Http\Controllers\Controller;
use App\Models\Universitas\Dosen;
use App\Models\Universitas\Prodi;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DosenController extends Controller
{
    //
    public function index()
    {
        $dosens = Dosen::with('prodi.fakultas')
            ->latest()
            ->get();

        $prodis = Prodi::with('fakultas')->get();

        return Inertia::render('universitas/dosen/page', [
            'dosens' => $dosens,
            'prodis' => $prodis,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama' => 'required|string|max:255',
            'nidn' => 'nullable|string|max:50',
            'kontak' => 'nullable|string|max:50',
            'prodi_id' => 'required|exists:prodis,id',
        ]);

        Dosen::create($validated);

        return redirect()->back()->with('success', 'Dosen berhasil ditambahkan');
    }

    public function update(Request $request, Dosen $dosen)
    {
        $validated = $request->validate([
            'nama' => 'required|string|max:255',
            'nidn' => 'nullable|string|max:50',
            'kontak' => 'nullable|string|max:50',
            'prodi_id' => 'required|exists:prodis,id',
        ]);

        $dosen->update($validated);

        return redirect()->back()->with('success', 'Dosen berhasil diupdate');
    }

    public function destroy(Dosen $dosen)
    {
        $dosen->delete();

        return redirect()->back()->with('success', 'Dosen berhasil dihapus');
    }
}
