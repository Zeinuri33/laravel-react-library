<?php

namespace App\Console\Commands;

use App\Models\Ebooks\Ebook;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

class MigrateEbookFilesToPrivate extends Command
{
    protected $signature = 'ebooks:migrate-private';

    protected $description = 'Pindahkan file PDF e-book dari disk publik ke disk privat agar tidak bisa diakses lewat URL storage publik';

    public function handle(): int
    {
        $ebooks = Ebook::whereNotNull('file')->get();

        $moved = 0;

        foreach ($ebooks as $ebook) {
            $path = $ebook->file;

            if (!$path) {
                continue;
            }

            // Sudah di disk privat
            if (Storage::disk('local')->exists($path)) {
                continue;
            }

            // Tidak ada di disk publik — biarkan (mungkin sudah hilang)
            if (!Storage::disk('public')->exists($path)) {
                $this->warn("Tidak ditemukan di disk mana pun: {$path}");

                continue;
            }

            Storage::disk('local')->writeStream(
                $path,
                Storage::disk('public')->readStream($path)
            );

            Storage::disk('public')->delete($path);

            $moved++;

            $this->line("Dipindahkan: {$path}");
        }

        $this->info("Selesai. {$moved} file dipindahkan ke disk privat.");

        return self::SUCCESS;
    }
}
