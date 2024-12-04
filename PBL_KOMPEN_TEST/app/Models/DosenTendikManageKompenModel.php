<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DosenTendikManageKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Mendefinisikan nama tabel
    protected $primaryKey = 'id_tugas_kompen'; // Mendefinisikan primary key

    protected $fillable = ['nama_tugas', 'deskripsi', 'status', 'tanggal_mulai', 'tanggal_selesai', 'jam_kompen', 'pemberi_tugas', 'kuota', 'id_jenis_tugas'];
}
