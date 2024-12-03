@extends('layouts.m_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
    </div>
    <div class="card-body">
        @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if (session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        <table class="table table-bordered table-striped table-hover table-sm" id="table_user">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Pemberi Tugas</th>
                    <th>Jenis Tugas</th>
                    <th>Deskripsi</th>
                    <th>Kuota</th>
                    <th>Jam Kompen</th>
                    <th>Waktu Pengerjaan</th> <!-- Kolom Waktu Pengerjaan -->
                    <th>Aksi</th>
                    <th>Status Permintaan</th>
                </tr>
            </thead>
            {{-- <tbody>
                @forelse ($tugasKompen as $key => $tugas)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $tugas->pemberi_tugas }}</td>
                    <td>{{ $tugas->jenisTugas->jenis_tugas ?? 'N/A' }}</td>
                    <td>{{ $tugas->deskripsi }}</td>
                    <td>{{ $tugas->kuota }}</td>
                    <td>{{ $tugas->jam_kompen }}</td>
                    <td>{{ $tugas->waktu_pengerjaan }} jam</td> <!-- Menampilkan waktu pengerjaan -->

                    <!-- Tombol Apply hanya muncul jika status belum apply -->
                    <td>
                        @if ($tugas->status_permintaan == null || $tugas->status_permintaan == '')
                            <a href="{{ route('tugas-kompen.apply', ['id' => $tugas->id_tugas_kompen]) }}" class="btn btn-primary btn-sm">Apply</a>
                        @else
                            <button class="btn btn-secondary btn-sm" disabled>Sudah Diajukan</button>
                        @endif
                    </td>

                    <!-- Menampilkan status permintaan -->
                    <td>
                        @if ($tugas->status_permintaan == 'request')
                            Request
                        @elseif ($tugas->status_permintaan == 'diterima')
                            Diterima
                        @elseif ($tugas->status_permintaan == 'ditolak')
                            Ditolak
                        @else
                            Belum Apply
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="text-center">Tidak ada tugas tersedia</td>
                </tr>
                @endforelse
            </tbody> --}}

            <tbody>
                @forelse ($tugasKompen as $key => $tugas)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $tugas->pemberi_tugas }}</td>
                    <td>{{ $tugas->jenisTugas->jenis_tugas ?? 'N/A' }}</td>
                    <td>{{ $tugas->deskripsi }}</td>
                    <td>{{ $tugas->kuota }}</td>
                    <td>{{ $tugas->jam_kompen }}</td>
                    <td>{{ $tugas->waktu_pengerjaan }} jam</td> <!-- Menampilkan waktu pengerjaan -->

                    <!-- Tombol Apply hanya muncul jika status belum apply -->
                    <td>
                        @if ($tugas->status_permintaan == null || $tugas->status_permintaan == '')
                        <a href="{{ route('tugas-kompen.apply', ['id' => $tugas->id_tugas_kompen]) }}" class="btn btn-primary btn-sm">Apply</a>                        @else
                            <button class="btn btn-secondary btn-sm" disabled>Sudah Diajukan</button>
                        @endif
                    </td>

                    <!-- Menampilkan status permintaan -->
                    <td>
                        @if ($tugas->status_permintaan == 'request')
                            Request
                        @elseif ($tugas->status_permintaan == 'diterima')
                            Diterima
                        @elseif ($tugas->status_permintaan == 'ditolak')
                            Ditolak
                        @else
                            
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="8" class="text-center">Tidak ada tugas tersedia</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
