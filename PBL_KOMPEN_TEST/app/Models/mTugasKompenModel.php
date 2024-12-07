<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mTugasKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen';
    protected $primaryKey = 'id_tugas_kompen';

    protected $fillable = [
        'id_mahasiswa',
        'id_tugas_admin',
        'id_tugas_dosen',
        'id_tugas_tendik',
        'status_penerimaan',
        'tanggal_apply'
    ];

    // Relasi ke tugas admin
    public function tugasAdmin()
    {
        return $this->belongsTo(TugasAdminModel::class, 'id_tugas_admin');
    }

    // Relasi ke tugas dosen
    public function tugasDosen()
    {
        return $this->belongsTo(TugasDosenModel::class, 'id_tugas_dosen');
    }

    // Relasi ke tugas tendik
    public function tugasTendik()
    {
        return $this->belongsTo(TugasTendikModel::class, 'id_tugas_tendik');
    }

    // Relasi ke mahasiswa
    public function mahasiswa()
    {
        return $this->belongsTo(MahasiswaModel::class, 'id_mahasiswa');
    }
}

