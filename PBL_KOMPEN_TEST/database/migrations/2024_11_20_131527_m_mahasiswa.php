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
        Schema::create('m_mahasiswa', function (Blueprint $table) {
            $table->id('mahasiswa_id');
            $table->unsignedBigInteger('user_id')->index();
            $table->string('nim', 20);
            $table->string('prodi', 50);
            $table->string('email', 100);
            $table->integer('tahun_masuk');
            $table->integer('no_telpon');
            $table->timestamps();

            $table->foreign('user_id')->references('user_id')->on('m_user');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_mahasiswa');
    }
};
