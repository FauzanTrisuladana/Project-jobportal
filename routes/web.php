<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JobController;

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

Route::resource('jobs', JobController::class)->middleware('isAdmin');


require __DIR__.'/auth.php';
