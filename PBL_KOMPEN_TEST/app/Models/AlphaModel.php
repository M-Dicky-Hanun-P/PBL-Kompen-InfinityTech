<?php

namespace App\Models;

use App\Models\MahasiswaModel;
use App\Models\PeriodeModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlphaModel extends Model
{
    use HasFactory;

    // Nama tabel yang digunakan oleh model
    protected $table = 'm_alpha';

    // Kolom yang dapat diisi (mass assignable)
    protected $fillable = [
        'id_mahasiswa',
        'jumlah_alpha',
        'id_periode',
    ];

    // Menentukan primary key (defaultnya adalah 'id')
    protected $primaryKey = 'id_alpha';

    // Jika kolom 'id_alpha' bukan auto-increment, tentukan sebagai false
    public $incrementing = true;

    // Jika Anda menggunakan timestamp
    public $timestamps = false; // Menyatakan bahwa tabel ini tidak menggunakan kolom 'created_at' dan 'updated_at'
// Relasi dengan model Mahasiswa
public function mahasiswa()
{
    return $this->belongsTo(MahasiswaModel::class, 'id_mahasiswa', 'id_mahasiswa');
}

// Relasi dengan model Periode
public function periode()
{
    return $this->belongsTo(PeriodeModel::class, 'id_periode', 'id_periode');
}
}
