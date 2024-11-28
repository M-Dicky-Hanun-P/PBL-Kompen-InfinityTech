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
        Schema::create('t_detail_jenis_kompen', function (Blueprint $table) {
            $table->id('detail_jenis_kompen_id');
            $table->unsignedBigInteger('bidkom_id')->index();
            $table->unsignedBigInteger('jenis_kompen_id')->index();
            $table->timestamps();

            $table->foreign('bidkom_id')->references('bidkom_id')->on('m_bidang_kompetensi');
            $table->foreign('jenis_kompen_id')->references('jenis_kompen_id')->on('m_jenis_kompen');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_detail_jenis_kompen');
    }
};
