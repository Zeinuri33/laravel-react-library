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
}
