<?php

namespace App\Http\Controllers;

use App\Models\M_tugas_kompen;
use App\Models\mTugasKompenModel;
use App\Models\TugasAdminModel;
use App\Models\TugasDosenModel;
use App\Models\TugasTendikModel;
use Carbon\Carbon;
use Illuminate\Http\Request;

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

        // Ambil semua tugas kompen yang siap untuk diakses mahasiswa
        $tugasKompen = $this->getTugasReady();

        return view('mLihatPilihKompen.index', compact('breadcrumb', 'page', 'activeMenu', 'tugasKompen'));
    }

    public function getTugasReady()
    {
        // Ambil ID pengguna yang sedang login (hardcoded untuk uji coba)
        $userId = 3; // Ubah ini ke auth()->user()->id pada deployment sebenarnya

        // Tugas yang sudah diajukan pengguna
        $existingApplications = mTugasKompenModel::where('id_mahasiswa', $userId)->get();

        // Gabungkan tugas dari Admin, Dosen, dan Tendik
        $tugasAdmin = TugasAdminModel::where('status', 'dibuka')->get();
        $tugasDosen = TugasDosenModel::where('status', 'dibuka')->get();
        $tugasTendik = TugasTendikModel::where('status', 'dibuka')->get();

        // Gabungkan semua tugas
        $tugas = collect()
            ->merge($this->formatTugas($tugasAdmin, 'admin', $existingApplications))
            ->merge($this->formatTugas($tugasDosen, 'dosen', $existingApplications))
            ->merge($this->formatTugas($tugasTendik, 'tendik', $existingApplications));

        return $tugas;
    }

    private function formatTugas($tasks, $type, $existingApplications)
    {
        return $tasks->map(function ($task) use ($type, $existingApplications) {
            $existingApplication = $existingApplications->first(function ($app) use ($type, $task) {
                return $app->{'id_tugas_' . $type} == $task->{'id_tugas_' . $type};
            });

            return (object)[
                'id_tugas_kompen' => "{$type}_{$task->{"id_tugas_{$type}"}}",
                'pemberi_tugas' => ucfirst($type),
                'nama_tugas' => $task->nama_tugas,
                'deskripsi' => $task->deskripsi,
                'status' => $task->status,
                'tanggal_mulai' => Carbon::parse($task->tanggal_mulai)->format('d-m-Y'),
                'tanggal_selesai' => Carbon::parse($task->tanggal_selesai)->format('d-m-Y'),
                'jam_kompen' => $task->jam_kompen,
                'kuota' => $task->kuota,
                'status_permintaan' => $existingApplication ? $existingApplication->status_penerimaan : null,
                'waktu_pengerjaan' => Carbon::parse($task->tanggal_mulai)->format('d-m-Y') . ' - ' . Carbon::parse($task->tanggal_selesai)->format('d-m-Y')
            ];
        });
    }

    public function applyTugas($id)
    {
        $userId = 3; // Ubah ke auth()->user()->id

        if (preg_match('/^(admin|dosen|tendik)_(\d+)$/', $id, $matches)) {
            [$fullMatch, $type, $taskId] = $matches;

            $model = match ($type) {
                'admin' => TugasAdminModel::class,
                'dosen' => TugasDosenModel::class,
                'tendik' => TugasTendikModel::class,
            };

            $task = $model::find($taskId);

            if (!$task) {
                return redirect()->route('lihatPilihKompen.index')->with('error', 'Tugas tidak ditemukan.');
            }

            $tugasKompen = new mTugasKompenModel();
            $tugasKompen->{"id_tugas_{$type}"} = $taskId;
            $tugasKompen->id_mahasiswa = $userId;
            $tugasKompen->status_penerimaan = 'request';
            $tugasKompen->tanggal_apply = Carbon::now();
            $tugasKompen->save();

            return redirect()->route('lihatPilihKompen.index')->with('success', "Permintaan tugas {$type} berhasil diajukan.");
        }

        return redirect()->route('lihatPilihKompen.index')->with('error', 'Format ID tugas tidak valid.');
    }
}
