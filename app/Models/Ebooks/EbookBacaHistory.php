<?php

namespace App\Models\Ebooks;

use Illuminate\Database\Eloquent\Model;

class EbookBacaHistory extends Model
{
    protected $table = 'ebook_baca_histories';
    protected $guarded = ['id'];

    protected $casts = [
        'started_at' => 'datetime',
        'last_heartbeat_at' => 'datetime',
        'ended_at' => 'datetime',
        'duration_seconds' => 'integer',
        'total_pages_viewed' => 'integer',
        'max_page_reached' => 'integer',
    ];

    public function ebook()
    {
        return $this->belongsTo(Ebook::class);
    }

    public function titikBaca()
    {
        return $this->belongsTo(Ebook_titik_baca::class, 'titik_baca_id');
    }

    public function scopeActiveSession($query)
    {
        return $query->whereNull('ended_at');
    }
}
