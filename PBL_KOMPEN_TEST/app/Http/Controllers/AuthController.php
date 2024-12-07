<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User; // Pastikan model User diimpor

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
    public function showDosenTendikLogin()
    {
        return view('auth.dtLogin'); // Pastikan view 'auth.dtLogin' ada
    }

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

        return redirect('/login/mahasiswa')->with('success', 'Registrasi berhasil, silakan login');
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
