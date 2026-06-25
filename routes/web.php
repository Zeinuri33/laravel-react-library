<?php

use App\Http\Controllers\dokumentasi\DokumentasiController;
use App\Http\Controllers\Ebook\EbookController;
use App\Http\Controllers\Ebook\EbookKlasifikasiController;
use App\Http\Controllers\Ebook\TitikController;
use App\Http\Controllers\Ebook\EbookUserController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsulanController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;

Route::inertia('/', 'welcome')->name('home');
Route::inertia('result', 'result')->name('result');
Route::get('/docs/{slug?}', [DokumentasiController::class, 'docs']);
Route::get('/titikbaca', [EbookController::class, 'titikBaca']);
Route::get('/titikbaca/{ebook}/baca', [EbookController::class, 'baca']);
Route::post('/titikbaca/verify-location', [EbookController::class, 'verifyLocation']);
Route::post('/titikbaca/start-session', [EbookController::class, 'startSession']);
Route::post('/titikbaca/heartbeat', [EbookController::class, 'heartbeat']);
Route::post('/titikbaca/end-session', [EbookController::class, 'endSession']);

//USULAN
Route::post('/usulan', [UsulanController::class, 'store'])->name('usulan.store');


// Route::get('/test-search', function (DokumentasiSearchService $search) {
//     return $search->search(
//         request('q', '')
//     );
// });

// Route::get('/test-chat', function (
//     ChatbotService $chatbot
// ) {

//     return [
//         'answer' => $chatbot->ask(
//             request('q')
//         )
//     ];

// });




Route::middleware(['auth', 'verified'])->group(function () {

    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    /**
     * Dokumentasi
     */

    // INDEX
    Route::get('/dokumentasi', [DokumentasiController::class, 'index'])
        ->middleware('permission:lihat-dokumentasi')
        ->name('dokumentasi.index');

    // CREATE PAGE
    Route::get('/dokumentasi/create', [DokumentasiController::class, 'create'])
        ->middleware('permission:tambah-dokumentasi')
        ->name('dokumentasi.create');

    // STORE
    Route::post('/dokumentasi', [DokumentasiController::class, 'store'])
        ->middleware('permission:tambah-dokumentasi')
        ->name('dokumentasi.store');

    // SLUG
    Route::get('/docs/{slug}', [DokumentasiController::class, 'show']);

    // EDIT PAGE
    Route::get('/dokumentasi/{dokumentasi}/edit', [DokumentasiController::class, 'edit'])
        ->middleware('permission:edit-dokumentasi')
        ->name('dokumentasi.edit');

    // UPDATE
    Route::put('/dokumentasi/{dokumentasi}', [DokumentasiController::class, 'update'])
        ->middleware('permission:edit-dokumentasi')
        ->name('dokumentasi.update');

    // DELETE
    Route::delete('/dokumentasi/{dokumentasi}', [DokumentasiController::class, 'destroy'])
        ->middleware('permission:hapus-dokumentasi')
        ->name('dokumentasi.destroy');

    // INSERT GAMBAR
    Route::post('/dokumentasi/upload-image',[DokumentasiController::class, 'uploadImage']);

    // EDIT KATEGORI
    Route::patch(
        '/dokumentasi/kategori/{kategori}',
        [DokumentasiController::class, 'updateKategori']
    )->name('dokumentasi.kategori.update');




    // USULAN
    Route::get('/usulan-list', [UsulanController::class, 'index'])
        ->middleware('permission:lihat-usulan')
        ->name('usulan.index');

    Route::get('/usulan/{usulan}/jawab', [UsulanController::class, 'jawab'])
        ->middleware('permission:jawab-usulan')
        ->name('usulan.jawab');

    Route::put('/usulan/{usulan}/jawab', [UsulanController::class, 'kirimJawaban'])
        ->middleware('permission:jawab-usulan')
        ->name('usulan.kirim-jawaban');

    Route::get('/usulan/{usulan}/detail', [UsulanController::class, 'detail'])
        ->middleware('permission:lihat-usulan')
        ->name('usulan.detail');

    Route::delete('/usulan/{usulan}', [UsulanController::class, 'destroy'])
        ->middleware('permission:hapus-usulan')
        ->name('usulan.destroy');


    // EBOOK
    Route::get('/list-ebooks', [EbookController::class, 'index'])
        ->middleware('permission:lihat-ebook')
        ->name('ebooks.index');
    Route::post('/ebooks/extract', [EbookController::class, 'extract'])
        ->middleware('auth');
    Route::post('/ebooks/cleanup-temp', [EbookController::class, 'cleanupTemp']);
    Route::get('/list-ebooks/create', [EbookController::class, 'create'])
        ->name('ebooks.create')
        ->middleware('permission:tambah-ebook');
    Route::post('/list-ebooks', [EbookController::class, 'store'])
        ->middleware('permission:tambah-ebook');
    Route::get('/list-ebooks/{ebook}/edit',[EbookController::class, 'edit']
        )->middleware('permission:edit-ebook')->name('ebooks.edit');
    Route::put('/list-ebooks/{ebook}', [EbookController::class, 'update'])
        ->middleware('permission:edit-ebook')
        ->name('ebooks.update');
    Route::delete('/list-ebooks/{ebook}', [EbookController::class, 'destroy'])
        ->middleware('permission:hapus-ebook')
        ->name('ebooks.destroy');

    //
    Route::get('/klasifikasi-ebooks', [EbookKlasifikasiController::class, 'index'])
        ->middleware('permission:lihat-klasifikasi_ebook');
    Route::post('/klasifikasi-ebooks', [EbookKlasifikasiController::class, 'store'])
        ->middleware('permission:tambah-klasifikasi_ebook');
    Route::put('/klasifikasi-ebooks/{klasifikasi_ebook}', [EbookKlasifikasiController::class, 'update'])
        ->middleware('permission:edit-klasifikasi_ebook')
        ->name('klasifikasi-ebooks.update');
    Route::delete('/klasifikasi-ebooks/{klasifikasi_ebook}', [EbookKlasifikasiController::class, 'destroy'])
        ->middleware('permission:hapus-klasifikasi_ebook')
        ->name('klasifikasi-ebooks.destroy');

    //
    Route::get('/titik-ebooks', [TitikController::class, 'index'])->middleware('permission:lihat-titik_ebook');
    Route::get('/titik-ebooks/create', [TitikController::class, 'create'])->middleware('permission:tambah-titik_ebook');
    Route::post('/titik-ebooks', [TitikController::class, 'store'])->middleware('permission:tambah-titik_ebook');
    Route::get('/titik-ebooks/{ebook}/edit',[TitikController::class, 'edit'])->middleware('permission:edit-titik_ebook');
    Route::put('/titik-ebooks/{ebook}', [TitikController::class, 'update'])->middleware('permission:edit-titik_ebook');
    Route::delete('/titik-ebooks/{ebook}', [TitikController::class, 'destroy'])->middleware('permission:hapus-titik_ebook');

    // EBOOK USERS
    Route::get('/ebook-users', [EbookUserController::class, 'index'])->middleware('permission:lihat-ebook_user');
    Route::get('/ebook-users/create', [EbookUserController::class, 'create'])->middleware('permission:tambah-ebook_user');
    Route::post('/ebook-users', [EbookUserController::class, 'store'])->middleware('permission:tambah-ebook_user');
    Route::get('/ebook-users/{ebook_user}/edit', [EbookUserController::class, 'edit'])->middleware('permission:edit-ebook_user');
    Route::put('/ebook-users/{ebook_user}', [EbookUserController::class, 'update'])->middleware('permission:edit-ebook_user');
    Route::delete('/ebook-users/{ebook_user}', [EbookUserController::class, 'destroy'])->middleware('permission:hapus-ebook_user');


    /**
     * Pengguna
     */

    //user
    Route::get('/users', [UserController::class, 'index'])
        ->middleware('permission:lihat-user')
        ->name('users.index');
    Route::post('/users', [UserController::class, 'store'])
        ->middleware('permission:tambah-user');
    Route::put('/users/{user}', [UserController::class, 'update'])
        ->middleware('permission:edit-user')
        ->name('users.update');
    Route::delete('/users/{user}', [UserController::class, 'destroy'])
        ->middleware('permission:hapus-user')
        ->name('users.destroy');

    //role
    Route::get('/roles', [RoleController::class, 'index'])
        ->middleware('permission:lihat-role');
    Route::post('/roles', [RoleController::class, 'store'])
        ->middleware('permission:tambah-role');
    Route::put('/roles/{role}', [RoleController::class, 'update'])
        ->middleware('permission:edit-role')
        ->name('roles.update');
    Route::delete('/roles/{role}', [RoleController::class, 'destroy'])
        ->middleware('permission:hapus-role')
        ->name('roles.destroy');

    //permission
    Route::get('/permissions', [PermissionController::class, 'index'])
        ->middleware('permission:lihat-akses');
    Route::post('/permissions', [PermissionController::class, 'store'])
        ->middleware('permission:tambah-akses');
    Route::put('/permissions/{permission}', [PermissionController::class, 'update'])
        ->middleware('permission:edit-akses')
        ->name('permissions.update');
    Route::delete('/permissions/{permission}', [PermissionController::class, 'destroy'])
        ->middleware('permission:hapus-akses')
        ->name('permissions.destroy');
});

require __DIR__.'/settings.php';
