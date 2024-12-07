<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

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
     * Tampilkan halaman registrasi mahasiswa.
     */
    public function showMahasiswaRegister()
    {
        return view('auth.mRegister'); // Halaman untuk form registrasi mahasiswa
    }

    /**
     * Proses registrasi mahasiswa.
     */
    public function registerMahasiswa(Request $request)
    {
        $validated = $request->validate([
            'username' => 'required|unique:users,username',
            'password' => 'required|confirmed|min:6',
            'nama' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'nim' => 'required|unique:users,nim',
        ]);

        // Simpan data ke database
        User::create([
            'username' => $validated['username'],
            'password' => bcrypt($validated['password']),
            'nama' => $validated['nama'],
            'email' => $validated['email'],
            'nim' => $validated['nim'],
            'role' => 'mahasiswa',
        ]);

        return redirect('/register')->with('success', 'Registrasi berhasil, silakan login');
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

        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            if (Auth::user()->role === 'admin') {
                return redirect()->route('admin.dashboard')->with('success', 'Berhasil login sebagai Admin!');
            }

            Auth::logout();
            return back()->withErrors(['error' => 'Anda bukan admin!']);
        }

        return back()->withErrors(['error' => 'Username atau password salah!']);
    }

    /**
     * Tampilkan halaman login dosen/teknisi.
     */
    public function showDosenTendikLogin()
    {
        return view('auth.dtLogin'); // Pastikan view 'auth.dtLogin' ada
    }

    /**
     * Proses login dosen/teknisi.
     */
    public function loginDosenTendik(Request $request)
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
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }
}
