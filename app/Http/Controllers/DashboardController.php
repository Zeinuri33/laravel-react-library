<?php

namespace App\Http\Controllers;

use App\Models\Ebooks\Ebook;
use App\Models\Dokumentasi;
use App\Models\User;
use App\Models\Usulan;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $stats = [
            'totalEbooks' => Ebook::count(),
            'totalDokumentasi' => Dokumentasi::count(),
            'totalUsers' => User::count(),
            'totalUsulan' => Usulan::count(),
        ];

        return Inertia::render('dashboard', $stats);
    }
}
