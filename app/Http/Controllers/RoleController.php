<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    //
    /**
     * Menampilkan daftar role
     */
    public function index()
    {
        $roles = Role::with('permissions')->get();
        $permissions = Permission::all();

        return Inertia::render('roles/page', [
            'roles' => $roles,
            'permissions' => $permissions,
        ]);
    }

    /**
     * Menyimpan role baru
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:roles,name',
            'permissions' => 'array',
        ]);

        $role = Role::create([
            'name' => $request->name,
        ]);

        // sync permission jika ada
        if ($request->permissions) {
            $role->syncPermissions($request->permissions);
        }

        return back()->with('success', 'Role berhasil ditambahkan');
    }

    /**
     * Update role
     */
    public function update(Request $request, Role $role)
    {
        $request->validate([
            'name' => 'required|string|unique:roles,name,' . $role->id,
            'permissions' => 'array',
        ]);

        $role->update([
            'name' => $request->name,
        ]);

        // update permissions
        $role->syncPermissions($request->permissions ?? []);

        return back()->with('success', 'Role berhasil diperbarui');
    }

    /**
     * Hapus role
     */
    public function destroy(Role $role)
    {
        if (in_array($role->name, ['super-admin'])) {
            return back()->with('error', 'Role ini tidak boleh dihapus');
        }

        if ($role->users()->count() > 0) {
            return back()->with('error', 'Role masih digunakan oleh user');
        }

        $role->delete();

        return back()->with('success', 'Role berhasil dihapus');
    }

}
