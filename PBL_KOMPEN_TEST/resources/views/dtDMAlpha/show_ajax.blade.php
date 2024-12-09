@extends('layouts.a_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
        <div class="card-tools">
            <button onclick="modalAction('{{ url('/dtDMAlpha/import') }}')" class="btn btn-success fa fa-plus-square"> Import Data</button>
        </div>
    </div>
    <div class="card-body">
        @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
        @endif
        @if (session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
        @endif
        <table class="table table-bordered table-striped table-hover table-sm" id="tabel_alpha">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nama Mahasiswa</th>
                    <th>Jumlah Alpha</th>
                    <th>Semester</th>
                    <th>Tahun Ajaran</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>

<div id="myModal" class="modal fade animate shake" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" data-width="75%" aria-hidden="true"></div>
@endsection

@push('css')
@endpush

@push('js')
<script>
    // Fungsi untuk menampilkan modal
    function modalAction(url = '') {
        $('#myModal').load(url, function() {
            $('#myModal').modal('show');
        });
    }

    var dataMAlpha;

    $(document).ready(function() {
        // Inisialisasi DataTable
        dataMAlpha = $('#tabel_alpha').DataTable({
            processing: true, // Menampilkan loader
            serverSide: true, // Menggunakan server-side processing
            ajax: {
                url: "{{ url('dtDMAlpha/list') }}", // Endpoint data
                type: "POST",
                dataType: "json",
                data: function(d) {
                    d._token = "{{ csrf_token() }}"; // Tambahkan token CSRF
                    d.kode_level = $('#kode_level').val(); // Data filter
                },
                error: function(xhr, error, code) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Terjadi Kesalahan',
                        text: 'Gagal memuat data. Silakan coba lagi.'
                    });
                }
            },
            columns: [
                {
                    data: "DT_RowIndex",
                    className: "text-center",
                    orderable: false,
                    searchable: false
                },
                {
                    data: "mahasiswa.nama",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "jumlah_alpha",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "periode.semester",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "periode.tahun_ajaran",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "aksi",
                    className: "text-center",
                    orderable: false,
                    searchable: false
                }
            ],
            order: [[1, 'asc']] // Mengurutkan berdasarkan kolom Nama Mahasiswa
        });

        // Reload tabel saat filter diubah
        $('#kode_level').on('change', function() {
            dataMAlpha.ajax.reload(); // Reload data
        });
    });
</script>
@endpush
