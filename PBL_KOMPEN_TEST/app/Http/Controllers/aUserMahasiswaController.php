<?php

namespace App\Http\Controllers;

use App\Models\aUserMahasiswaModel;
use App\Models\MahasiswaModel;
use App\Models\UserModel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class aUserMahasiswaController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Mahasiswa',
            'list' => ['Home', 'Mahasiswa']
        ];

        $page = (object)[
            'title' => 'Daftar Mahasiswa'
        ];

        $activeMenu = 'aUserMahasiswa';

        return view('aUserMahasiswa.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aMahasiswas = MahasiswaModel::select('mahasiswa_id', 'user_id', 'nim', 'prodi', 'email', 'tahun_masuk', 'no_telepon')
            ->with(['aUser.aLevel'])
            ->whereHas('aUser.aLevel', function ($query){
                $query->where('level_kode', 'mahasiswa');
            });

        return DataTables::of($aMahasiswas)
            // menambahkan kolom index / no urut (default nama kolom: DT_RowIndex)
            ->addIndexColumn()
            ->addColumn('aksi', function ($aMahasiswa) { // menambahkan kolom aksi
                $btn = '<button onclick="modalAction(\'' . url('/aUserMahasiswa/' . $aMahasiswa->mahasiswa_id . '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/aUserMahasiswa/' . $aMahasiswa->mahasiswa_id . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/aUserMahasiswa/' . $aMahasiswa->mahasiswa_id . '/delete_ajax') . '\')" class="btn btn-danger btn-sm">Hapus</button> ';
                return $btn;
            })
            ->rawColumns(['aksi']) // memberitahu bahwa kolom aksi adalah html
            ->make(true);
    }

    public function create_ajax()
    {
        $aUsers = UserModel::with('aLevel')->select('user_id', 'username')->get();

        return view('aUserMahasiswa.create_ajax', ['aUsers' => $aUsers]);
    }

    public function store_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [

            ];
        }
    }
}
