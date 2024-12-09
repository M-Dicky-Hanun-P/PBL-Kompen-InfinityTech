<?php

namespace App\Http\Controllers;

use App\Models\TugasKompenModel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class aManageKompenController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Manage Kompen',
            'list' => ['Home', 'Manage Kompen']
        ];

        $page = (object)[
            'title' => 'Manage Kompen',
        ];

        $activeMenu = 'aManageKompen';
        // Return view untuk halaman manajemen Tugas Kompen
        return view('aManageKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aManageKompens = TugasKompenModel::select('id_tugas_kompen', 'id_mahasiswa', 'id_tugas_admin', 'status_penerimaan', 'tanggal_apply')
            ->with('tugasadmin')
            ->with('tugasadmin.admin')
            ->with('tugasadmin.bidangkompetensi');

        return DataTables::of($aManageKompens)
            ->addIndexColumn()
            ->addColumn('nama_admin', function ($aManageKompen) {
                return $aManageKompen->tugasadmin->admin->nama ?? '-';
            })
            ->addColumn('tag_kompetensi', function ($aManageKompen) {
                return $aManageKompen->tugasadmin->bidangkompetensi->tag_bidkom ?? '-';
            })
            ->addColumn('aksi', function ($aManageKompen) {
                $btn = '<button onclick="modalAction(\'' . url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/show_ajax') . '\')" class="btn btn-info btn-sm" style="margin-right: 5px;">Detail</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/delete_ajax') . '\')"  class="btn btn-danger btn-sm" style="margin-left: 5px;">Hapus</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/apply') . '\')"  class="btn btn-success btn-sm" style="margin-top: 5px;">Dikerjakan Oleh</button> ';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/close') . '\')"  class="btn btn-warning btn-sm" style="margin-top: 1px;">Tugas Ditutup</button> ';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }
}
