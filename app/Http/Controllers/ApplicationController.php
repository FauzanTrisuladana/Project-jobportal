<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Application;
use App\Models\JobVacancy;
use App\Exports\ApplicationsExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Mail\JobAppliedMail;
use Illuminate\Support\Facades\Mail;
use App\Models\User;
use App\Notifications\NewApplicationNotification;
use App\Jobs\SendApplicationMailJob;

class ApplicationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $applications = Application::with('user', 'job')->get();
        return view('applications.index',compact('applications'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, JobVacancy $job)
    {
        $request->validate([
            'cv' => 'required|mimes:pdf|max:2048',
        ]);

        $cvPath = $request->file('cv')->store('cvs', 'public');

        $application = Application::create([
            'user_id' => auth()->id(),
            'job_id' => $job->id,
            'cv' => $cvPath,
            'status' => 'Pending', // konsisten dengan tampilan yang mengecek 'Pending'
        ]);

        // Kirim email ke user
        // Mail::to(auth()->user()->email)->send(new JobAppliedMail($application->job, auth()->user()));
        dispatch(new SendApplicationMailJob($job, auth()->user()));
        $admin = User::where('role', 'admin')->first();
        $admin->notify(new NewApplicationNotification($application));
        return back()->with('success', 'Lamaran berhasil dikirim! Cek email Anda.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, $id)
    {
        // $id here refers to job id (from /jobs/{job}/applicants)
        $job = JobVacancy::findOrFail($id);
        $applications = Application::with(['user', 'job'])
            ->where('job_id', $id)
            ->get();
        return view('applications.index', compact('applications', 'job'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Application $application)
    {
        $request->validate([
            'status' => 'required|in:Accepted,Rejected',
        ]);

        $application->update([
            'status' => $request->input('status'),
        ]);

        return back()->with('success', 'Status aplikasi diperbarui menjadi ' . $application->status);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function export(Request $request)
    {
        $jobId = $request->query('job');
        $filename = $jobId ? 'applications_job_'.$jobId.'.xlsx' : 'applications.xlsx';
        return Excel::download(new ApplicationsExport($jobId), $filename);
    }
}
