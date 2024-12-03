<?php

namespace App\Http\Controllers;

use App\Models\TugasKompenModel;
use Illuminate\Http\Request;
use Carbon\Carbon; // Pastikan Carbon di-import

class LihatPilihKompenController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Lihat dan Pilih Kompen',
            'list' => ['Home', 'Lihat dan Pilih Kompen']
        ];

        $page = (object)[
            'title' => 'Lihat dan Pilih Kompen'
        ];

        $activeMenu = 'mLihatPilihKompen';

        // Ambil semua tugas siap kompen
        $tugasKompen = $this->getTugasReady();

        // Return view dengan data tugas
        return view('mLihatPilihKompen.index', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'activeMenu' => $activeMenu,
            'tugasKompen' => $tugasKompen
        ]);
    }

    private function getTugasReady()
    {
        // Ambil semua tugas dengan status 'dibuka'
        return TugasKompenModel::where('status', 'dibuka')
            ->with(['jenisTugas']) // Relasi ke tabel jenis_tugas
            ->get([
                'id_tugas_kompen',
                'nama_tugas',
                'deskripsi',
                'status',
                'tanggal_mulai',
                'tanggal_selesai',
                'jam_kompen',
                'pemberi_tugas',
                'kuota',
                'id_jenis_tugas'
            ])
            ->map(function ($tugas) {
                // Pastikan tanggal_mulai dan tanggal_selesai dikonversi ke objek Carbon
                $tugas->tanggal_mulai = Carbon::parse($tugas->tanggal_mulai);
                $tugas->tanggal_selesai = Carbon::parse($tugas->tanggal_selesai);

                // Hitung waktu pengerjaan berdasarkan tanggal mulai dan tanggal selesai
                $tugas->waktu_pengerjaan = $tugas->tanggal_mulai && $tugas->tanggal_selesai
                    ? $tugas->tanggal_mulai->diffInHours($tugas->tanggal_selesai) // Menghitung dalam jam
                    : 'N/A'; // Jika tidak ada data, tampilkan N/A
                return $tugas;
            });
    }

    // public function applyTugas($id)
    // {
    //     // Mencari tugas berdasarkan ID
    //     $tugas = TugasKompenModel::find($id);

    //     // Pastikan tugas ditemukan
    //     if ($tugas) {
    //         // Jika status permintaan belum ada, update menjadi 'Request'
    //         if ($tugas->status_permintaan == null || $tugas->status_permintaan == '') {
    //             $tugas->status_permintaan = 'request'; // Ubah menjadi 'request'
    //             $tugas->save(); // Simpan perubahan

    //             // Arahkan kembali ke halaman dengan pesan sukses
    //             return redirect()->back()->with('success', 'Permintaan tugas berhasil diajukan.');
    //         }

    //         // Jika tugas sudah dalam status 'Request', beri tahu pengguna
    //         if ($tugas->status_permintaan == 'request') {
    //             return redirect()->back()->with('error', 'Tugas sudah diajukan sebelumnya.');
    //         }

    //         // Jika statusnya sudah diterima atau ditolak, beri tahu pengguna
    //         return redirect()->back()->with('error', 'Tugas sudah memiliki status yang tidak bisa diubah.');
    //     }

    //     // Jika tugas tidak ditemukan
    //     return redirect()->back()->with('error', 'Tugas tidak ditemukan.');
    // }
    public function applyTugas($id)
{
    // Mencari tugas berdasarkan ID
    $tugas = TugasKompenModel::find($id);

    // Pastikan tugas ditemukan
    if ($tugas) {
        if ($tugas->status_permintaan == null || $tugas->status_permintaan == '') {
            $tugas->status_permintaan = 'request'; // Ubah status menjadi 'request'
            $tugas->save();

            // Arahkan kembali ke halaman index dengan pesan sukses
            return redirect()->route('lihatPilihKompen.index')->with('success', 'Permintaan tugas berhasil diajukan.');
        }

        // Jika sudah request atau status lain
        return redirect()->route('lihatPilihKompen.index')->with('error', 'Tugas sudah diajukan sebelumnya.');
    }

    // Jika tugas tidak ditemukan
    return redirect()->route('lihatPilihKompen.index')->with('error', 'Tugas tidak ditemukan.');
}
}
