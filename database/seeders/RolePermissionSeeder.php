<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

    public function run(): void
    {
        // ======================
        // PERMISSIONS
        // ======================

        $permissions = [
            'lihat-user',
            'tambah-user',
            'edit-user',
            'hapus-user',

            'lihat-role',
            'tambah-role',
            'edit-role',
            'hapus-role',

            'lihat-akses',
            'tambah-akses',
            'edit-akses',
            'hapus-akses',

            // Universitas
            'lihat-fakultas',
            'tambah-fakultas',
            'edit-fakultas',
            'hapus-fakultas',

            'lihat-prodi',
            'tambah-prodi',
            'edit-prodi',
            'hapus-prodi',

            // Resource Guide
            'lihat-resource-guide',
            'tambah-resource-guide',
            'edit-resource-guide',
            'hapus-resource-guide',
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }

        // ======================
        // ROLES
        // ======================

        $admin = Role::firstOrCreate(['name' => 'admin']);
        $user = Role::firstOrCreate(['name' => 'user']);

        // ======================
        // ASSIGN PERMISSIONS
        // ======================

        // ADDITIF: berikan permission tanpa menghapus permission lain
        // yang sudah di-assign lewat UI (mis. lihat-dokumentasi, tambah-ebook).
        $admin->givePermissionTo($permissions);

        $user->syncPermissions([
            'lihat-user',
        ]);
    }
}
