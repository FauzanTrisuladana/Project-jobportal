<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\JobApiController;
use App\Http\Controllers\Api\ApplicationApiController;

Route::get('/status', fn () => ['status' => 'API is running']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Public, read-only jobs endpoint (no token required)
Route::get('/public/jobs', [JobApiController::class, 'index']);

Route::middleware('auth:sanctum')->group(function () {
	Route::get('/me', fn (Request $request) => $request->user());
	Route::post('/logout', [AuthController::class, 'logout']);

    /**
     * Enpoints for Job resource
     * - GET /api/jobs          => list all jobs
     * - GET /api/jobs/{job}    => get a specific job
     * - POST /api/jobs         => create a new job
     * - PUT /api/jobs/{job}    => update a specific job
     * - DELETE /api/jobs/{job} => delete a specific job
     */
    Route::controller(JobApiController::class)->prefix('jobs')->group(function () {
        Route::get('/', 'index');
        Route::get('/{job}', 'show');
        Route::post('/', 'store');
        Route::put('/{job}', 'update');
        Route::delete('/{job}', 'destroy');
    });

	/**
     * Endpoints for Application resource
     * - POST /api/jobs/{job}/apply  => apply to a job
     * - GET /api/applications       => list all applications
     * - PATCH /api/applications/{application}/status => update application status
     */
    Route::controller(ApplicationApiController::class)->group(function () {
        Route::post('/jobs/{job}/apply', 'store');
        Route::get('/applications', 'index');
        Route::patch('/applications/{application}/status', 'updateStatus');
    });
});
