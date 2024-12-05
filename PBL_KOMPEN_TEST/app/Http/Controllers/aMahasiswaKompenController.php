<?php

namespace App\Http\Controllers;

use App\Models\KompenModel;
use App\Models\MahasiswaModel;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yajra\DataTables\Facades\DataTables;

class aMahasiswaKompenController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Daftar Mahasiswa Kompen',
            'list' => ['Home', 'Mahasiswa Kompen']
        ];

        $page = (object)[
            'title' => 'Daftar Mahasiswa Kompen',
        ];

        $aMahasiswaKompen = MahasiswaModel::all();

        $activeMenu = 'aMahasiswaKompen';

        return view('aMahasiswaKompen.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'aMahasiswaKompen' => $aMahasiswaKompen, 'activeMenu' => $activeMenu]);
    }

    public function list(Request $request)
    {
        $aMahasiswaKompen = KompenModel::select('id_kompen', 'id_mahasiswa', 'jumlah_alpha_sudah_dikerjakan', 'id_alpha', 'id_periode')
            ->with('mahasiswa')
            ->with('periode')
            ->with('alpha');

        // if ($request -> nim) {
        //     $aDosens->where('nim', $request->nim);
        // }

        return DataTables::of($aMahasiswaKompen)
            ->addIndexColumn()
            ->addColumn('aksi', function ($aMahasiswaKompen) {
                $btn = '<button onclick="modalAction(\'' . url('/aMahasiswaKompen/' . $aMahasiswaKompen->id_kompen . '/show_ajax') . '\')" class="btn btn-info btn-sm">Detail</button>';
                return $btn;
            })
            ->rawColumns(['aksi'])
            ->make(true);
    }

    public function show_ajax(string $id)
    {
        $aMahasiswaKompen = KompenModel::find($id);

        return view('aMahasiswaKompen.show_ajax', ['aMahasiswaKompen' => $aMahasiswaKompen]);
    }

    public function import()
    {
        return view('aMahasiswaKompen.import');
    }

    public function import_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                // validasi file harus xls atau xlsx, max 1MB
                'file_mahasiswa' => ['required', 'mimes:xlsx', 'max:2048']
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors()
                ]);
            }

            $file = $request->file('file_mahasiswa');  // ambil file dari request

            $reader = IOFactory::createReader('Xlsx');  // load reader file excel
            $reader->setReadDataOnly(true);             // hanya membaca data
            $spreadsheet = $reader->load($file->getRealPath()); // load file excel
            $sheet = $spreadsheet->getActiveSheet();    // ambil sheet yang aktif

            $data = $sheet->toArray(null, false, true, true);   // ambil data excel

            $insert = [];
            if (count($data) > 1) { // jika data lebih dari 1 baris
                foreach ($data as $baris => $value) {
                    if ($baris > 1) { // baris ke 1 adalah header, maka lewati
                        $insert[] = [
                            'id_kompen' => $value['A'],
                            'id_mahasiswa' => $value['B'],
                            'id_alpha' => $value['C'],
                            'jumlah_jam_sudah_dikerjakan' => $value['D'],
                            'id_periode' => $value['E'],
                        ];
                    }
                }

                if (count($insert) > 0) {
                    // insert data ke database, jika data sudah ada, maka diabaikan
                    KompenModel::insertOrIgnore($insert);
                }

                return response()->json([
                    'status' => true,
                    'message' => 'Data berhasil diimport'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Tidak ada data yang diimport'
                ]);
            }
        }
        return redirect('/aMahasiswaKompen');
    }
}
