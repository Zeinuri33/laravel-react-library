<?php

namespace App\Services;

use App\Models\Dokumentasi;
use App\Models\DokumentasiChunk;
use App\Services\GeminiEmbeddingService;

class DokumentasiIndexService
{
    public function __construct(
        protected HtmlToTextService $htmlToTextService,
        protected ChunkingService $chunkingService,
        protected GeminiEmbeddingService $geminiEmbeddingService,
    ) {}

    public function index(Dokumentasi $dokumentasi): void
    {
        // hapus chunk lama
        $dokumentasi->chunks()->delete();

        // html -> text
        $plainText = $this->htmlToTextService
            ->convert($dokumentasi->konten);

        // chunking
        $chunks = $this->chunkingService
            ->chunk($plainText);

        foreach ($chunks as $index => $chunk) {

        $embedding = $this->geminiEmbeddingService
            ->embed($chunk);

        DokumentasiChunk::create([
            'dokumentasi_id' => $dokumentasi->id,
            'content' => $chunk,
            'embedding' => $embedding,
            'chunk_index' => $index,
        ]);
    }
    }

    
}