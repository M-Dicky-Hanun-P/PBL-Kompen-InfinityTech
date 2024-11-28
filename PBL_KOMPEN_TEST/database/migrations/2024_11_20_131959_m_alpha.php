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
        Schema::create('m_alpha', function (Blueprint $table) {
            $table->id('alpha_id');
            $table->unsignedBigInteger('mahasiswa_id')->index();
            $table->unsignedBigInteger('periode_id')->index();
            $table->integer('jumlah_alpha');
            $table->timestamps();

            $table->foreign('mahasiswa_id')->references('mahasiswa_id')->on('m_mahasiswa');
            $table->foreign('periode_id')->references('periode_id')->on('m_periode_akademik');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_alpha');
    }
};
