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
                    <th>Nama Tugas</th>
                    <th>Pemberi Tugas</th>
                    <th>Jenis Tugas Kompen</th>
                    <th>Deskripsi</th>
                    <th>Kuota</th>
                    <th>Jam Kompen</th>
                    <th>Status</th>
                    <th>Tanggal Mulai</th>
                    <th>Tanggal Selesai</th>
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
    $(document).ready(function() {
        // Inisialisasi DataTable
        $('#kompenTable').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: '{{ url('dtManageKompen/list') }}', // URL untuk mengambil data
                type: 'POST',
                data: function (d) {
                    // Menambahkan data tambahan untuk dikirim ke server, jika diperlukan
                }
            },
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex' }, // Menambahkan nomor urut
                { data: 'nama_tugas', name: 'nama_tugas' }, // Kolom Nama Tugas
                { data: 'pemberi_tugas', name: 'pemberi_tugas' }, // Kolom Pemberi Tugas
                { data: 'jenis_tugas_kompen', name: 'jenis_tugas_kompen' }, // Kolom Jenis Tugas Kompen
                { data: 'deskripsi', name: 'deskripsi' }, // Kolom Deskripsi
                { data: 'kuota', name: 'kuota' }, // Kolom Kuota
                { data: 'jam_kompen', name: 'jam_kompen' }, // Kolom Jam Kompen
                { data: 'status', name: 'status' }, // Kolom Status
                { data: 'tanggal_mulai', name: 'tanggal_mulai' }, // Kolom Tanggal Mulai
                { data: 'tanggal_selesai', name: 'tanggal_selesai' }, // Kolom Tanggal Selesai
                { data: 'aksi', name: 'aksi', orderable: false, searchable: false } // Kolom Aksi
            ]
        });
    });
</script>
@endsection
