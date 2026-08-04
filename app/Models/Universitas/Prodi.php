<?php

namespace App\Models\Universitas;

use App\Models\ResourceGuide;
use Illuminate\Database\Eloquent\Model;

class Prodi extends Model
{
    //
    //
    protected $table = 'prodis';
    protected $guarded = ['id'];

    public function fakultas()
    {
        return $this->belongsTo(Fakultas::class);
    }

    public function resourceGuide()
    {
        return $this->hasOne(ResourceGuide::class);
    }
}
