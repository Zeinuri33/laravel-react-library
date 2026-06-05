<?php

namespace App\Services;

use App\Models\DokumentasiChunk;

class DokumentasiSearchService
{
    public function search(string $question)
    {
        return DokumentasiChunk::query()
            ->whereRaw(
                "MATCH(content) AGAINST(? IN NATURAL LANGUAGE MODE)",
                [$question]
            )
            ->limit(5)
            ->get();
    }
}