<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ManageKompenModel;
use Yajra\DataTables\Facades\DataTables;

class dtManageKompenController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Manage Kompen',
            'list' => ['Home', 'Manage Kompen']
        ];

        $page = (object)[
            'title' => 'Manage Kompen'
        ];

        $activeMenu = 'dtManageKompen';

        return view('dtManageKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        // Query untuk mengambil data kompen
        $kompen = ManageKompenModel::select(
            'id_tugas_kompen',
            'nama_tugas',
            'pemberi_tugas',
            'jenis_tugas_kompen',
            'deskripsi',
            'kuota',
            'jam_kompen',
            'status',
            'tanggal_mulai',
            'tanggal_selesai',
            'id_jenis_tugas',
            'id_bidang_kompetensi'
        );

        // Menggunakan DataTables untuk merender data
        return DataTables::of($kompen)
            // menambahkan kolom index / no urut (default nama kolom: DT_RowIndex)
            ->addIndexColumn()
            ->addColumn('aksi', function ($kompen) { // menambahkan kolom aksi
                $btn = '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $kompen->id_tugas_kompen . '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $kompen->id_tugas_kompen . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $kompen->id_tugas_kompen . '/delete_ajax') . '\')" class="btn btn-danger btn-sm">Hapus</button> ';
                return $btn;
            })
            ->rawColumns(['aksi']) // memberitahu bahwa kolom aksi adalah html
            ->make(true);
    }
}
