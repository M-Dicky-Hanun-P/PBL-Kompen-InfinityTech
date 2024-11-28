<?php

namespace App\Http\Controllers\Api;

use App\Models\UserModel;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function __invoke(Request $request)
    {
        // Set validation
        $validator = Validator::make($request->all(), [
            'username' => 'required|unique:m_mahasiswa,username', // Tambahkan validasi unique untuk username
            'nama' => 'required',
            'password' => 'required|min:5|confirmed',
            'id_level' => 'required',
            'nim' => 'required|integer',
            'prodi' => 'required|string|max:50',
            'email' => 'required|string|max:100',
            'tahun_masuk' => 'required|integer',
            'no_telepon' => 'required|string|max:15',
            'avatar' => 'required|file|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // If validations fail
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Handle file upload
        $avatarName = null;
        if ($request->hasFile('avatar')) {
            $avatar = $request->file('avatar');
            $avatarName = time() . '_' . $avatar->getClientOriginalName();
            $avatar->storeAs('public/avatars', $avatarName); // Simpan file di folder storage/app/public/avatars
        }

        // Create user
        $user = UserModel::create([
            'username' => $request->username,
            'nama' => $request->nama,
            'password' => bcrypt($request->password),
            'id_level' => $request->id_level,
            'nim' => $request->nim,
            'prodi' => $request->prodi,
            'email' => $request->email,
            'tahun_masuk' => $request->tahun_masuk,
            'no_telepon' => $request->no_telepon,
            'avatar' => $avatarName,
        ]);

        // Return response JSON if user is created
        if ($user) {
            return response()->json([
                'success' => true,
                'user' => $user,
            ], 201);
        }

        // Return JSON if process insert failed
        return response()->json([
            'success' => false,
        ], 409);
    }
}
