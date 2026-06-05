<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
    /**
     * Menampilkan daftar permission
     */
    public function index()
    {
        $permissions = Permission::orderByRaw("
            SUBSTRING_INDEX(name, '-', -1) ASC,
            created_at DESC
        ")->get();

        return Inertia::render('permissions/page', [
            'permissions' => $permissions,
        ]);
    }

    /**
     * Menyimpan permission baru
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:permissions,name',
        ]);

        Permission::create([
            'name' => $request->name,
        ]);

        return back()->with('success', 'Permission berhasil ditambahkan');
    }

    /**
     * Update permission
     */
    public function update(Request $request, Permission $permission)
    {
        $request->validate([
            'name' => 'required|string|unique:permissions,name,' . $permission->id,
        ]);

        $permission->update([
            'name' => $request->name,
        ]);

        return back()->with('success', 'Permission berhasil diperbarui');
    }

    /**
     * Hapus permission
     */
    public function destroy(Permission $permission)
    {
        // opsional: proteksi permission tertentu
        if (in_array($permission->name, ['lihat-akses', 'tambah-akses', 'edit-akses', 'hapus-akses'])) {
            return back()->with('error', 'Permission inti tidak boleh dihapus');
        }

        $permission->delete();

        return back()->with('success', 'Permission berhasil dihapus');
    }
}