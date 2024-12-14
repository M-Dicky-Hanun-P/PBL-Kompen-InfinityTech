<?php

namespace App\Http\Controllers;

use App\Models\AlphaModel;
use App\Models\TugasKompenModel;
use Illuminate\Http\Request;

class mDashboardController extends Controller
{
    // public function show()
    // {
    //     // Ambil data jumlah alpha dari tabel m_alpha
    //     $jumlahAlpha = AlphaModel::sum('jumlah_alpha');

    //     // Ambil data tugas kompen yang sedang berlangsung
    //     $kompenBerlangsung = TugasKompenModel::where('status_permintaan', 'request')
    //                                          ->count();

    //     // Ambil data tugas kompen yang sudah selesai
    //     $kompenSelesai = TugasKompenModel::where('status_permintaan', 'diterima')
    //                                      ->count();

    //     return view('dashboard.index', compact('jumlahAlpha', 'kompenBerlangsung', 'kompenSelesai'));
    // }

    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Dashboard',
            'list' => ['Home', 'Welcome']
        ];

        $activeMenu = 'dashboard';

        return view('m_welcome', ['breadcrumb' => $breadcrumb, 'activeMenu' => $activeMenu]);
    }

    public function show()
    {
        // Data yang akan ditampilkan di dashboard
        $data = [
            'jumlahAlpha' => AlphaModel::sum('jumlah_alpha'), // Total alpha
            'kompenBerlangsung' => TugasKompenModel::where('status_permintaan', 'request')->count(), // Kompen yang sedang berlangsung
            'kompenSelesai' => TugasKompenModel::where('status_permintaan', 'diterima')->count() // Kompen yang selesai
        ];

        return view('dashboard.index', $data);
    }

    // public function index()
    // {
    //     // Breadcrumb dan menu aktif untuk welcome page
    //     $data = [
    //         'breadcrumb' => (object)[
    //             'title' => 'Dashboard',
    //             'list' => ['Home', 'Welcome']
    //         ],
    //         'activeMenu' => 'dashboard'
    //     ];

    //     return view('m_welcome', $data);
    // }
}
