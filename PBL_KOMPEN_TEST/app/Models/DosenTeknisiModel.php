<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DosenTeknisiModel extends Model
{
    use HasFactory;

    protected $table = null; // Tabel akan diatur secara dinamis
    protected $primaryKey = null; // Primary key akan diatur secara dinamis

    protected $fillable = [
        'id_level', 
        'username', 
        'password', 
        'nip', 
        'no_telepon', 
        'email', 
        'nama', 
        'avatar'
    ];

    protected $hidden = ['password'];

    protected $casts = [
        'password' => 'hashed',
    ];

    /**
     * Tentukan tipe pengguna (dosen atau tendik) untuk tabel dan primary key.
     */
    public function setType(string $type)
    {
        if ($type === 'dosen') {
            $this->table = 'm_dosen';
            $this->primaryKey = 'id_dosen';
        } elseif ($type === 'tendik') {
            $this->table = 'm_tendik';
            $this->primaryKey = 'id_tendik';
        } else {
            throw new \InvalidArgumentException("Tipe pengguna tidak valid: {$type}");
        }
    }

    /**
     * Relasi ke model LevelModel.
     */
    public function level(): BelongsTo
    {
        return $this->belongsTo(LevelModel::class, 'id_level', 'id_level');
    }

    public function getRoleName(): string
    {
        return $this->level->level_nama;
    }

    public function hasRole(string $role): bool
    {
        return $this->level->level_kode === $role;
    }

    public function getRole()
    {
        return $this->level->level_kode;
    }
}
