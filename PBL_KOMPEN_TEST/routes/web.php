<?php
use App\Http\Controllers\AuthController;
use App\Http\Controllers\aAdminController;
use App\Http\Controllers\aBidangKompetensiController;
use App\Http\Controllers\aDosenController;
use App\Http\Controllers\aLevelController;
use App\Http\Controllers\aMahasiswaAlphaController;
use App\Http\Controllers\aMahasiswaController;
use App\Http\Controllers\aManageBidKomController;
use App\Http\Controllers\aTendikController;
use App\Http\Controllers\aWelcomeController;
use App\Http\Controllers\dtDMAlphaController;
use App\Http\Controllers\dtDMKompenController;
use App\Http\Controllers\dtManageKompenController;
use App\Http\Controllers\dtUpdateKompenController;
use App\Http\Controllers\dtWelcomeController;
use App\Http\Controllers\LandingPageController;
use App\Http\Controllers\LihatPilihKompenController;
use App\Http\Controllers\UpdateKompenSelesaiController;
use App\Http\Controllers\UpdateProgresTugasKompenController;
use App\Http\Controllers\WelcomeController;
use App\Http\Controllers\aUserADTController;
use App\Http\Controllers\aUserMahasiswaController;
use App\Http\Controllers\aDMAlphaController;
use App\Http\Controllers\aDMKompenController;
use App\Http\Controllers\aDTTenknisiController;
use App\Http\Controllers\aDTDosenController;
use App\Http\Controllers\aDTAdminController;
use App\Http\Controllers\aManageDaMaKomController;
use App\Http\Controllers\aManageKompenController;
use App\Http\Controllers\aUpdateKompenController;

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
Route::get('/admin', [aWelcomeController::class, 'index'])->name('admin.dashboard');

// Welcome for Dosen/Teknisi
Route::get('/DosenTeknisi', [dtWelcomeController::class, 'index'])->name('dosenTeknisi.index');

// user as Mahasiswa
// Lihat dan Pilih Kompen
Route::get('/mLihatPilihKompen', [LihatPilihKompenController::class, 'index']);
Route::get('/tugas-kompen/data', [LihatPilihKompenController::class, 'getTugasReady']);
Route::get('/tugas-kompen/ambil/{id}', [LihatPilihKompenController::class, 'applyTugas']);
Route::get('apply/{id}', [LihatPilihKompenController::class, 'applyTugas'])->name('tugas-kompen.apply');
Route::get('/mLihatPilihKompen', [LihatPilihKompenController::class, 'index'])->name('lihatPilihKompen.index');


// Update Progres Tugas Kompen
Route::get('/mUpdateProgresTugasKompen', [UpdateProgresTugasKompenController::class, 'index']);

// Update Kompen Selesai
Route::get('/mUpdateKompenSelesai', [UpdateKompenSelesaiController::class, 'index']);

// user as Admin
// User Admin/Dosen/Teknisi
Route::get('/aAdminDosenTeknisi', [aUserADTController::class, 'index']);

// User Mahasiswa
Route::get('/aMahasiswa', [aUserMahasiswaController::class, 'index']);

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

// Manage Data Mahasiswa Kompen
Route::get('/aManageDataMahasiswaKompen', [aManageDaMaKomController::class, 'index']);

// Manage Kompen
Route::get('/aManageKompen', [aManageKompenController::class, 'index']);

// Update Kompen Selesai
Route::get('/aUpdateKompenSelesai', [aUpdateKompenController::class, 'index']);

// User as Dosen/Teknisi
// Daftar Mahasiswa Alpha
Route::get('/dtDaftarMahasiswaAlpha', [dtDMAlphaController::class, 'index']);

// Daftar Mahasiswa Kompen
Route::get('/dtDaftarMahasiswaKompen', [dtDMKompenController::class, 'index']);

// Manage Kompen
Route::get('/dtManageKompen', [dtManageKompenController::class, 'index']);

// Update Kompen
Route::get('/dtUpdateKompen', [dtUpdateKompenController::class, 'index']);

// Level ( Admin )
Route::group(['prefix' => 'aLevel'], function () {
    Route::get('/', [aLevelController::class, 'index']);
    Route::post('/list', [aLevelController::class, 'list']);
    Route::get('/{id}/show_ajax', [aLevelController::class, 'show_ajax']);
});

// user mahasiswa
Route::group(['prefix' => 'aMahasiswa'], function () {
    Route::get('/', [aMahasiswaController::class, 'index']);
    Route::post('/list', [aMahasiswaController::class, 'list']);
    Route::get('/{id}/show_ajax', [aMahasiswaController::class, 'show_ajax']);
    Route::get('/create_ajax', [aMahasiswaController::class, 'create_ajax']);
    Route::post('/ajax', [aMahasiswaController::class, 'store_ajax']);
    Route::get('{id}/edit_ajax', [aMahasiswaController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aMahasiswaController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aMahasiswaController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aMahasiswaController::class, 'delete_ajax']);
});

// user admin
Route::group(['prefix' => 'aAdmin'], function () {
    Route::get('/', [aAdminController::class, 'index']);
    Route::post('/list', [aAdminController::class, 'list']);
    Route::get('/{id}/show_ajax', [aAdminController::class, 'show_ajax']);
    Route::get('/create_ajax', [aAdminController::class, 'create_ajax']);
    Route::post('/ajax', [aAdminController::class, 'store_ajax']);
    Route::get('{id}/edit_ajax', [aAdminController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aAdminController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aAdminController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aAdminController::class, 'delete_ajax']);
});

// user dosen
Route::group(['prefix' => 'aDosen'], function () {
    Route::get('/', [aDosenController::class, 'index']);
    Route::post('/list', [aDosenController::class, 'list']);
    Route::get('/{id}/show_ajax', [aDosenController::class, 'show_ajax']);
    Route::get('/create_ajax', [aDosenController::class, 'create_ajax']);
    Route::post('/ajax', [aDosenController::class, 'store_ajax']);
    Route::get('{id}/edit_ajax', [aDosenController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aDosenController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aDosenController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aDosenController::class, 'delete_ajax']);
});

// user tendik
Route::group(['prefix' => 'aTendik'], function () {
    Route::get('/', [aTendikController::class, 'index']);
    Route::post('/list', [aTendikController::class, 'list']);
    Route::get('/{id}/show_ajax', [aTendikController::class, 'show_ajax']);
    Route::get('/create_ajax', [aTendikController::class, 'create_ajax']);
    Route::post('/ajax', [aTendikController::class, 'store_ajax']);
    Route::get('{id}/edit_ajax', [aTendikController::class, 'edit_ajax']);
    Route::put('/{id}/update_ajax', [aTendikController::class, 'update_ajax']);
    Route::get('/{id}/delete_ajax', [aTendikController::class, 'confirm_ajax']);
    Route::delete('/{id}/delete_ajax', [aTendikController::class, 'delete_ajax']);
});

// daftar mahasiswa alpha
Route::group(['prefix' => 'aMahasiswaAlpha'], function () {
    Route::get('/', [aMahasiswaAlphaController::class, 'index']);
    Route::post('/list', [aMahasiswaAlphaController::class, 'list']);
    Route::get('/{id}/show_ajax', [aMahasiswaAlphaController::class, 'show_ajax']);
    Route::get('/import', [aMahasiswaAlphaController::class, 'import']);
    Route::post('/import_ajax', [aMahasiswaAlphaController::class, 'import_ajax']);
});

// manage bidang kompetensi
Route::group(['prefix' => 'aBidangKompetensi'], function () {
    Route::get('/', [aBidangKompetensiController::class, 'index']);
    Route::post('/list', [aBidangKompetensiController::class, 'list']);
    Route::get('/{id}/show_ajax', [aBidangKompetensiController::class, 'show_ajax']);
});