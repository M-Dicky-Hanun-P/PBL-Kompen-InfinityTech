@extends('layouts.m_template')

@section('content')

<div class="card">
    <div class="card-body" style="background-color: #28A745; color: white;">
        Selamat datang  Fifi Novitasari
    </div>
</div>
{{-- </div>
@endsection --}}

<div class="mt-4">
    <!--begin::Row-->
    <div class="row">
        <!-- Jumlah Alpha -->
        <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box text-bg-danger">
                <span class="info-box-icon">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">Jumlah Alpha</span>
                    <span class="info-box-number">12 Jam</span>
                </div>
            </div>
        </div>

        <!-- Kompen Berlangsung -->
        <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box text-bg-warning">
                <span class="info-box-icon">
                    <i class="bi bi-hourglass-split"></i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">Kompen Berlangsung</span>
                    <span class="info-box-number">8 Jam</span>
                </div>
            </div>
        </div>

        <!-- Kompen Selesai -->
        <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box text-bg-success">
                <span class="info-box-icon">
                    <i class="bi bi-check-circle-fill"></i>
                </span>
                <div class="info-box-content">
                    <span class="info-box-text">Kompen Selesai</span>
                    <span class="info-box-number">24 Jam</span>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

