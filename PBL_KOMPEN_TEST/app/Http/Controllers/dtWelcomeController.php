<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class dtWelcomeController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Dashboard',
            'list' => ['Home', 'Dashboard']
        ];

        $activeMenu = 'dashboard';

        // Statistik jumlah mahasiswa kompen
        $data = [
            'totalMahasiswaKompen' => 50,
            'mahasiswaProses' => 25,
            'mahasiswaSelesai' => 25
        ];

        // Data untuk grafik
        $grafik = [
            ['periode' => 'Genap 2022', 'jumlah' => 50],
            ['periode' => 'Ganjil 2023', 'jumlah' => 75],
            ['periode' => 'Genap 2023', 'jumlah' => 100],
            ['periode' => 'Ganjil 2024', 'jumlah' => 80]
        ];

        return view('dt_welcome', [
            'breadcrumb' => $breadcrumb,
            'activeMenu' => $activeMenu,
            'data' => $data,
            'grafik' => $grafik
        ]);
    }
}
