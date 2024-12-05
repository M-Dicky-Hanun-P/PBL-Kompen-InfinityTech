@extends('layouts.a_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
        <div class="card-tools">
            <button onclick="modalAction('{{ url('aUserMahasiswa/create_ajax') }}')" class="btn btn-sm btn-success mt-1">Tambah</button>
        </div>
    </div>
    <div class="card-body">
        @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if (session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
        @endif
        <table class="table table-bordered table-striped table-hover table-sm" id="table_mahasiswa">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NIM</th>
                    <th>Nama</th>
                    <th>Program Studi</th>
                    <th>Email</th>
                    <th>Nomor Telepon</th>
                    <th>Tahun Masuk</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
<div id="myModal" class="modal fade animate shake" tabindex="-1" role="dialog" data-backdrop="static"
    data-keyboard="false" data-width="75%" aria-hidden="true"></div>
@endsection

@push('js')
<script>
    function modalAction(url = '') {
        $('#myModal').load(url, function() {
            $('#myModal').modal('show');
        });
    }

    var dataMahasiswa;
    $(document).ready(function() {
        dataMahasiswa = $('#table_mahasiswa').DataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: "{{ url('aUserMahasiswa/list') }}",
                type: "POST",
                data: function(d) {
                    d.tahun_masuk = $('#filter_tahun_masuk').val();
                    d.prodi = $('#filter_prodi').val();
                }
            },
            columns: [{
                    data: "DT_RowIndex",
                    className: "text-center",
                    orderable: false,
                    searchable: false
                },
                {
                    data: "nim",
                    className: "",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "user.nama",
                    className: "",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "prodi",
                    className: "",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "email",
                    className: "",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "no_telepon",
                    className: "",
                    orderable: false,
                    searchable: false
                },
                {
                    data: "tahun_masuk",
                    className: "",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "aksi",
                    className: "text-center",
                    orderable: false,
                    searchable: false
                }
            ]
        });
    });

    $('#filter_tahun_masuk, #filter_prodi').on('change', function() {
        dataMahasiswa.ajax.reload();
    });
</script>
@endpush