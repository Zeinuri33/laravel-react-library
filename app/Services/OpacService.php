<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class OpacService
{
    protected $url;
    protected $token;

    public function __construct()
    {
        $this->url = config('services.opac.url');
        $this->token = config('services.opac.token');
    }

    public function searchBooks($query, $page = 1, $limit = 10)
    {
        try {
            $response = Http::withHeaders([
                    // Memberi tahu OLS bahwa localhost ini adalah domain OPAC
                    'Host'   => 'opac.ibrahimy.ac.id',
                    'Accept' => 'application/json',
                ])
                ->timeout(15)
                ->get($this->url, [
                    'token' => $this->token,
                    'q'     => $query,
                    'page'  => $page,
                    'limit' => $limit,
                ]);

            if ($response->successful()) {
                return $response->json();
            }

            Log::error('OPAC API Error: ' . $response->status() . ' - ' . $response->body());
            return null;

        } catch (\Exception $e) {
            Log::error('OPAC API Exception: ' . $e->getMessage());
            return null;
        }
    }
}
