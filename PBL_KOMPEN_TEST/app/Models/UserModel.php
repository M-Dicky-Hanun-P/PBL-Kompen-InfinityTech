<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserModel extends Model
{
    use HasFactory;
    protected $table = 'm_user'; // mendefinisian nama tabel
    protected $primaryKey = 'user_id'; // mendefinisikan primary key
    protected $fillable = ['level_id', 'username', 'nama', 'password', 'avatar', 'created_at', 'updated_at'];

    protected $hidden = ['password'];

    protected $casts = ['password' => 'hashed'];

    public function level(): BelongsTo
    {
        return $this->belongsTo(LevelModel::class, 'level_id', 'level_id');
    }

    public function getRoleName(): string
    {
        return $this->level->level_nama;
    }

    public function hasRole($role): bool
    {
        return $this->level->level_kode == $role;
    }

    public function getRole()
    {
        return $this->level->level_kode;
    }

    public function mahasiswa(){
        return $this->hasOne(MahasiswaModel::class, 'user_id');
    }

    public function admin(){
        return $this->hasOne(AdminModel::class, 'user_id');
    }

    public function dosen(){
        return $this->hasOne(DosenModel::class, 'user_id');
    }

    public function tendik(){
        return $this->hasOne(TendikModel::class, 'user_id');
    }
}
