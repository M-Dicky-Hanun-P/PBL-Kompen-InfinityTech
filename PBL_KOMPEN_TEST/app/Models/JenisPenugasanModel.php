<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JenisPenugasanModel extends Model
{
    use HasFactory;

    protected $table = 'm_jenis_tugas'; // Mendefinisikan nama tabel
    protected $primaryKey = 'id_jenis_tugas'; // Mendefinisikan primary key

    protected $fillable = ['jenis_tugas'];
    
}
