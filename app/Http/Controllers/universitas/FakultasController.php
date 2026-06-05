<?php

namespace App\Http\Controllers\universitas;

use App\Http\Controllers\Controller;
use App\Models\Universitas\Fakultas;
use Illuminate\Http\Request;
use Inertia\Inertia;

class FakultasController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $fakultas = Fakultas::latest()->get();

        return Inertia::render('universitas/fakultas/page', [
            'fakultas' => $fakultas
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'fakultas' => 'required|string|max:255',
            'dekan' => 'required|string|max:255',
        ]);

        Fakultas::create($validated);

        return redirect()->back()->with('success', 'Data fakultas berhasil ditambahkan');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Fakultas $fakultas)
    {
        $validated = $request->validate([
            'fakultas' => 'required|string|max:255',
            'dekan' => 'required|string|max:255',
        ]);

        $fakultas->update($validated);

        return redirect()->back()->with('success', 'Data fakultas berhasil diperbarui');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Fakultas $fakultas)
    {
        $fakultas->delete();

        return redirect()->back()->with('success', 'Data fakultas berhasil dihapus');
    }
}
