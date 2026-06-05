<?php

namespace App\Services;

class ChunkingService
{
    public function chunk(string $text, int $size = 500): array
    {
        $chunks = [];

        $words = explode(' ', $text);

        $currentChunk = '';

        foreach ($words as $word) {

            if (strlen($currentChunk . ' ' . $word) > $size) {

                $chunks[] = trim($currentChunk);

                $currentChunk = $word;

            } else {

                $currentChunk .= ' ' . $word;
            }
        }

        if (!empty(trim($currentChunk))) {
            $chunks[] = trim($currentChunk);
        }

        return $chunks;
    }
}