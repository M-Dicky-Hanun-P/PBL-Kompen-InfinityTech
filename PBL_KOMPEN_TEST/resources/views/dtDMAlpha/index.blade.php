@extends('layouts.dt_template')

@section('content')
<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">Daftar Mahasiswa Alpha</h3>
        <div class="card-tools">
            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#modal-import">
                <i class="fa fa-upload"></i> Import Data
            </button>
        </div>
    </div>
    <div class="card-body">
        <table class="table table-bordered table-striped table-hover table-sm">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Mahasiswa ID</th>
                    <th>Jumlah Alpha</th>
                    <th>Periode</th>
                    <th>Prodi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>

@include('dtDMAlpha.import')

@endsection
