<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TugasJenisModel extends Model
{
    use HasFactory;

    protected $table = 'm_jenis_tugas';
    protected $primaryKey = 'id';
    protected $fillable = [
        'jenis_tugas',
    ];
}
