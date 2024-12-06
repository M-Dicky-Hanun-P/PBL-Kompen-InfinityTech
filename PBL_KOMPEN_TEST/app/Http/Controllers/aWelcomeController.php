<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class aWelcomeController extends Controller
{
    public function index()
    {
        // Breadcrumb untuk navigasi
        $breadcrumb = (object) [
            'title' => 'Dashboard', // Judul halaman
            'list' => ['Home', 'Dashboard'] // Jalur navigasi
        ];

        // Aktifkan menu "dashboard" untuk highlight di UI
        $activeMenu = 'dashboard';

        // Statistik jumlah mahasiswa kompen
        $data = [
            'totalMahasiswaKompen' => 50, // Total mahasiswa dalam program
            'mahasiswaProses' => 25, // Mahasiswa yang masih dalam proses
            'mahasiswaSelesai' => 25 // Mahasiswa yang sudah selesai
        ];

        // Data untuk grafik rata-rata jumlah mahasiswa kompen per periode
        $grafik = [
            ['periode' => 'Genap 2022', 'jumlah' => 50],
            ['periode' => 'Ganjil 2023', 'jumlah' => 75],
            ['periode' => 'Genap 2023', 'jumlah' => 100],
            ['periode' => 'Ganjil 2024', 'jumlah' => 80]
        ];

        // Mengirimkan data ke view `a_welcome`
        return view('a_welcome', [
            'breadcrumb' => $breadcrumb, // Breadcrumb untuk navigasi
            'activeMenu' => $activeMenu, // Menu aktif di UI
            'data' => $data, // Statistik mahasiswa kompen
            'grafik' => $grafik // Data untuk grafik
        ]);
    }
}
