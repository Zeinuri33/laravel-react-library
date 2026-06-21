<?php

namespace App\Models\Ebooks;

use Illuminate\Database\Eloquent\Model;

class Ebook extends Model
{
    //
    protected $table = 'ebooks';
    protected $guarded = ['id'];

    public function klasifikasi()
    {
        return $this->belongsTo(Ebook_klasifikasi::class, 'klasifikasi_id');
    }

    public function bacaHistories()
    {
        return $this->hasMany(EbookBacaHistory::class);
    }

    public function getTotalDibacaAttribute()
    {
        return $this->bacaHistories()->count();
    }

    public function getTotalMenitBacaAttribute()
    {
        return (int) ceil($this->bacaHistories()->sum('duration_seconds') / 60);
    }
}
