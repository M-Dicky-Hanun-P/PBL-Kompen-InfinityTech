@extends('layouts.a_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">{{ $page->title }}</h3>
        <div class="card-tools">
            <button onclick="modalAction('{{ url('/dtManageKompen/create') }}')" class="btn btn-success fa fa-plus-square"> Tambah Data</button>
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
        <table class="table table-bordered table-striped table-hover table-sm" id="tabel_manage_kompen">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Level Kode</th>
                    <th>Level Nama</th>
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

    var dataManageKompen;

    $(document).ready(function() {
        // Inisialisasi DataTable
        dataManageKompen = $('#tabel_manage_kompen').DataTable({
            processing: true, // Menampilkan loader
            serverSide: true, // Menggunakan server-side processing
            ajax: {
                url: "{{ url('dtManageKompen/list') }}", // Endpoint data
                type: "POST",
                dataType: "json",
                data: function(d) {
                    d._token = "{{ csrf_token() }}"; // Tambahkan token CSRF
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
                    data: "level_kode",
                    orderable: true,
                    searchable: true
                },
                {
                    data: "level_nama",
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
            order: [[1, 'asc']] // Mengurutkan berdasarkan kolom Level Kode
        });

        // Reload tabel setelah aksi modal selesai
        $('#myModal').on('hidden.bs.modal', function() {
            dataManageKompen.ajax.reload();
        });
    });
</script>
@endpush
