<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    // // Menampilkan halaman login
    // public function login(){
    //     if(Auth::check()){
    //         // Jika sudah login, arahkan ke dashboard berdasarkan role
    //         return redirect()->route('dashboard');
    //     }
    //     return view('auth.login');
    // }

    // Login Mahasiswa
    public function loginMahasiswa(Request $request)
    {
        // Validasi input
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        // Coba login
        $credentials = $request->only('username', 'password');
        if (Auth::attempt($credentials)) {
            // Login berhasil, arahkan ke dashboard mahasiswa
            return redirect()->route('dashboard.mahasiswa');
        }

        // Login gagal, kembali ke halaman login dengan pesan error
        return back()->withErrors([
            'loginError' => 'Username atau password salah.',
        ]);
    }

    // Menangani login pengguna berdasarkan role
    public function postLogin(Request $request){
        if($request->ajax() || $request->wantsJson()){
            $credentials = $request->only('username', 'password');

            if(Auth::attempt($credentials)){
                // Setelah login berhasil, cek role pengguna
                $user = Auth::user();
                $role = $user->role; // Misalnya, role tersimpan di kolom 'role' pada tabel users

                // Redirect berdasarkan role
                switch ($role) {
                    case 'admin':
                        return response()->json([
                            'status' => true,
                            'message' => 'Login berhasil sebagai Admin',
                            'redirect' => url('/Admin') // Sesuaikan dengan URL dashboard admin
                        ]);
                    case 'dosen':
                        return response()->json([
                            'status' => true,
                            'message' => 'Login berhasil sebagai Dosen/Tendik',
                            'redirect' => url('/DosenTeknisi') // Sesuaikan dengan URL dashboard dosen
                        ]);
                    case 'mahasiswa':
                        return response()->json([
                            'status' => true,
                            'message' => 'Login berhasil sebagai Mahasiswa',
                            'redirect' => url('/Mahasiswa') // Sesuaikan dengan URL dashboard mahasiswa
                        ]);
                    default:
                        Auth::logout();
                        return response()->json([
                            'status' => false,
                            'message' => 'Role tidak valid'
                        ]);
                }
            }

            // Jika gagal login
            return response()->json([
                'status' => false,
                'message' => 'Login gagal, periksa username atau password'
            ]);
        }
    }

    // Logout dan mengarahkan ke halaman utama
    public function logout(Request $request){
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }
}