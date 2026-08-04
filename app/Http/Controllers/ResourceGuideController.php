<?php

namespace App\Http\Controllers;

use App\Models\ResourceGuide;
use App\Models\Universitas\Prodi;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Inertia\Inertia;

class ResourceGuideController extends Controller
{
    /**
     * INDEX
     */
    public function index()
    {
        $resourceGuides = ResourceGuide::with('prodi.fakultas')
            ->latest()
            ->get();

        $totalProdi = Prodi::count();

        return Inertia::render('resource-guide/page', [
            'resourceGuides' => $resourceGuides,
            'totalProdi' => $totalProdi,
        ]);
    }

    /**
     * HALAMAN PUBLIK (seperti /docs)
     */
    public function publicIndex($slug = null)
    {
        $resourceGuides = ResourceGuide::with('prodi.fakultas')
            ->orderBy('prodi_id')
            ->get();

        $activeGuide = null;

        if ($slug) {

            $activeGuide = ResourceGuide::with('prodi.fakultas')
                ->where('slug', $slug)
                ->firstOrFail();

        } else {

            $activeGuide = $resourceGuides->first();
        }

        return Inertia::render('resource-guides', [
            'resourceGuides' => $resourceGuides,
            'activeGuide' => $activeGuide,
        ]);
    }

    /**
     * FORM CREATE
     */
    public function create()
    {
        // Hanya prodi yang BELUM punya resource guide
        $prodis = Prodi::with('fakultas')
            ->whereDoesntHave('resourceGuide')
            ->orderBy('prodi')
            ->get();

        return Inertia::render('resource-guide/create', [
            'prodis' => $prodis,
        ]);
    }

    /**
     * STORE
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'prodi_id' => [
                'required',
                'exists:prodis,id',
                Rule::unique('resource_guides', 'prodi_id'),
            ],
            'konten' => ['required'],
        ]);

        // SLUG DIAMBIL DARI NAMA PRODI (Program Studi = judul)
        $prodi = Prodi::findOrFail($validated['prodi_id']);

        $baseSlug = Str::slug($prodi->prodi);

        $slug = $baseSlug;

        $count = 1;

        while (ResourceGuide::where('slug', $slug)->exists()) {
            $slug = $baseSlug . '-' . $count++;
        }

        ResourceGuide::create([
            'prodi_id' => $validated['prodi_id'],
            'slug' => $slug,
            'konten' => $validated['konten'],
        ]);

        return redirect()
            ->route('resource-guide.index')
            ->with('success', 'Resource Guide berhasil ditambahkan.');
    }

    /**
     * FORM EDIT
     */
    public function edit(ResourceGuide $resourceGuide)
    {
        // Hanya prodi yang belum punya guide, plus prodi milik guide ini
        $prodis = Prodi::with('fakultas')
            ->where(function ($query) use ($resourceGuide) {
                $query->whereDoesntHave('resourceGuide')
                    ->orWhereHas('resourceGuide', fn ($q) =>
                        $q->where('id', $resourceGuide->id)
                    );
            })
            ->orderBy('prodi')
            ->get();

        return Inertia::render('resource-guide/edit', [
            'resourceGuide' => $resourceGuide->load('prodi.fakultas'),
            'prodis' => $prodis,
        ]);
    }

    /**
     * UPDATE
     */
    public function update(Request $request, ResourceGuide $resourceGuide)
    {
        $validated = $request->validate([
            'prodi_id' => [
                'required',
                'exists:prodis,id',
                Rule::unique('resource_guides', 'prodi_id')
                    ->ignore($resourceGuide->id),
            ],
            'konten' => ['required'],
        ]);

        // SLUG DIREGENERASI DARI NAMA PRODI (URL publik tetap akurat)
        $prodi = Prodi::findOrFail($validated['prodi_id']);

        $baseSlug = Str::slug($prodi->prodi);

        $slug = $baseSlug;

        $count = 1;

        while (
            ResourceGuide::where('slug', $slug)
                ->where('id', '!=', $resourceGuide->id)
                ->exists()
        ) {
            $slug = $baseSlug . '-' . $count++;
        }

        $resourceGuide->update([
            'prodi_id' => $validated['prodi_id'],
            'slug' => $slug,
            'konten' => $validated['konten'],
        ]);

        return redirect()
            ->route('resource-guide.index')
            ->with('success', 'Resource Guide berhasil diupdate.');
    }

    /**
     * DELETE
     */
    public function destroy(ResourceGuide $resourceGuide)
    {
        $resourceGuide->delete();

        return back()
            ->with('success', 'Resource Guide berhasil dihapus.');
    }

    /**
     * UPLOAD IMAGE
     */
    public function uploadImage(Request $request)
    {
        $request->validate([
            'image' => ['required', 'image', 'max:2048'],
        ]);

        $path = $request
            ->file('image')
            ->store('resource-guides', 'public');

        return response()->json([
            'url' => asset('storage/' . $path),
        ]);
    }
}
