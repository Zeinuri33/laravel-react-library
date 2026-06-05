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
        Schema::create('plagiasita_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('plagiasi_id')->constrained('plagiasi_tas')->cascadeOnDelete();
            $table->string('persentase');
            $table->string('file_hasil');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plagiasita_histories');
    }
};
