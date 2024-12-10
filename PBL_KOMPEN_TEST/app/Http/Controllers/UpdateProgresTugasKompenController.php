<?php

namespace App\Http\Controllers;

use App\Models\mTugasKompenModel;
use App\Models\TugasAdminModel;
use App\Models\TugasDosenModel;
use App\Models\TugasTendikModel;
use App\Models\ProgresTugasModel;
use App\Models\TugasKompenModel;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;

// class UpdateProgresTugasKompenController extends Controller
// {
//     public function index()
//     {
//         $breadcrumb = (object)[
//             'title' => 'Update Progress Penugasan',
//             'list' => ['Home', 'Update Progress Penugasan']
//         ];

//         $page = (object)[
//             'title' => 'Update Progress Penugasan'
//         ];

//         $activeMenu = 'mUpdateProgressTugasKompen';

//         // Hardcoded user ID
//         $userId = 2;

//         // // Ambil semua tugas kompen yang sudah diterima oleh mahasiswa
//         // $tugasKompen = $this->getTugasReady($userId);

//         return view('mUpdateProgresTugasKompen.index', [
//             'breadcrumb' => $breadcrumb,
//             'page' => $page,
//             'activeMenu' => $activeMenu,
//             // 'tugasKompen' => $tugasKompen
//         ]);
//     }

//     public function getTugasReady($userId)
//     {
//         // Ambil tugas kompen yang sudah diterima
//         $tugasKompen = mTugasKompenModel::where('id_mahasiswa', $userId)
//             ->where('status_penerimaan', 'diterima')
//             ->get()
//             ->map(function ($tugas) {
//                 // Determine the task source and type
//                 if ($tugas->id_tugas_admin) {
//                     $task = TugasAdminModel::find($tugas->id_tugas_admin);
//                     $pemberiTugas = 'Admin';
//                 } elseif ($tugas->id_tugas_dosen) {
//                     $task = TugasDosenModel::find($tugas->id_tugas_dosen);
//                     $pemberiTugas = 'Dosen';
//                 } elseif ($tugas->id_tugas_tendik) {
//                     $task = TugasTendikModel::find($tugas->id_tugas_tendik);
//                     $pemberiTugas = 'Tendik';
//                 }

//                 return (object)[
//                     'id' => $tugas->id_tugas_kompen,
//                     'pemberi_tugas' => $pemberiTugas,
//                     'nama_tugas' => $task->nama_tugas,
//                     'status' => $tugas->status_penerimaan,
//                     'jam_kompen' => $task->jam_kompen,
//                     'waktu_pengerjaan' => Carbon::parse($task->tanggal_mulai)->format('d-m-Y') . ' - ' . Carbon::parse($task->tanggal_selesai)->format('d-m-Y'),
//                     'progres' => $tugas->progres ?? 0
//                 ];
//             });

//         return $tugasKompen;
//     }
// }


class UpdateProgresTugasKompenController extends Controller
{
    public function index()
    {
        $breadcrumb = (object)[
            'title' => 'Update Progress Penugasan',
            'list' => ['Home', 'Update Progress Penugasan']
        ];

        $page = (object)[
            'title' => 'Update Progress Penugasan'
        ];

        $activeMenu = 'mUpdateProgressTugasKompen';

        // Hardcoded ID mahasiswa (misalnya 1)
        $userId = 3; // Ganti dengan ID yang sesuai (1, 2, atau 3)

        // Ambil data progres tugas
        $progressData = ProgresTugasModel::select('id_tugas_kompen', 'progress')
            ->get();

        // Ambil semua data tugas yang diterima oleh mahasiswa (status 'diterima')
        $tugasKompen = mTugasKompenModel::select('id_tugas_kompen', 'id_mahasiswa', 'id_tugas_admin', 'id_tugas_dosen', 'id_tugas_tendik', 'status_penerimaan', 'tanggal_apply')
            ->where('id_mahasiswa', $userId)
            ->where('status_penerimaan', 'diterima')
            ->get();

        // Gabungkan data dari tabel progres tugas dan tugas
        $data = [];
        foreach ($progressData as $progress) {
            $tugas = $tugasKompen->first(function ($item) use ($progress) {
                return $item->id_tugas_kompen == $progress->id_tugas_kompen;
            });

            if ($tugas) {
                $pemberiTugas = null;
                $nama_tugas = '';
                $jamKompen = '';
                $waktuPengerjaan = '';

                // Tentukan pemberi tugas dan informasi lainnya berdasarkan id_tugas
                if ($tugas->id_tugas_admin) {
                    $task = TugasAdminModel::find($tugas->id_tugas_admin);
                    $pemberiTugas = 'Admin';
                    $nama_tugas = $task->nama_tugas;
                    $jamKompen = $task->jam_kompen;
                    $waktuPengerjaan = Carbon::parse($task->tanggal_mulai)->format('d-m-Y') . ' - ' . Carbon::parse($task->tanggal_selesai)->format('d-m-Y');
                } elseif ($tugas->id_tugas_dosen) {
                    $task = TugasDosenModel::find($tugas->id_tugas_dosen);
                    $pemberiTugas = 'Dosen';
                    $nama_tugas = $task->nama_tugas;
                    $jamKompen = $task->jam_kompen;
                    $waktuPengerjaan = Carbon::parse($task->tanggal_mulai)->format('d-m-Y') . ' - ' . Carbon::parse($task->tanggal_selesai)->format('d-m-Y');
                } elseif ($tugas->id_tugas_tendik) {
                    $task = TugasTendikModel::find($tugas->id_tugas_tendik);
                    $pemberiTugas = 'Tendik';
                    $nama_tugas = $task->nama_tugas;
                    $jamKompen = $task->jam_kompen;
                    $waktuPengerjaan = Carbon::parse($task->tanggal_mulai)->format('d-m-Y') . ' - ' . Carbon::parse($task->tanggal_selesai)->format('d-m-Y');
                }

                // Gabungkan data untuk view
                $data[] = (object)[
                    'no' => count($data) + 1,
                    'pemberi_kompen' => $pemberiTugas,
                    'nama_tugas' => $nama_tugas,
                    'status' => $tugas->status_penerimaan,
                    'jam_kompen' => $jamKompen,
                    'waktu_pengerjaan' => $waktuPengerjaan,
                    'progres' => $progress->progress ?? '-',
                    'id_tugas_kompen' => $tugas->id_tugas_kompen
                ];
            }
        }

        return view('mUpdateProgresTugasKompen.index', [
            'breadcrumb' => $breadcrumb,
            'page' => $page,
            'activeMenu' => $activeMenu,
            'progressData' => $data
        ]);
    }
    public function fetchTugasData($id)
{
    $task = mTugasKompenModel::find($id);

    // Ensure task exists
    if (!$task) {
        return response()->json(['error' => 'Task not found'], 404);
    }

    // Return modal content
    return view('mUpdateProgresTugasKompen.edit_progres', compact('task'));
}

public function updateProgress(Request $request, $id)
{
    $request->validate([
        'progress' => 'required|string|max:255'
    ]);

    $task = ProgresTugasModel::where('id_tugas_kompen', $id)->first();
    if (!$task) {
        return response()->json(['error' => 'Task not found'], 404);
    }

    // Update progress
    $task->progress = $request->input('progress');
    $task->save();

    return response()->json(['success' => true, 'message' => 'Progress updated successfully']);
}

}
