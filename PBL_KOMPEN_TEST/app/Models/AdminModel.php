<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Contracts\Auth\Authenticatable;

class AdminModel extends Model implements Authenticatable
{
    use HasFactory;

    protected $table = 'm_admin'; // Mendefinisikan nama tabel

    protected $primaryKey = 'id_admin'; // Mendefinisikan primary key

    protected $fillable = ['id_level', 'username', 'password', 'nip', 'no_telepon', 'email', 'nama', 'avatar'];

    protected $hidden = ['password']; // Menyembunyikan atribut password dari array hasil konversi model

    protected $casts = ['password' => 'hashed']; // Menghaskell password untuk meningkatkan keamanan

    /**
     * Relasi BelongsTo dengan tabel Level.
     */
    public function level(): BelongsTo
    {
        return $this->belongsTo(LevelModel::class, 'id_level', 'id_level');
    }

    /**
     * Mengembalikan nama role dari relasi level.
     */
    public function getRoleName(): string
    {
        return $this->level->level_nama;
    }

    /**
     * Mengecek apakah admin memiliki role tertentu.
     */
    public function hasRole($role): bool
    {
        return $this->level->level_kode === $role;
    }

    /**
     * Mengembalikan kode role admin.
     */
    public function getRole(): string
    {
        return $this->level->level_kode;
    }

    /**
     * Mendapatkan identitas unik dari pengguna.
     */
    public function getAuthIdentifierName()
    {
        return $this->primaryKey;
    }

    /**
     * Mendapatkan nilai identitas unik dari pengguna.
     */
    public function getAuthIdentifier()
    {
        return $this->getAttribute($this->getAuthIdentifierName());
    }

    /**
     * Mendapatkan hash dari password pengguna.
     */
    public function getAuthPassword()
    {
        return $this->getAttribute('password');
    }

    /**
     * Mendapatkan token untuk mengingat pengguna.
     */
    public function getRememberToken()
    {
        return $this->getAttribute('remember_token');
    }

    /**
     * Mengatur token untuk mengingat pengguna.
     */
    public function setRememberToken($value)
    {
        $this->setAttribute('remember_token', $value);
    }

    /**
     * Mendapatkan nama kolom untuk token pengingat.
     */
    public function getRememberTokenName()
    {
        return 'remember_token';
    }
}
