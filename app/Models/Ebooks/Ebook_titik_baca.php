<?php

namespace App\Models\Ebooks;

use Illuminate\Database\Eloquent\Model;

class Ebook_titik_baca extends Model
{
    //
    protected $table = 'ebook_titik_bacas';
    protected $guarded = ['id'];

    public function bacaHistories()
    {
        return $this->hasMany(EbookBacaHistory::class, 'titik_baca_id');
    }

    public function getTotalAksesAttribute()
    {
        return $this->bacaHistories()->count();
    }
}
