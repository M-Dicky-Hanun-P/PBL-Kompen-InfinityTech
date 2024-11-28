<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('t_riwayat_kompen', function (Blueprint $table) {
            $table->id('riwayat_id');
            $table->unsignedBigInteger('tugas_kompeten_id')->index();
            $table->unsignedBigInteger('mahasiswa_id')->index();
            $table->dateTime('tanggal_mulai');
            $table->dateTime('tanggal_selesai');
            $table->enum('status_riwayat', ['selesai', 'tidak_selesai']);
            $table->unsignedBigInteger('upload_id')->index();
            $table->timestamps();

            $table->foreign('tugas_kompeten_id')->references('tugas_kompeten_id')->on('m_tugas_kompeten');
            $table->foreign('mahasiswa_id')->references('mahasiswa_id')->on('m_mahasiswa');
            $table->foreign('upload_id')->references('upload_id')->on('m_upload');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_riwayat_kompen');
    }
};
