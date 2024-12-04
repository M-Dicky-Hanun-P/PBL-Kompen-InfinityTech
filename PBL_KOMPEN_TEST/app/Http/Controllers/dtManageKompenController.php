<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DosenTendikManageKompenModel;
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
    $kompenData = DosenTendikManageKompenModel::select(
        'id_tugas_kompen', 
        'nama_tugas', 
        'deskripsi', 
        'pemberi_tugas', 
        'kuota', 
        'jam_kompen', 
        'status', 
        'tanggal_mulai', 
        'tanggal_selesai', 
        'id_jenis_tugas'
    );

    // Filter tambahan jika ada parameter yang dikirimkan
    if ($request->pemberi_tugas) {
        $kompenData->where('pemberi_tugas', $request->pemberi_tugas);
    }

    return DataTables::of($kompenData)
        ->addIndexColumn()
        ->addColumn('aksi', function ($data) {
            // Menambahkan tombol aksi seperti Edit, Detail, dan Hapus
            return '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $data->id_tugas_kompen . '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button> ' .
                   '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $data->id_tugas_kompen . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button> ' .
                   '<button onclick="modalAction(\'' . url('/dtManageKompen/' . $data->id_tugas_kompen . '/delete_ajax') . '\')" class="btn btn-danger btn-sm">Hapus</button>';
        })
        ->rawColumns(['aksi'])
        ->make(true);
}

}
