<?php

namespace App\Http\Controllers\Ebook;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ebooks\Ebook_klasifikasi;
use Inertia\Inertia;

class EbookKlasifikasiController extends Controller
{
    //
    public function index()
{
    return Inertia::render('ebook/klasifikasi/page', [
        'klasifikasis' => Ebook_klasifikasi::latest()->get(),
    ]);
}
}
