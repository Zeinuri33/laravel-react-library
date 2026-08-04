<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\OpacService;

class BookSearchController extends Controller
{
    protected $opacService;

    // Inject OpacService secara otomatis
    public function __construct(OpacService $opacService)
    {
        $this->opacService = $opacService;
    }

    public function searchBooks(Request $request)
    {
        $query = $request->input('q', '');
        $page = $request->input('page', 1);
        $limit = $request->input('limit', 10);

        if (empty($query)) {
            return response()->json(['status' => 'success', 'data' => [], 'total_data' => 0]);
        }

        $result = $this->opacService->searchBooks($query, $page, $limit);

        if ($result && $result['status'] === 'success') {
            return response()->json($result);
        }

        // Return empty state yang aman jika terjadi error di backend/OPAC
        return response()->json([
            'status' => 'error',
            'data' => [],
            'total_data' => 0,
            'message' => 'Gagal mengambil data dari server perpustakaan'
        ], 500);
    }
}
