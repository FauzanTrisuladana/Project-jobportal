<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JobController;
use App\Http\Controllers\ApplicationController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Route::middleware('isAdmin')->prefix('admin')->group(function () {
//     Route::get('/', function () {
//         return "Halaman Admin";
//     });
//     Route::get('/jobs', function() {
//         return "Halaman Admin Job";
//     });
// });
// Route::get('/admin', function () {
//     return "Halaman Admin";
// })->middleware('isAdmin');

Route::resource('jobs', JobController::class)->middleware('isAdmin')->except(['index', 'show']);

Route::resource('jobs', JobController::class)->middleware('auth')->only(['index', 'show']);


Route::post('/jobs/{job}/apply', [ApplicationController::class, 'store'])->name('apply.store')->middleware('auth');

Route::get('/jobs/{job}/applicants', [ApplicationController::class, 'index'])->name('applications.index')->middleware('isAdmin');

Route::resource('applications', ApplicationController::class)->middleware(['auth', 'isAdmin'])->except(['index', 'show']);

Route::resource('applications', ApplicationController::class)->middleware(['auth'])->only(['index', 'show']);

Route::get('/applications/export', [ApplicationController::class, 'export'])->name('applications.export')->middleware('isAdmin');

Route::post('/jobs/import', [JobController::class, 'import'])->name('jobs.import')->middleware('isAdmin');

require __DIR__.'/auth.php';
