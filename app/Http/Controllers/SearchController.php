<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SearchController extends Controller
{
    //
    public function index(Request $request)
    {
        $query = $request->query('q');

        if (!$query) {
            return response()->json([
                'books' => [],
                'wiki' => []
            ]);
        }

        /* ================= OPAC ================= */
        $opacApi = "https://opac.lib.ibrahimy.ac.id/api/BukuApiController.php";
        $token = "lib180597";

        $bookResponse = Http::get($opacApi, [
            'token' => $token,
            'q' => $query
        ]);

        $books = $bookResponse->json()['data'] ?? [];

        /* ================= WIKIPEDIA ================= */
        $wikiResponse = Http::get("https://id.wikipedia.org/w/api.php", [
            'action' => 'query',
            'list' => 'search',
            'format' => 'json',
            'origin' => '*',
            'srsearch' => $query
        ]);

        $wiki = $wikiResponse->json()['query']['search'] ?? [];

        return response()->json([
            'query' => $query,
            'books' => $books,
            'wiki' => $wiki,
        ]);
    }
}
