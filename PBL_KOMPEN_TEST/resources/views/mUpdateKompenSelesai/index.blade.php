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

        <form action="{{ url('/kompensasi/update-selesai') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="compensation_file">Upload Berita Acara</label>
                <input type="file" class="form-control" id="compensation_file" name="compensation_file" required>
            </div>
            <button type="submit" class="btn btn-primary">Unggah</button>
        </form>
    </div>
</div>
@endsection
