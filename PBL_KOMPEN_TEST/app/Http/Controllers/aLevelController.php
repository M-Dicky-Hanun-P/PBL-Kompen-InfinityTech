<?php

namespace App\Http\Controllers;

use App\Models\LevelModel;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class aLevelController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Daftar level',
            'list' => ['Home', 'Level']
        ];

        $page = (object)[
            'title' => ''
        ];

        $aLevel = LevelModel::all();

        $activeMenu = 'aLevel'; // set menu yang sedang aktif

        return view('aLevel.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aLevel' => $aLevel, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aLevels = LevelModel::select('level_id', 'level_kode', 'level_nama');

        if ($request->level_kode) {
            $aLevels->where('level_kode', $request->level_kode);
        }

        return DataTables::of($aLevels)
            ->addIndexColumn()
            ->addColumn('aksi', function ($aLevel) {
                $btn = '<button onclick="modalAction(\'' . url('/aLevel/' . $aLevel->level_id . '/show_ajax') . '\')" class="btn btn-info btn-sm" style="margin-right: 5px;">Detail</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aLevel/' . $aLevel->level_id . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aLevel/' . $aLevel->level_id . '/delete_ajax') . '\')" class="btn btn-danger btn-sm" style="margin-left: 5px;">Delete</button>';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function create_ajax()
    {
        $aLevel = LevelModel::select('level_id', 'level_nama')->get();

        return view('aLevel.create_ajax')->with('aLevel', $aLevel);
    }

    public function store_ajax(Request $request)
    {

        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'level_kode' => 'required|string|min:3|max:10|unique:m_level,level_kode',
                'level_nama' => 'required|string|max:100',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors(),
                ]);
            }

            LevelModel::create($request->all());

            return response()->json([
                'status' => true,
                'message' => 'Data level berhasil disimpan'
            ]);
        }
        return redirect('/');
    }

    public function edit_ajax(string $id)
    {
        $aLevel = LevelModel::find($id);

        return view('aLevel.edit_ajax', ['aLevel' => $aLevel]);
    }

    public function show_ajax(string $id)
    {
        $aLevel = LevelModel::find($id);

        return view('aLevel.show_ajax', ['aLevel' => $aLevel]);
    }

    public function update_ajax(Request $request, $id)
    {
        // cek apakah request dari ajax
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'level_kode' => 'required|string|min:3|max:10|unique:m_level,level_kode,' . $id . ',level_id',
                'level_nama' => 'required|string|max:100',
            ];

            // use Illuminate\Support\Facades\Validator;
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status'   => false,    // respon json, true: berhasil, false: gagal
                    'message'  => 'Validasi gagal.',
                    'msgField' => $validator->errors()  // menunjukkan field mana yang error
                ]);
            }

            $check = LevelModel::find($id);
            if ($check) {
                $check->update($request->all());
                return response()->json([
                    'status'  => true,
                    'message' => 'Data berhasil diupdate'
                ]);
            } else {
                return response()->json([
                    'status'  => false,
                    'message' => 'Data tidak ditemukan'
                ]);
            }
        }
        return redirect('/aLevel');
    }

    public function confirm_ajax(string $id)
    {
        $aLevel = LevelModel::find($id);

        return view('aLevel.confirm_ajax', ['aLevel' => $aLevel]);
    }

    public function delete_ajax(Request $request, string $id)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $aLevel = LevelModel::find($id);

            if ($aLevel) {
                $aLevel->delete();
                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil dihapus'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Data tidak ditemukan'
                ]);
            }
            return redirect('/aLevel');
        }
    }
}
