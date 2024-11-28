<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BidangKompetensiModel extends Model
{
    use HasFactory;

    protected $table = 'm_bidang_kompetensi'; // Mendefinisikan nama tabel
    protected $primaryKey = 'bidkom_id'; // Mendefinisikan primary key

    protected $fillable = ['nama_bidkom', 'tag_bidkom'];
}
