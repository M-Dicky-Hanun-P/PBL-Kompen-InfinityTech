<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\AlphaModel;
use PhpOffice\PhpSpreadsheet\IOFactory;

class DtDMAlphaController extends Controller
{
    public function index()
{
    $breadcrumb = (object)[
        'title' => 'Daftar Mahasiswa Alpha',
        'list' => ['Home', 'Daftar Mahasiswa Alpha']
    ];

    $page = (object)[
        'title' => 'Daftar Mahasiswa Alpha'
    ];

    $activeMenu = 'dtDMAlpha'; // Tentukan menu yang aktif

    return view('dtDMAlpha.index', compact('breadcrumb', 'page', 'activeMenu'));
}


    public function import()
    {
        return view('dtDMAlpha.import');
    }

    public function import_ajax(Request $request)
    {
        if ($request->ajax() || $request->wantsJson()) {
            $rules = [
                'file_alpha' => ['required', 'mimes:xlsx', 'max:1024']
            ];

            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validasi Gagal',
                    'msgField' => $validator->errors()
                ]);
            }

            $file = $request->file('file_alpha');
            $reader = IOFactory::createReader('Xlsx');
            $reader->setReadDataOnly(true);
            $spreadsheet = $reader->load($file->getRealPath());
            $sheet = $spreadsheet->getActiveSheet();
            $data = $sheet->toArray(null, false, true, true);

            $insert = [];
            if (count($data) > 1) {
                foreach ($data as $baris => $value) {
                    if ($baris > 1) {
                        $insert[] = [
                            'mahasiswa_id' => $value['A'],
                            'jumlah_alpha' => $value['B'],
                            'periode_id'   => $value['C'],
                            'prodi'        => $value['D'],
                            'created_at'   => now(),
                        ];
                    }
                }

                if (count($insert) > 0) {
                    AlphaModel::insertOrIgnore($insert);
                }

                return response()->json([
                    'status' => true,
                    'message' => 'Data Mahasiswa Alpha berhasil diimport'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Tidak ada data yang diimport'
                ]);
            }
        }

        return redirect('/');
    }
}
