<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DataMahasiswaKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_data_mhs_kompen'; // Mendefinisikan nama tabel

    protected $primaryKey = 'id_data_mhs_kompen'; // Mendefinisikan primary key

    protected $fillable = ['id_mahasiswa', 'id_alpha', 'id_kompen'];

    public function mahasiswa(): BelongsTo
    {
        return $this->belongsTo(MahasiswaModel::class, 'id_mahasiswa', 'id_mahasiswa');
    }

    public function kompen(): BelongsTo
    {
        return $this->belongsTo(KompenModel::class, 'id_kompen', 'id_kompen');
    }

    public function alpha(): BelongsTo
    {
        return $this->belongsTo(AlphaModel::class, 'id_alpha', 'id_alpha');
    }
}
