<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ManageKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Mendefinisikan nama tabel
    protected $primaryKey = 'id_tugas_kompen'; // Mendefinisikan primary key

    protected $fillable = [
        'nama_tugas',
        'pemberi_tugas',
        'jenis_tugas_kompen',
        'deskripsi',
        'kuota',
        'jam_kompen',
        'status',
        'tanggal_mulai',
        'tanggal_selesai',
        'id_jenis_tugas',
        'id_bidang_kompetensi',
    ];

}
