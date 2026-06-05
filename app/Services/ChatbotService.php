<?php

namespace App\Services;

class ChatbotService
{
    public function __construct(
        protected DokumentasiSearchService $searchService,
        protected GeminiChatService $geminiService,
    ) {}

    public function ask(string $question): string
    {
        $chunks = $this->searchService
            ->search($question);

        $context = $chunks
            ->pluck('content')
            ->implode("\n\n");

        return $this->geminiService
            ->ask($question, $context);
    }
}