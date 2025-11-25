<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\Mail;
use App\Mail\JobAppliedMail;
use App\Models\JobVacancy;
use App\Models\User;

class SendApplicationMailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    // Avoid naming collision with InteractsWithQueue::$job
    public JobVacancy $jobVacancy;
    public User $user;
    public string $cvPath;

    /**
     * Create a new job instance.
     */
    public function __construct(JobVacancy $jobVacancy, User $user, string $cvPath)
    {
        $this->jobVacancy = $jobVacancy;
        $this->user = $user;
        $this->cvPath = $cvPath;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        Mail::to($this->user->email)->send(new JobAppliedMail($this->jobVacancy, $this->user, $this->cvPath));
    }
}
