<?php

namespace App\Http\Controllers;

use App\Models\DataMahasiswaKompenModel;
use App\Models\MahasiswaModel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class aManageDaMaKomController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Manage Data Mahasiswa Kompen',
            'list' => ['Home', 'Manage Data Mahasiswa Kompen']
        ];

        $page = (object)[
            'title' => 'Manage Data Mahasiswa Kompen',
        ];

        $aManageDataMahasiswaKompen = MahasiswaModel::all();

        $activeMenu = 'aManageDataMahasiswaKompen';

        return view('aManageDataMahasiswaKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aManageDataMahasiswaKompen' => $aManageDataMahasiswaKompen, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
{
    $aManageDataMahasiswaKompen = DataMahasiswaKompenModel::select('id_data_mhs_kompen','id_kompen', 'id_mahasiswa', 'id_alpha')
        ->with('mahasiswa', 'kompen', 'alpha');

        return DataTables::of($aManageDataMahasiswaKompen)
        ->addIndexColumn()
        ->addColumn('aksi', function ($aManageDataMahasiswaKompen) {
            $detailUrl = url('/aManageDataMahasiswaKompen/' . $aManageDataMahasiswaKompen->id_data_mhs_kompen . '/show_ajax');
            $editUrl = url('/aManageDataMahasiswaKompen/' . $aManageDataMahasiswaKompen->id_data_mhs_kompen . '/edit');
            $deleteUrl = url('/aManageDataMahasiswaKompen/' . $aManageDataMahasiswaKompen->id_data_mhs_kompen . '/delete');
    
            return '<button onclick="modalAction(\'' . $detailUrl . '\')" class="btn btn-info btn-sm">Detail</button>
                    <a href="' . $editUrl . '" class="btn btn-warning btn-sm">Edit</a>
                    <button onclick="deleteAction(\'' . $deleteUrl . '\')" class="btn btn-danger btn-sm">Delete</button>';
        })
        ->rawColumns(['aksi'])
        ->make(true);
    
}

}
