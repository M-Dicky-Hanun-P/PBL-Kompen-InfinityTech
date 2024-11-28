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
        Schema::create('t_progres_tugas', function (Blueprint $table) {
            $table->id('progres_tugas_id');
            $table->unsignedBigInteger('tugas_mahasiswa_id')->index();
            $table->unsignedBigInteger('nim')->index();
            $table->enum('status_progres', ['selesai', 'progres']);
            $table->string('progres', 50);
            $table->timestamps();

            $table->foreign('tugas_mahasiswa_id')->references('tugas_mahasiswa_id')->on('m_tugas_mahasiswa');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_progres_tugas');
    }
};
