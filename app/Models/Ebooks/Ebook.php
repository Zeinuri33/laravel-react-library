<?php

namespace App\Models\Ebooks;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Ebook extends Model
{
    //
    protected $table = 'ebooks';
    protected $guarded = ['id'];

    /**
     * Slug dihitung otomatis dari judul — TIDAK disimpan di database.
     */
    protected $appends = ['slug'];

    public function getSlugAttribute()
    {
        return Str::slug($this->judul ?? '');
    }

    /**
     * Route model binding: terima ID numerik ATAU slug hasil hitung dari judul.
     * Dengan begitu URL /zonabaca/{slug}/baca maupun /zonabaca/{id}/baca
     * tetap berfungsi tanpa harus menyimpan kolom slug.
     */
    public function resolveRouteBinding($value, $field = null)
    {
        if ($field === null || $field === $this->getRouteKeyName()) {
            if (is_numeric($value)) {
                $ebook = $this->where('id', $value)->first();
                if ($ebook) {
                    return $ebook;
                }
            }
        }

        // Fallback: cocokkan slug hasil hitung dari judul setiap e-book.
        // Hanya ambil kolom yang dibutuhkan untuk pencocokan.
        $slug = Str::slug((string) $value);

        $matchedId = $this->query()
            ->select('id', 'judul')
            ->get()
            ->first(fn (Ebook $ebook) => Str::slug($ebook->judul ?? '') === $slug)
            ?->id;

        return $matchedId ? $this->find($matchedId) : null;
    }

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
