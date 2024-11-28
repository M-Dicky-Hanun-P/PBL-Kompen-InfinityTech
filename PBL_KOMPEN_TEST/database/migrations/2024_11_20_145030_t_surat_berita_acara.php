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
        Schema::create('t_surat_berita_acara', function (Blueprint $table) {
            $table->id('surat_id');
            $table->unsignedBigInteger('mahasiswa_id')->index();
            $table->unsignedBigInteger('progres_tugas_id')->index();
            $table->unsignedBigInteger('tugas_kompeten_id')->index();
            $table->string('qr_code', 255);
            $table->date('tanggal');
            $table->timestamps();

            $table->foreign('mahasiswa_id')->references('mahasiswa_id')->on('m_mahasiswa');
            $table->foreign('progres_tugas_id')->references('progres_tugas_id')->on('t_progres_tugas');
            $table->foreign('tugas_kompeten_id')->references('tugas_kompeten_id')->on('m_tugas_kompeten');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_surat_berita_acara');
    }
};
