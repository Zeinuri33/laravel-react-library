<?php

namespace App\Services;

class HtmlToTextService
{
    public function convert(string $html): string
    {
        $text = strip_tags($html);

        $text = preg_replace('/\s+/', ' ', $text);

        return trim($text);
    }
}