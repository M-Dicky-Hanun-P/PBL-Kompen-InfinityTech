<?php

namespace App\Http\Controllers;

use App\Models\JenisPenugasanModel;
// use Dotenv\Validator;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class JenisPenugasanController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Manage Jenis Penugasan',
            'list' => ['Home', 'Manage Jenis Penugasan']
        ];

        $page = (object)[
            'title' => 'Manage Jenis Penugasan'
        ];

        $aManageJenisPenugasan = JenisPenugasanModel::all();

        $activeMenu = 'aManageJenisPenugasan';

        return view('aManageJenisPenugasan.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aManageJenisPenugasan' => $aManageJenisPenugasan,'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aManageJenisPenugasans = JenisPenugasanModel::select('id_jenis_tugas', 'jenis_tugas');

        if ($request->jenis_tugas) {
            $aManageJenisPenugasans->where('jenis_tugas', $request->jenis_tugas);
        }

        return DataTables::of($aManageJenisPenugasans)
            ->addIndexColumn()
            ->addColumn('aksi', function ($aManageJenisPenugasans) {
                $btn = '<button onclick="modalAction(\'' . url('/aManageJenisPenugasan/' . $aManageJenisPenugasans->id_jenis_tugas . '/show_ajax') . '\')" class="btn btn-info btn-sm" style="margin-right: 5px;">Detail</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageJenisPenugasan/' . $aManageJenisPenugasans->id_jenis_tugas . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageJenisPenugasan/' . $aManageJenisPenugasans->id_jenis_tugas . '/confirm_ajax') . '\')" class="btn btn-danger btn-sm" style="margin-left: 5px;">Delete</button>';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function show_ajax(string $id)
    {
        $aManageJenisPenugasan = JenisPenugasanModel::find($id);

        return view('aManageJenisPenugasan.show_ajax', ['aManageJenisPenugasan' => $aManageJenisPenugasan]);
    }

    public function create_ajax()
    {
        $aManageJenisPenugasan = JenisPenugasanModel::select('id_jenis_tugas', 'jenis_tugas')->get();

        return view('aManageJenisPenugasan.create_ajax')->with('aManageJenisPenugasan', $aManageJenisPenugasan);
    }

    public function store_ajax(Request $request)
    {

        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'jenis_tugas' => 'required|string|min:3|max:50|unique:m_jenis_tugas,jenis_tugas',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors(),
                ]);
            }

            JenisPenugasanModel::create($request->all());

            return response()->json([
                'status' => true,
                'message' => 'Data level berhasil disimpan'
            ]);
        }
        return redirect('/aManageJenisPenugasan');
    }

    public function edit_ajax(string $id)
    {
        $aManageJenisPenugasan = JenisPenugasanModel::find($id);

        return view('aManageJenisPenugasan.edit_ajax', ['aManageJenisPenugasan' => $aManageJenisPenugasan]);
    }

    public function update_ajax(Request $request, $id)
{
    if ($request->ajax() || $request->wantsJson()) {
        $rules = [
            'jenis_tugas' => 'required|string|min:3|max:50|unique:m_jenis_tugas,jenis_tugas,' . $id . ',id_jenis_tugas',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'status'   => false,
                'message'  => 'Validasi gagal.',
                'msgField' => $validator->errors()
            ]);
        }

        $check = JenisPenugasanModel::find($id);

        if ($check) {
            $check->update([
                'jenis_tugas' => $request->jenis_tugas,
            ]);

            return response()->json([
                'status'  => true,
                'message' => 'Data berhasil diupdate',
                'data'    => $check // Kirim data terbaru
            ]);
        } else {
            return response()->json([
                'status'  => false,
                'message' => 'Data tidak ditemukan'
            ]);
        }
    }
    return redirect('/aManageJenisPenugasan');
}


}
