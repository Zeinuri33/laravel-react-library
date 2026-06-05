<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class GeminiEmbeddingService
{
    public function embed(string $text): ?array
    {
        $response = Http::withHeaders([
            'Content-Type' => 'application/json',
        ])->post(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent?key=' . env('GEMINI_API_KEY'),
            [
                'content' => [
                    'parts' => [
                        [
                            'text' => $text,
                        ]
                    ]
                ]
            ]
        );


        if (!$response->successful()) {
            return null;
        }

        return $response->json('embedding.values');
    }
}