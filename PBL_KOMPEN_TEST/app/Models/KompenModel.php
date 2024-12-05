<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class KompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_kompen'; // Mendefinisikan nama tabel

    protected $primaryKey = 'id_kompen'; // Mendefinisikan primary key

    protected $fillable = ['id_mahasiswa', 'id_alpha', 'jumlah_alpha_sudah_dikerjakan', 'id_periode'];

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(MahasiswaModel::class, 'id_mahasiswa', 'id_mahasiswa');
    }

    public function periode(): BelongsTo
    {
        return $this->belongsTo(PeriodeAkademikModel::class, 'id_periode', 'id_periode');
    }

    public function alpha(): BelongsTo
    {
        return $this->belongsTo(AlphaModel::class, 'id_alpha', 'id_alpha');
    }
}
