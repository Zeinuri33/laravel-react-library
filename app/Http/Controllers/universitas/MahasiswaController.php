<?php

namespace App\Http\Controllers\universitas;

use App\Http\Controllers\Controller;
use App\Models\Universitas\Mahasiswa;
use App\Models\Universitas\Prodi;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MahasiswaController extends Controller
{
    //
    public function index()
    {
        $mahasiswas = Mahasiswa::with('prodi.fakultas')
            ->latest()
            ->get();

        $prodis = Prodi::with('fakultas')->get();

        return Inertia::render('universitas/mahasiswa/page', [
            'mahasiswas' => $mahasiswas,
            'prodis' => $prodis,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'lulusan' => 'required|string|max:255',
            'nim' => 'required|string|max:255|unique:mahasiswas,nim',
            'nama' => 'required|string|max:255',
            'jk' => 'required|string|max:10',
            'prodi_id' => 'required|exists:prodis,id',
            'kecamatan' => 'nullable|string|max:255',
            'kabupaten' => 'nullable|string|max:255',
            'provinsi' => 'nullable|string|max:255',
            'tugas_akhir' => 'nullable|string|max:255',
        ]);

        Mahasiswa::create($request->all());

        return redirect()->back()->with('success', 'Data mahasiswa berhasil ditambahkan');
    }

    public function update(Request $request, Mahasiswa $mahasiswa)
    {
        $request->validate([
            'lulusan' => 'required|string|max:255',
            'nim' => 'required|string|max:255|unique:mahasiswas,nim,' . $mahasiswa->id,
            'nama' => 'required|string|max:255',
            'jk' => 'required|string|max:10',
            'prodi_id' => 'required|exists:prodis,id',
            'kecamatan' => 'nullable|string|max:255',
            'kabupaten' => 'nullable|string|max:255',
            'provinsi' => 'nullable|string|max:255',
            'tugas_akhir' => 'nullable|string|max:255',
        ]);

        $mahasiswa->update($request->all());

        return redirect()->back()->with('success', 'Data mahasiswa berhasil diupdate');
    }

    public function destroy(Mahasiswa $mahasiswa)
    {
        $mahasiswa->delete();

        return redirect()->back()->with('success', 'Data mahasiswa berhasil dihapus');
    }
}
