<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ManageKompenModel extends Model
{
    use HasFactory;

    protected $table = 'm_tugas_kompen'; // Mendefinisikan nama tabel
    protected $primaryKey = 'id_tugas_kompen'; // Mendefinisikan primary key

    protected $fillable = [
        'deskripsi',
        'status',
        'tanggal_mulai',
        'tanggal_selesai',
        'jam_kompen',
        'kuota',
        'pemberi_tugas',
        'id_jenis_tugas',
        'id_bidkom',
    ];

    public function jenispenugasan(): BelongsTo
    {
        return $this->belongsTo(JenisPenugasanModel::class, 'id_jenis_tugas', 'id_jenis_tugas');
    }

    public function bidangkompetensi(): BelongsTo
    {
        return $this->belongsTo(BidangKompetensiModel::class, 'id_bidkom', 'id_bidkom');
    }

}
