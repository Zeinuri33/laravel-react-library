<?php

namespace App\Models;

use App\Models\Universitas\Prodi;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ResourceGuide extends Model
{
    use HasFactory;

    protected $table = 'resource_guides';

    protected $fillable = [
        'prodi_id',
        'slug',
        'konten',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function prodi()
    {
        return $this->belongsTo(Prodi::class);
    }
}
