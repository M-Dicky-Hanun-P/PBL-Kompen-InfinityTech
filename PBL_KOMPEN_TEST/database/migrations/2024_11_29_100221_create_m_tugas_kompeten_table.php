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
        Schema::create('m_tugas_kompeten', function (Blueprint $table) {
            $table->id('tugas_kompeten_id');
            $table->string('nama_tugas', 50);
            $table->string('deskripsi', 255);
            $table->enum('status', ['dibuka', 'ditutup']);
            $table->dateTime('tanggal_mulai');
            $table->dateTime('tanggal_selesai');
            $table->integer('jam_kompen');
            $table->string('pemberi_tugas', 50);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_tugas_kompeten');
    }
};
