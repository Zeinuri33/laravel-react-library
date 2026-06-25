<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('ebook_baca_histories', function (Blueprint $table) {
            $table->foreignId('titik_baca_id')
                ->nullable()
                ->after('ebook_id')
                ->constrained('ebook_titik_bacas')
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('ebook_baca_histories', function (Blueprint $table) {
            $table->dropForeign(['titik_baca_id']);
            $table->dropColumn('titik_baca_id');
        });
    }
};
