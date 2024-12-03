<?php

namespace App\Http\Controllers;

use App\Models\AlphaModel;
use App\Models\TugasKompenModel;
use Illuminate\Http\Request;

class mDashboardController extends Controller
{
    public function index()
    {
        // Ambil data jumlah alpha dari tabel m_alpha
        $jumlahAlpha = AlphaModel::sum('jumlah_alpha');

        // Ambil data tugas kompen yang sedang berlangsung
        $kompenBerlangsung = TugasKompenModel::where('status_permintaan', 'request')
                                             ->count();

        // Ambil data tugas kompen yang sudah selesai
        $kompenSelesai = TugasKompenModel::where('status_permintaan', 'diterima')
                                         ->count();

        return view('dashboard.index', compact('jumlahAlpha', 'kompenBerlangsung', 'kompenSelesai'));
    }
}
