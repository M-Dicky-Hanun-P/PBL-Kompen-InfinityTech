<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Nama tabel di database
    protected $primaryKey = 'id_tugas_kompen'; // Primary key tabel
    public $timestamps = false;

    protected $fillable = [
        'id_tugas_admin',
        'id_tugas_dosen',
        'id_tugas_tendik',
        'id_mahasiswa',
        'status_penerimaan',
        'tanggal_apply'
    ];

    public function jenisTugas()
    {
        return $this->belongsTo(TugasJenisModel::class, 'id_jenis_tugas', 'id_jenis_tugas');
    }
}
