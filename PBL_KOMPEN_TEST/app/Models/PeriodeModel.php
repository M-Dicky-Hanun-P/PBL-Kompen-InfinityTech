<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PeriodeModel extends Model
{
    use HasFactory;

    // Tentukan nama tabel jika tidak sesuai dengan nama model secara default
    protected $table = 'm_periode_akademik';

    // Tentukan kolom yang boleh diisi
    protected $fillable = [
        'semester',
        'tahun_ajaran'
    ];

    // Tentukan kolom yang tidak boleh diisi
    protected $guarded = ['id_periode'];
}
