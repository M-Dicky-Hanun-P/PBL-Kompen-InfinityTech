<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasDosenModel extends Model
{
    use HasFactory;

    protected $table = 'tugas_dosen';
    protected $primaryKey = 'id_tugas_dosen';

    protected $fillable = [
        'nama_tugas',
        'deskripsi',
        'status',
        'tanggal_mulai',
        'tanggal_selesai',
        'jam_kompen',
        'kuota',
        'id_bidkom',
        'id_jenis_kompen',
        'id_dosen',
    ];
}
