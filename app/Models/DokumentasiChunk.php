<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DokumentasiChunk extends Model
{
    //
    protected $fillable = [
        'dokumentasi_id',
        'content',
        'embedding',
        'chunk_index',
    ];

    protected $casts = [
        'embedding' => 'array',
    ];

    public function dokumentasi()
    {
        return $this->belongsTo(Dokumentasi::class);
    }

    
}
