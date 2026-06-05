<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class GeminiChatService
{
    public function ask(string $question, string $context): string
    {
        $prompt = "
Anda adalah AI Assistant Perpustakaan Ibrahimy.

Jawablah hanya berdasarkan dokumentasi berikut.

=== DOKUMENTASI ===

{$context}

=== PERTANYAAN ===

{$question}

Jika informasi tidak ditemukan dalam dokumentasi,
jawab bahwa informasi belum tersedia.
";

        $response = Http::post(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=' . env('GEMINI_API_KEY'),
            [
                'contents' => [
                    [
                        'parts' => [
                            [
                                'text' => $prompt
                            ]
                        ]
                    ]
                ]
            ]
        );

        dd($response->status(), $response->json());

        return data_get(
            $response->json(),
            'candidates.0.content.parts.0.text',
            'Maaf, terjadi kesalahan.'
        );
    }
}