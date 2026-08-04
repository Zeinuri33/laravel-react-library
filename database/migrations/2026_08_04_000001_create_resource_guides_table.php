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
        Schema::create('resource_guides', function (Blueprint $table) {
            $table->id();

            // Setiap prodi hanya boleh memiliki 1 Resource Guide
            $table->foreignId('prodi_id')
                ->constrained('prodis')
                ->cascadeOnDelete()
                ->unique();

            $table->string('slug')->unique();

            $table->longText('konten');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('resource_guides');
    }
};
