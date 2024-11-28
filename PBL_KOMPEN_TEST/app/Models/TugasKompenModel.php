<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Nama tabel di database
    protected $primaryKey = 'id'; // Primary key tabel
    protected $fillable = [
        'pemberi_tugas',
        'jenis_tugas',
        'deskripsi',
        'kuota',
        'jam_kompen',
        'waktu_pengerjaan',
        'status_permintaan'
    ];

    public function jenisTugas()
    {
        return $this->belongsTo(TugasJenisModel::class, 'id_jenis_tugas', 'id_jenis_tugas');
    }
}
