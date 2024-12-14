<?php

namespace App\Http\Controllers;

use App\Models\TugasKompenModel;
use Illuminate\Http\Request;

class UpdateKompenSelesaiController extends Controller
{
    /**
     * Menampilkan halaman kompen selesai.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // Ambil data tugas kompen yang memiliki status 'diterima'
        $tugasKompenSelesai = TugasKompenModel::where('status_permintaan', 'diterima')->get();

        // Mengirim data tugas kompen selesai ke view
        return view('kompen_selesai.index', compact('tugasKompenSelesai'));
    }

    /**
     * Memperbarui status kompen menjadi selesai.
     *
     * @param Request $request
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        // Mencari tugas kompen berdasarkan ID
        $tugasKompen = TugasKompenModel::find($id);

        // Memastikan tugas kompen ditemukan
        if ($tugasKompen) {
            // Mengubah status tugas kompen menjadi 'selesai'
            $tugasKompen->status_permintaan = 'selesai';
            $tugasKompen->save();

            // Redirect ke halaman yang sama dengan pesan sukses
            return redirect()->route('kompen_selesai.index')->with('success', 'Kompen selesai berhasil diperbarui');
        }

        // Jika tugas kompen tidak ditemukan, redirect ke halaman dengan pesan error
        return redirect()->route('kompen_selesai.index')->with('error', 'Kompen tidak ditemukan');
    }
}
