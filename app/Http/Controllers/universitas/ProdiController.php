<?php

namespace App\Http\Controllers\universitas;

use App\Http\Controllers\Controller;
use App\Models\Universitas\Fakultas;
use App\Models\Universitas\Prodi;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProdiController extends Controller
{
    //
    public function index()
    {
        $prodis = Prodi::with('fakultas')
            ->orderBy('fakultas_id')
            ->latest()
            ->get();

        $fakultas = Fakultas::all();

        return Inertia::render('universitas/prodi/page', [
            'prodis' => $prodis,
            'fakultas' => $fakultas,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'prodi' => 'required|string|max:255',
            'kode' => 'required|string|max:50',
            'fakultas_id' => 'required|exists:fakultas,id',
            'kontak' => 'nullable|string|max:255',
        ]);

        Prodi::create([
            'prodi' => $request->prodi,
            'kode' => $request->kode,
            'fakultas_id' => $request->fakultas_id,
            'kontak' => $request->kontak,
        ]);

        return back()->with('success', 'Prodi berhasil ditambahkan');
    }

    public function update(Request $request, Prodi $prodi)
    {
        $request->validate([
            'prodi' => 'required|string|max:255',
            'kode' => 'required|string|max:50',
            'fakultas_id' => 'required|exists:fakultas,id',
            'kontak' => 'nullable|string|max:255',
        ]);

        $prodi->update([
            'prodi' => $request->prodi,
            'kode' => $request->kode,
            'fakultas_id' => $request->fakultas_id,
            'kontak' => $request->kontak,
        ]);

        return back()->with('success', 'Prodi berhasil diupdate');
    }

    public function destroy(Prodi $prodi)
    {
        $prodi->delete();

        return back()->with('success', 'Prodi berhasil dihapus');
    }
}
