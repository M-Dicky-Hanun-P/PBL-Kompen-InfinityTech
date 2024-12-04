<?php

namespace App\Http\Controllers;

use App\Models\aManageBidKomModel;
use App\Models\BidangKompetensiModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class aManageBidKomController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Manage Bidang Kompetensi',
            'list' => ['Home', 'Manage Bidang Kompetensi']
        ];

        $page = (object)[
            'title' => 'Manage Bidang Kompetensi'
        ];

        $aManageBidKom = BidangKompetensiModel::all();

        $activeMenu = 'aManageBidKom';

        return view('aManageBidKom.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aManageBidKom' => $aManageBidKom,'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aManageBidKoms = BidangKompetensiModel::select('bidkom_id', 'nama_bidkom', 'tag_bidkom');

        if ($request->nama_bidkom) {
            $aManageBidKoms->where('nama_bidkom', $request->nama_bidkom);
        }

        return DataTables::of($aManageBidKoms)
            ->addIndexColumn()
            ->addColumn('aksi', function ($aManageBidKom) {
                $btn = '<button onclick="modalAction(\'' . url('/aManageBidKom/' . $aManageBidKom->bidkom_id . '/show_ajax') . '\')" class="btn btn-info btn-sm" style="margin-right: 5px;">Detail</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageBidKom/' . $aManageBidKom->bidkom_id . '/edit_ajax') . '\')" class="btn btn-warning btn-sm">Edit</button>';
                $btn .= '<button onclick="modalAction(\'' . url('/aManageBidKom/' . $aManageBidKom->bidkom_id . '/confirm_ajax') . '\')" class="btn btn-danger btn-sm" style="margin-left: 5px;">Delete</button>';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function create_ajax()
    {
        $aManageBidKom = BidangKompetensiModel::select('bidkom_id', 'nama_bidkom', 'tag_bidkom')->get();

        return view('aManageBidKom.create_ajax')->with('aManageBidKom', $aManageBidKom);
    }

    public function store_ajax(Request $request)
    {

        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'nama_bidkom' => 'required|string|min:3|max:50|unique:m_bidang_kompetensi,nama_bidkom',
                'tag_bidkom' => 'required|string|max:100',
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors(),
                ]);
            }

            BidangKompetensiModel::create($request->all());

            return response()->json([
                'status' => true,
                'message' => 'Data level berhasil disimpan'
            ]);
        }
        return redirect('/aManageBidKom');
    }

    public function edit_ajax(string $id)
    {
        $aManageBidKom = BidangKompetensiModel::find($id);

        return view('aManageBidKom.edit_ajax', ['aManageBidKom' => $aManageBidKom]);
    }

    public function show_ajax(string $id)
    {
        $aManageBidKom = BidangKompetensiModel::find($id);

        return view('aManageBidKom.show_ajax', ['aManageBidKom' => $aManageBidKom]);
    }

    public function update_ajax(Request $request, $id)
    {
        // cek apakah request dari ajax
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'nama_bidkom' => 'required|string|min:3|max:50|unique:m_bidang_kompetensi,nama_bidkom,'. $id . 'bidkom_id',
                'tag_bidkom' => 'required|string|max:100',
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

            $check = BidangKompetensiModel::find($id);
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
        return redirect('/aManageBidKom');
    }
}
