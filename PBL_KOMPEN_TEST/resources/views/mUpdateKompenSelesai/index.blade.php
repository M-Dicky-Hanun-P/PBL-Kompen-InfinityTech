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
                    <th>Pemberi Kompen</th>
                    <th>Nama Tugas</th>
                    <th>Status</th>
                    <th>Jam Kompen</th>
                    <th>Waktu Pengerjaan</th>
                    <th>Progres</th>
                    <th>Catatan</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($tugasKompen as $key => $tugas)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $tugas->pemberi_tugas }}</td>
                    <td>{{ $tugas->nama_tugas }}</td>
                    <td>{{ $tugas->status }}</td>
                    <td>{{ $tugas->jam_kompen }}</td>
                    <td>{{ $tugas->waktu_pengerjaan }} jam</td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: {{ $tugas->progres }}%;" aria-valuenow="{{ $tugas->progres }}" aria-valuemin="0" aria-valuemax="100">{{ $tugas->progres }}%</div>
                        </div>
                    </td>
                    <td>{{ $tugas->catatan }}</td>
                    <td>
                        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateProgressModal{{ $tugas->id }}">
                            Update Progres
                        </button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="9" class="text-center">Tidak ada tugas yang diterima</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

<!-- Modal untuk Update Progres -->
@foreach ($tugasKompen as $tugas)
<div class="modal fade" id="updateProgressModal{{ $tugas->id }}" tabindex="-1" role="dialog" aria-labelledby="updateProgressModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateProgressModalLabel">Update Progres {{ $tugas->nama_tugas }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('update-progres.store') }}" method="POST">
                @csrf
                <input type="hidden" name="id_tugas_kompen" value="{{ $tugas->id }}">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="progres">Progres (%)</label>
                        <input type="number" class="form-control" id="progres" name="progres" min="0" max="100" value="{{ $tugas->progres }}">
                    </div>
                    <div class="form-group">
                        <label for="catatan">Catatan</label>
                        <textarea class="form-control" id="catatan" name="catatan" rows="3">{{ $tugas->catatan }}</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endforeach
@endsection
