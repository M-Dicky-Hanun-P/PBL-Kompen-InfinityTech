<?php

namespace App\Http\Controllers;

use App\Models\FileUploadModel; // Pastikan model ini ada
use Illuminate\Http\Request;

class UpdateKompenSelesaiController extends Controller
{
    public function index(){
        $breadcrumb = (object)[
            'title' => 'Update Kompen Selesai',
            'list' => ['Home', 'Update Kompen Selesai']
        ];

        $page = (object)[
            'title' => 'Update Kompen Selesai'
        ];

        $activeMenu = 'mUpdateKompenSelesai';

        return view('mUpdateKompenSelesai.index', ['breadcrumb' => $breadcrumb, 'page' => $page, 'activeMenu' => $activeMenu]);
    }

    public function store(Request $request)
    {
        // Validasi file upload
        $request->validate([
            'compensation_file' => 'required|file|mimes:pdf,docx,jpg,png|max:10240', // Aturan file
            'notes' => 'nullable|string|max:255',
            'compensation_id' => 'required|exists:compensations,id', // Validasi ID kompensasi
        ]);

        // Proses penyimpanan file
        if ($request->hasFile('compensation_file')) {
            $file = $request->file('compensation_file');
            $filename = time() . '-' . $file->getClientOriginalName();
            $filePath = $file->storeAs('uploads/compensations', $filename); // Menyimpan file

            // Cari kompensasi yang ingin diperbarui
            $compensation = FileUploadModel::find($request->input('compensation_id'));

            // Update status kompensasi dan informasi lainnya
            $compensation->status = 'Selesai'; // Mengubah status menjadi selesai
            $compensation->file_name = $filename; // Nama file
            $compensation->file_path = $filePath; // Lokasi file
            $compensation->notes = $request->input('notes'); // Catatan tambahan
            $compensation->save(); // Simpan perubahan ke database

            return redirect()->back()->with('success', 'Kompen selesai berhasil diupdate!');
        }

        return redirect()->back()->with('error', 'Terjadi kesalahan saat mengunggah berita acara.');
    }
}
