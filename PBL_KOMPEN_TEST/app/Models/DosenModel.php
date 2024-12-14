<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DosenModel extends Model implements Authenticatable
{
    use HasFactory;

    protected $table = 'm_dosen'; // Mendefinisikan nama tabel

    protected $primaryKey = 'id_dosen'; // Mendefinisikan primary key

    protected $fillable = ['id_level', 'username', 'password', 'nip', 'no_telepon', 'email', 'nama', 'avatar'];

    protected $hidden = ['password'];

    protected $casts = ['password' => 'hashed'];

    public function level(): BelongsTo
    {
        return $this->belongsTo(LevelModel::class, 'id_level', 'id_level');
    }

    public function getAuthIdentifierName()
    {
        return 'id_dosen'; // Sesuaikan sesuai dengan field primary key
    }

    public function getAuthIdentifier()
    {
        return $this->getKey();
    }

    public function getAuthPassword()
    {
        return $this->password;
    }

    public function getRememberToken()
    {
        // Implementasikan jika diperlukan untuk autentikasi berbasis token
    }

    public function setRememberToken($value)
    {
        // Implementasikan jika diperlukan untuk autentikasi berbasis token
    }

    public function getRememberTokenName()
    {
        // Implementasikan jika diperlukan untuk autentikasi berbasis token
    }
}
