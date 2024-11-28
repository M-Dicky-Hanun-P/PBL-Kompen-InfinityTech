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
        Schema::create('t_detail_bidkom', function (Blueprint $table) {
            $table->id('detail_bidkom_id');
            $table->unsignedBigInteger('mahasiswa_id')->index();
            $table->unsignedBigInteger('bidkom_id')->index();
            $table->timestamps();

            $table->foreign('mahasiswa_id')->references('mahasiswa_id')->on('m_mahasiswa');
            $table->foreign('bidkom_id')->references('bidkom_id')->on('m_bidang_kompetensi');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_detail_bidkom');
    }
};
