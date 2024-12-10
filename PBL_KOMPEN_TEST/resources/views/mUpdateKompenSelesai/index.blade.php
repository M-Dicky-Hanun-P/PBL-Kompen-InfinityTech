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
                        <th style="width: 5%;">No</th>
                        <th style="width: 20%;">Pemberi Kompen</th>
                        <th style="width: 25%;">Nama Tugas</th>
                        <th style="width: 15%;">Status</th>
                        <th style="width: 10%;">Jam Kompen</th>
                        <th style="width: 20%;">Waktu Pengerjaan</th>
                        <th style="width: 10%;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- No data rows yet -->
                </tbody>
            </table>
        </div>
    </div>
    @endsection
