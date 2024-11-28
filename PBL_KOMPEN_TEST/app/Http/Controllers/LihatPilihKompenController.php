<?php

namespace App\Http\Controllers;

use App\Models\TugasKompenModel;
use Yajra\DataTables\Facades\DataTables;

use Illuminate\Http\Request;

class LihatPilihKompenController extends Controller
{
    // public function index(){
    //     $breadcrumb = (object)[
    //         'title' => 'Lihat dan Pilih Kompen',
    //         'list' => ['Home', 'Lihat dan Pilih Kompen']
    //     ];

    //     $page = (object)[
    //         'title' => 'Lihat dan Pilih Kompen'
    //     ];

    //     $activeMenu = 'mLihatPilihKompen';

    //     return view('mLihatPilihKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
    // }

    // public function getTugasReady(Request $request)
    // {
    //     if ($request->ajax()) {
    //         $data = TugasKompenModel::select([
    //             'id',
    //             'pemberi_tugas',
    //             'jenis_tugas',
    //             'deskripsi',
    //             'kuota',
    //             'jam_kompen',
    //             'waktu_pengerjaan',
    //             'status_permintaan'
    //         ]);

    //         return DataTables::of($data)
    //             ->addIndexColumn()
    //             ->addColumn('aksi', function ($row) {
    //                 return '<a href="/tugas-kompen/ambil/' . $row->id . '" class="btn btn-primary btn-sm">Apply</a>';
    //             })
    //             ->rawColumns(['aksi'])
    //             ->make(true);
    //     }
    // }

    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Lihat dan Pilih Kompen',
            'list' => ['Home', 'Lihat dan Pilih Kompen']
        ];

        $page = (object)[
            'title' => 'Lihat dan Pilih Kompen'
        ];

        $activeMenu = 'mLihatPilihKompen';

        // Ambil semua tugas siap kompen
        $tugasKompen = $this->getTugasReady();

        // Return view dengan data tugas
        return view('mLihatPilihKompen.index', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'activeMenu' => $activeMenu,
            'tugasKompen' => $tugasKompen
        ]);
    }

    private function getTugasReady()
    {
        // Ambil semua tugas dengan status 'dibuka'
        return TugasKompenModel::where('status', 'dibuka')
            ->with(['jenisTugas']) // Relasi ke tabel jenis_tugas jika ada
            ->get([
                'id_tugas_kompen',
                'nama_tugas',
                'deskripsi',
                'kuota',
                'jam_kompen',
                'tanggal_mulai',
                'tanggal_selesai',
                'pemberi_tugas',
                'id_jenis_tugas'
            ]);
    }
}
