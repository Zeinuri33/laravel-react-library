<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ebooks', function (Blueprint $table) {
            $table->id();
            $table->foreignId('klasifikasi_id')->nullable()->constrained('ebook_klasifikasis')->nullOnDelete();
            $table->string('cover')->nullable();
            $table->string('file')->nullable();
            $table->string('judul');
            $table->string('isbn')->nullable();
            $table->string('eisbn')->nullable();
            $table->year('tahun_terbit')->nullable();
            $table->text('penulis')->nullable();
            $table->string('penerbit')->nullable();
            $table->longText('deskripsi')->nullable();
            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ebooks');
    }
};
