<?php

namespace App\Http\Controllers;

use App\Models\BidangKompetensiModel;
use App\Models\JenisPenugasanModel;
use App\Models\ManageKompenModel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Yajra\DataTables\Contracts\DataTable;
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

        $aManageKompen = ManageKompenModel::all();

        $activeMenu = 'aManageKompen';

        return view('aManageKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aManageKompen' => $aManageKompen, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aManageKompen = ManageKompenModel::with(['jenispenugasan', 'bidangkompetensi'])->get();

        return DataTables::of($aManageKompen)
            ->addIndexColumn()
            ->addColumn('jenis_tugas', function ($row) {
                return $row->jenispenugasan ? $row->jenispenugasan->jenis_tugas : '-';
            })
            ->addColumn('tag_bidkom', function ($row) {
                return $row->bidangkompetensi ? $row->bidangkompetensi->tag_bidkom : '-';
            })
            ->addColumn('aksi', function ($aManageKompen) {
                $detailUrl = url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/show_ajax');
                $editUrl = url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/edit');
                $deleteUrl = url('/aManageKompen/' . $aManageKompen->id_tugas_kompen . '/delete');
                $dikerjakanOleh = '<button class="btn btn-success btn-sm">Dikerjakan Oleh</button>'; // Tombol Dikerjakan Oleh

                return '<button onclick="modalAction(\'' . $detailUrl . '\')" class="btn btn-info btn-sm">Detail</button>
                        <a href="' . $editUrl . '" class="btn btn-warning btn-sm">Edit</a>
                        <button onclick="deleteAction(\'' . $deleteUrl . '\')" class="btn btn-danger btn-sm">Delete</button>
                        ' . $dikerjakanOleh; // Menambahkan tombol Dikerjakan Oleh
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function show_ajax(string $id)
    {
        $aManageKompen = ManageKompenModel::find($id);

        return view('aManageKompen.show_ajax', ['aManageaKompen' => $aManageKompen]);
    }

    public function create_ajax()
{
    // Mengambil data yang dibutuhkan untuk pengisian form (contoh dropdown atau pilihan)
    $jenisPenugasan = JenisPenugasanModel::all(); // Ganti dengan model dan data yang sesuai
    $bidangKompetensi = BidangKompetensiModel::all();

    // Mengirim data ke view
    return view('aManageKompen.create_ajax', [
        'jenisPenugasan' => $jenisPenugasan,
        'bidangKompetensi' => $bidangKompetensi,
    ]);
}


    public function store_ajax(Request $request)
{
    if ($request->ajax() || $request->wantsJson()) {
        $rules = [
            'pemberi_tugas' => 'required|string|max:50',
            'id_jenis_tugas' => 'required|string|max:50',
            'deskripsi' => 'required|string|max:50',
            'kuota' => 'required|integer',
            'jam_kompen' => 'required|integer',
            'status' => 'required|in:dibuka,ditutup', // Validasi status sebagai enum
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after:tanggal_mulai',
            'id_bidkom' => 'required|integer',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validasi Gagal',
                'msgField' => $validator->errors(),
            ]);
        }

        // Menyimpan data
        $data = $request->all();
        ManageKompenModel::create($data);

        return response()->json([
            'status' => true,
            'message' => 'Data tugas kompen berhasil disimpan'
        ]);
    }

    return redirect('aManageKompen');
}

}
