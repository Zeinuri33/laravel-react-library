<?php

namespace App\Models\Universitas;

use Illuminate\Database\Eloquent\Model;

class Fakultas extends Model
{
    //
    protected $table = 'fakultas';
    protected $guarded = ['id'];

    public function prodis()
    {
        return $this->hasMany(Prodi::class);
    }
}
