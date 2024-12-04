@extends('layouts.dt_template')

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

        <table id="kompenTable" class="table table-bordered table-striped table-hover table-sm">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Tugas</th> <!-- Sesuaikan dengan 'nama_tugas' -->
                    <th>Deskripsi</th>
                    <th>Pemberi Tugas</th> <!-- Sesuaikan dengan 'pemberi_tugas' -->
                    <th>Kuota</th> <!-- Sesuaikan dengan 'kuota' -->
                    <th>Jam Kompen</th> <!-- Sesuaikan dengan 'jam_kompen' -->
                    <th>Status</th> <!-- Sesuaikan dengan 'status' -->
                    <th>Waktu Mulai</th> <!-- Sesuaikan dengan 'tanggal_mulai' -->
                    <th>Waktu Selesai</th> <!-- Sesuaikan dengan 'tanggal_selesai' -->
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data akan dimuat di sini oleh JavaScript -->
            </tbody>
        </table>
    </div>
</div>
<div id="myModal" class="modal fade animate shake" tabindex="-1" role="dialog" data-backdrop="static"
    data-keyboard="false" data-width="75%" aria-hidden="true"></div>
@endsection

@section('scripts')
<script>
    $('#kompenTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
        url: '{{ url('dtManageKompen/list') }}',
        type: 'POST',
        data: function (d) {
            d._token = '{{ csrf_token() }}'; // Menambahkan token CSRF
        }
    },
    columns: [
        { data: 'DT_RowIndex', name: 'DT_RowIndex' },
        { data: 'pemberi_tugas', name: 'pemberi_tugas' },
        { data: 'jenis_tugas_kompen', name: 'jenis_tugas_kompen' },
        { data: 'deskripsi', name: 'deskripsi' },
        { data: 'kuota', name: 'kuota' },
        { data: 'jam_kompen', name: 'jam_kompen' },
        { data: 'status', name: 'status' },
        { data: 'tanggal_mulai', name: 'tanggal_mulai' },
        { data: 'tanggal_selesai', name: 'tanggal_selesai' },
        { data: 'aksi', name: 'aksi', orderable: false, searchable: false }
    ]
});

</script>
@endsection
