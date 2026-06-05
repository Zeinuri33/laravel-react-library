<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Services\DokumentasiIndexService;

class Dokumentasi extends Model
{
    use HasFactory;

    protected $table = 'dokumentasi';

    protected $fillable = [
        'doc_kategori_id',
        'judul',
        'slug',
        'konten',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function kategori()
    {
        return $this->belongsTo(DocKategori::class, 'doc_kategori_id');
    }

    public function chunks()
    {
        return $this->hasMany(DokumentasiChunk::class);
    }

    protected static function booted(): void
    {
        static::saved(function ($dokumentasi) {

            app(DokumentasiIndexService::class)
                ->index($dokumentasi);

        });
    }
}