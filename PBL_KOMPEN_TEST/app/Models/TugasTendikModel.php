<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasTendikModel extends Model
{
    use HasFactory;

    protected $table = 'tugas_tendik';
    protected $primaryKey = 'id_tugas_tendik';

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
        'id_tendik',
    ];
    public function tendik()
    {
        return $this->belongsTo(TendikModel::class, 'id_tendik', 'id_tendik'); 
    }

}
