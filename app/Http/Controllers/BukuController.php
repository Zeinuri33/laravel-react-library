<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;

Route::get('/search-books', function (Request $request) {
    // Backend Anda yang mengambil token dengan aman dari .env
    $apiUrl = env('OPAC_API_URL', 'https://opac.ibrahimy.ac.id/api/BukuApiController.php');
    $token = env('OPAC_API_TOKEN');

    // Menembak ke OPAC dari server, bukan dari browser pengguna
    $response = Http::get($apiUrl, [
        'token' => $token,
        'q'     => $request->input('q', ''),
        'page'  => $request->input('page', 1),
        'limit' => $request->input('limit', 10),
    ]);

    if ($response->successful()) {
        return $response->json();
    }

    return response()->json([
        'status' => 'error',
        'message' => 'Gagal terhubung ke server perpustakaan'
    ], 500);
});
