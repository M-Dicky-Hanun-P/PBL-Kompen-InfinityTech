<?php

use App\Http\Controllers\aDMAlphaController;
use App\Http\Controllers\aDMKompenController;
use App\Http\Controllers\aDTAdminController;
use App\Http\Controllers\aDTDosenController;
use App\Http\Controllers\aDTTenknisiController;
use App\Http\Controllers\aLevelController;
use App\Http\Controllers\AlphaController;
use App\Http\Controllers\aManageBidKomController;
use App\Http\Controllers\aManageDaMaKomController;
use App\Http\Controllers\aManageKompenController;
use App\Http\Controllers\aUpdateKompenController;
use App\Http\Controllers\aUserADTController;
use App\Http\Controllers\aUserController;
use App\Http\Controllers\aUserMahasiswaController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\aWelcomeController;
use App\Http\Controllers\dtDMAlphaController;
use App\Http\Controllers\dtDMKompenController;
use App\Http\Controllers\dtManageKompenController;
use App\Http\Controllers\dtUpdateKompenController;
use App\Http\Controllers\dtWelcomeController;
use App\Http\Controllers\JenisPenugasanController;
use App\Http\Controllers\LandingPageController;
use App\Http\Controllers\LihatPilihKompenController;
use App\Http\Controllers\UpdateKompenSelesaiController;
use App\Http\Controllers\UpdateProgresTugasKompenController;
use App\Http\Controllers\WelcomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Landing Page
Route::get('/', [LandingPageController::class, 'index']);

// Login
Route::get('login', [AuthController::class, 'login'])->name('login');
Route::post('login', [AuthController::class, 'postLogin']);

// Logout
Route::get('logout', [AuthController::class, 'logout'])->middleware('auth');

// Welcome for Mahasiswa
Route::get('/Mahasiswa', [WelcomeController::class, 'index']);

// Welcome for Admin
Route::get('/Admin', [aWelcomeController::class, 'index']);

// Welcome for Dosen/Teknisi
Route::get('/DosenTeknisi', [dtWelcomeController::class, 'index']);

// user as Mahasiswa
// Lihat dan Pilih Kompen
Route::get('/mLihatPilihKompen', [LihatPilihKompenController::class, 'index']);

// Update Progres Tugas Kompen
Route::get('/mUpdateProgresTugasKompen', [UpdateProgresTugasKompenController::class, 'index']);

// Update Kompen Selesai
Route::get('/mUpdateKompenSelesai', [UpdateKompenSelesaiController::class, 'index']);

// user as Admin
// User Admin/Dosen/Teknisi
Route::get('/aAdminDosenTeknisi', [aUserADTController::class, 'index']);

// User Mahasiswa
// Route::get('/aMahasiswa', [aUserMahasiswaController::class, 'index']);
// Route::post('/aMahasiswa', [aUserMahasiswaController::class, 'list']);

Route::group(['prefix' => 'aMahasiswa'], function () {
    Route::get('/', [aUserMahasiswaController::class, 'index']);
    Route::post('/list', [aUserMahasiswaController::class, 'list']);
    Route::get('/create_ajax', [aUserMahasiswaController::class, 'create_ajax']);
    Route::post('/ajax', [aUserMahasiswaController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [aUserMahasiswaController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [aUserMahasiswaController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aUserMahasiswaController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aUserMahasiswaController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aUserMahasiswaController::class, 'delete_ajax']);
});


// Daftar Mahasiswa Alpha
Route::get('/aDaftarMahasiswaAlpha', [aDMAlphaController::class, 'index']);

// Daftar Mahasiswa Kompen
Route::get('/aDaftarMahasiswaKompen', [aDMKompenController::class, 'index']);

// Daftar Tugas Dosen
Route::get('/aDaftarTugasDosen', [aDTDosenController::class, 'index']);

// Daftar Tugas Teknisi
Route::get('/aDaftarTugasTeknisi', [aDTTenknisiController::class, 'index']);

// Daftar Tugas Admin
Route::get('/aDaftarTugasAdmin', [aDTAdminController::class, 'index']);

// Manage Bidang Kompetensi
Route::group(['prefix' => 'aManageBidKom'], function () {
    Route::get('/', [aManageBidKomController::class, 'index']);
    Route::post('/list', [aManageBidKomController::class, 'list']);
    Route::get('/create_ajax', [aManageBidKomController::class, 'create_ajax']);
    Route::post('/ajax', [aManageBidKomController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [aManageBidKomController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [aManageBidKomController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aManageBidKomController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aManageBidKomController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aManageBidKomController::class, 'delete_ajax']);
});


// Manage Jenis Penugasan
Route::group(['prefix' => 'aManageJenisPenugasan'], function () {
    Route::get('/', [JenisPenugasanController::class, 'index']);
    Route::post('/list', [JenisPenugasanController::class, 'list']);
    Route::get('/create_ajax', [JenisPenugasanController::class, 'create_ajax']);
    Route::post('/ajax', [JenisPenugasanController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [JenisPenugasanController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [JenisPenugasanController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [JenisPenugasanController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [JenisPenugasanController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [JenisPenugasanController::class, 'delete_ajax']);
});


// Manage Data Mahasiswa Kompen
Route::get('/aManageDataMahasiswaKompen', [aManageDaMaKomController::class, 'index']);

// Manage Kompen
Route::get('/aManageKompen', [aManageKompenController::class, 'index']);

// Update Kompen Selesai
Route::get('/aUpdateKompenSelesai', [aUpdateKompenController::class, 'index']);

// User as Dosen/Teknisi
// Daftar Mahasiswa Alpha
Route::group(['prefix' => 'dtDaftarMahasiswaAlpha'], function () {
    Route::get('/', [dtDMAlphaController::class, 'index']);
    Route::post('/list', [dtDMAlphaController::class, 'list']);
    Route::get('/{id}/show_ajax', [dtDmAlphaController::class, 'show_ajax']);
});

// Daftar Mahasiswa Kompen
Route::get('/dtDaftarMahasiswaKompen', [dtDMKompenController::class, 'index']);

// Manage Kompen
//Route::get('/dtManageKompen', [dtManageKompenController::class, 'index']);

Route::group(['prefix' => 'dtManageKompen'], function () {
    Route::get('/', [dtManageKompenController::class, 'index']);
    Route::post('/list', [dtManageKompenController::class, 'list']);
    Route::get('/create_ajax', [dtManageKompenController::class, 'create_ajax']);
    Route::post('/ajax', [dtManageKompenController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [dtManageKompenController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [dtManageKompenController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [dtManageKompenController::class, 'update_ajax']);
    Route::delete('/{id}/delete_ajax', [dtManageKompenController::class, 'delete_ajax']);
});


// // Grup route dengan prefix 'dtManageKompen'
// Route::group(['prefix' => 'dtManageKompen'], function () {
//     // Route untuk menampilkan halaman index
//     Route::get('/', [dtManageKompenController::class, 'index'])->name('dtManageKompen.index');
    
//     // Route untuk mengambil data melalui AJAX (server-side)
//     Route::post('/list', [dtManageKompenController::class, 'list'])->name('dtManageKompen.list');

//     // Route untuk membuka form create (tampilan modal)
//     Route::get('/create_ajax', [dtManageKompenController::class, 'create_ajax'])->name('dtManageKompen.create');

//     // Route untuk menyimpan data melalui AJAX
//     Route::post('/ajax', [dtManageKompenController::class, 'store_ajax'])->name('dtManageKompen.store');

//     // Route untuk menampilkan data dalam modal (detail)
//     Route::get('/{id}/show_ajax', [dtManageKompenController::class, 'show_ajax'])->name('dtManageKompen.show');
    
//     // Route untuk membuka form edit (tampilan modal)
//     Route::get('/{id}/edit_ajax', [dtManageKompenController::class, 'edit_ajax'])->name('dtManageKompen.edit');

//     // Route untuk memperbarui data melalui AJAX
//     Route::put('/{id}/update_ajax', [dtManageKompenController::class, 'update_ajax'])->name('dtManageKompen.update');
    
//     // Route untuk konfirmasi penghapusan (tampilan modal)
//     Route::get('/{id}/delete_ajax', [dtManageKompenController::class, 'confirm_ajax'])->name('dtManageKompen.delete.confirm');

//     // Route untuk menghapus data melalui AJAX
//     Route::delete('/{id}/delete_ajax', [dtManageKompenController::class, 'delete_ajax'])->name('dtManageKompen.delete');
// });


// Update Kompen
Route::get('/dtUpdateKompen', [dtUpdateKompenController::class, 'index']);

// Level ( Admin )
Route::group(['prefix' => 'aLevel'], function () {
    Route::get('/', [aLevelController::class, 'index']);
    Route::post('/list', [aLevelController::class, 'list']);
    Route::get('/create_ajax', [aLevelController::class, 'create_ajax']);
    Route::post('/ajax', [aLevelController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [aLevelController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [aLevelController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aLevelController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aLevelController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aLevelController::class, 'delete_ajax']);
});

// User ( Admin )
Route::group(['prefix' => 'aUser'], function () {
    Route::get('/', [aUserController::class, 'index']);
    Route::post('/list', [aUserController::class, 'list']);
    Route::get('/create_ajax', [aUserController::class, 'create_ajax']);
    Route::post('/ajax', [aUserController::class, 'store_ajax']);
    Route::get('/{id}/show_ajax', [aUserController::class, 'show_ajax']);
    Route::get('/{id}/edit_ajax', [aUserController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aUserController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aUserController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aUserController::class, 'delete_ajax']);
});

Route::get('/dtDMAlpha', [DtDMAlphaController::class, 'index'])->name('dtDMAlpha.index');
Route::get('/dtDMAlpha/import', [DtDMAlphaController::class, 'importPage'])->name('dtDMAlpha.importPage');
Route::post('/dtDMAlpha/import', [DtDMAlphaController::class, 'importExcel'])->name('dtDMAlpha.importExcel');
