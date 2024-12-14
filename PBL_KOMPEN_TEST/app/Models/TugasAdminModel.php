<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasAdminModel extends Model
{
    use HasFactory;

    protected $table = 'tugas_admin';
    protected $primaryKey = 'id_tugas_admin';

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
        'id_admin',
    ];

    public function admin()
    {
        return $this->belongsTo(AdminModel::class, 'id_admin', 'id_admin');
    }

}
