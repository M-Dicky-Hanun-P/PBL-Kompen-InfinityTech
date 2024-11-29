<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlphaModel extends Model
{
    use HasFactory;

    use HasFactory;

    protected $table = 'm_alpha';
    protected $fillable = ['alpha_id', 'mahasiswa_id', 'jumlah_alpha', 'periode_id', 'prodi'];
}
