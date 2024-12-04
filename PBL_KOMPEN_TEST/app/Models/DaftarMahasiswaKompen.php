<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DaftarMahasiswaKompen extends Model
{
    use HasFactory;

    protected $table = 'm_periode_akademik'; // Mendefinisikan nama tabel
    protected $primaryKey = 'id_periode_akademik'; // Mendefinisikan primary key

    protected $fillable = ['semester', 'tahun_ajaran'];
}
