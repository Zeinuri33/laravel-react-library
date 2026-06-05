<?php

namespace App\Models\Universitas;

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
}
