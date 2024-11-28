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
        Schema::create('m_upload', function (Blueprint $table) {
            $table->id('upload_id');
            $table->unsignedBigInteger('surat_id')->index();
            $table->timestamps();

            $table->foreign('surat_id')->references('surat_id')->on('t_surat_berita_acara');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_upload');
    }
};
