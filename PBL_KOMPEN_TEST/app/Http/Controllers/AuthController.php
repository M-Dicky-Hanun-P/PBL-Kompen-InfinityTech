<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Tampilkan halaman login mahasiswa.
     */
    public function showMahasiswaLogin()
    {
        return view('auth.mLogin');
    }

    /**
     * Proses login mahasiswa.
     */
    public function loginMahasiswa(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        if (Auth::guard('mahasiswa')->attempt($request->only('username', 'password'))) {
            return redirect()->route('mahasiswa.dashboard');
        }

        return back()->withErrors(['loginError' => 'Username atau password salah.']);
    }

    /**
     * Tampilkan halaman login admin.
     */
    public function showAdminLogin()
    {
        return view('auth.aLogin');
    }

    /**
     * Proses login admin.
     */
    public function loginAdmin(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        if (Auth::guard('admin')->attempt($request->only('username', 'password'))) {
            return redirect()->route('admin.dashboard');
        }

        return back()->withErrors(['loginError' => 'Username atau password salah.']);
    }

    /**
     * Tampilkan halaman login dosen/teknisi.
     */
    public function showDosenTeknisiLogin()
{
    return view('auth.dtLogin'); // Pastikan view 'auth.dtLogin' ada
}

public function loginDosenTeknisi(Request $request)
{
    $request->validate([
        'username' => 'required|string',
        'password' => 'required|string',
    ]);

    if (Auth::guard('dosen_teknisi')->attempt($request->only('username', 'password'))) {
        return redirect()->route('dosenTeknisi.index');
    }

    return back()->withErrors(['loginError' => 'Username atau password salah.']);
}


    /**
     * Logout pengguna dari semua jenis guard.
     */
    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }
}
