<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use App\Models\Ebooks\Ebook_user;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EbookUserController extends Controller
{
    public function index()
    {
        $users = Ebook_user::latest()->get();

        return Inertia::render('ebook/ebookusers/page', [
            'users' => $users,
        ]);
    }

    public function create()
    {
        return Inertia::render('ebook/ebookusers/create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'email', 'max:255', 'unique:ebook_users,email'],
            'id_anggota' => ['nullable', 'string', 'max:255', 'unique:ebook_users,id_anggota'],
            'prodi' => ['nullable', 'string', 'max:255'],
            'fakultas' => ['nullable', 'string', 'max:255'],
            'jenis_login' => ['required', 'in:google,opac'],
            'is_active' => ['required', 'boolean'],
        ]);

        Ebook_user::create($validated);

        return redirect('/ebook-users')->with('success', 'User ebook berhasil ditambahkan');
    }

    public function edit(Ebook_user $ebook_user)
    {
        return Inertia::render('ebook/ebookusers/edit', [
            'user' => $ebook_user,
        ]);
    }

    public function update(Request $request, Ebook_user $ebook_user)
    {
        $validated = $request->validate([
            'nama' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'email', 'max:255', 'unique:ebook_users,email,' . $ebook_user->id],
            'id_anggota' => ['nullable', 'string', 'max:255', 'unique:ebook_users,id_anggota,' . $ebook_user->id],
            'prodi' => ['nullable', 'string', 'max:255'],
            'fakultas' => ['nullable', 'string', 'max:255'],
            'jenis_login' => ['required', 'in:google,opac'],
            'is_active' => ['required', 'boolean'],
        ]);

        $ebook_user->update($validated);

        return redirect('/ebook-users')->with('success', 'User ebook berhasil diperbarui');
    }

    public function destroy(Ebook_user $ebook_user)
    {
        $ebook_user->delete();

        return redirect('/ebook-users')->with('success', 'User ebook berhasil dihapus');
    }
}
