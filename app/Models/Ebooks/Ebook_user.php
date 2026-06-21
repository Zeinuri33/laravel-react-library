<?php

namespace App\Models\Ebooks;

use Illuminate\Database\Eloquent\Model;

class Ebook_user extends Model
{
    protected $table = 'ebook_users';
    protected $guarded = ['id'];

    protected $casts = [
        'is_active' => 'boolean',
        'last_login_at' => 'datetime',
    ];

    // Scope aktif
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }
}

