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
        Schema::table('users', function (Blueprint $table) {
            $table->string('username')->nullable()->after('name');
            $table->string('avatar')->nullable()->after('email');
        });

        // isi username untuk data lama
        DB::table('users')->get()->each(function ($user) {
            DB::table('users')
                ->where('id', $user->id)
                ->update([
                    'username' => 'user' . $user->id
                ]);
        });

        // baru tambahkan unique
        Schema::table('users', function (Blueprint $table) {
            $table->unique('username');
        });
    }
};
