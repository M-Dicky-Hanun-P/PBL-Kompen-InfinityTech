<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Nama tabel di database
    protected $primaryKey = 'id_tugas_kompen'; // Primary key tabel
    protected $fillable = [
        'nama_tugas',
        'deskripsi',
        'status',
        'tanggal_mulai',
        'tanggal_selesai',
        'jam_kompen',
        'pemberi_tugas',
        'kuota',
        'id_jenis_tugas',
        'status_permintaan'
    ];

    public function jenisTugas()
    {
        return $this->belongsTo(TugasJenisModel::class, 'id_jenis_tugas', 'id_jenis_tugas');
    }
}
