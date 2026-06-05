<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class DocKategori extends Model
{
    use HasFactory;

    protected $table = 'doc_kategori';

    protected $fillable = [
        'kategori',
    ];

    public function dokumentasi()
    {
        return $this->hasMany(Dokumentasi::class);
    }
}