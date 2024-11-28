<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MahasiswaModel extends Model
{
    use HasFactory;

    protected $table = 'm_mahasiswa'; // Mendefinisikan nama tabel
    protected $primaryKey = 'mahasiswa_id'; // Mendefinisikan primary key

    protected $fillable = ['user_id', 'nim', 'prodi', 'email', 'tahun_masuk', 'no_telepon'];

    // relasi pada m_user
    public function user(): BelongsTo {
        return $this->belongsTo(UserModel::class, 'user_id', 'user_id');
    }

    // relasi pada m_tugas_mahasiswa
    public function tugasMahasiswa(): HasMany {
        return $this->hasMany(TugasMahasiswaModel::class, 'mahasiswa_id', 'mahasiswa_id');
    }

    // relasi pada m_alpha
    public function alpha(): HasMany {
        return $this->hasMany(AlphaModel::class, 'mahasiswa_id', 'mahasiswa_id');
    }
}
