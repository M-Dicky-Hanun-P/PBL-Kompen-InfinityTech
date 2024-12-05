@extends('layouts.a_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
        <div class="card-tools">
            <button onclick="modalAction('{{ url('aUser/create_ajax') }}')" class="btn btn-sm btn-success mt-1">Tambah</button>
        </div>
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
                    <th>ID</th>
                    <th>Username</th>
                    <th>Nama</th>
                    <th>Level
                        Pengguna</th>
                    <th>Avatar</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
<div id="myModal" class="modal fade animate shake" tabindex="-1" role="dialog" data backdrop="static"
    data-keyboard="false" data-width="75%" aria-hidden="true"></div>
@endsection


@push('js')
<script>
    function modalAction(url = '') {
        $('#myModal').load(url, function() {
            $('#myModal').modal('show');
        });
    }

    var dataUser;
    $(document).ready(function() {
        dataUser = $('#table_user').DataTable({
            // serverSide: true, jika ingin menggunakan server side processing 
            serverSide: true,
            ajax: {
                "url": "{{ url('aUser/list') }}",
                "dataType": "json",
                "type": "POST",
                "data": function(d) {
                    d.level_id = $('#level_id').val();
                }
            },
            columns: [{
                // nomor urut dari laravel datatable addIndexColumn() 
                data: "DT_RowIndex",
                className: "text-center",
                orderable: false,
                searchable: false
            }, {
                data: "username",
                className: "",
                // orderable: true, jika ingin kolom ini bisa diurutkan  
                orderable: true,
                // searchable: true, jika ingin kolom ini bisa dicari 
                searchable: true
            }, {
                data: "nama",
                className: "",
                orderable: true,
                searchable: true
            }, {
                // mengambil data level hasil dari ORM berelasi 
                data: "level.level_nama",
                className: "",
                orderable: false,
                searchable: false
            }, {
                data: "avatar",
                className: "",
                orderable: false,
                searchable: false
            }, {
                data: "aksi",
                className: "",
                orderable: false,
                searchable: false
            }]
        });
    });

    $('#level_id').on('change', function() {
        dataUser.ajax.reload();
    });
</script>
@endpush