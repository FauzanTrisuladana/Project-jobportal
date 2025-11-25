<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Application;
use App\Models\User;
use App\Models\JobVacancy;

class ApplicationsTableSeeder extends Seeder
{
    public function run(): void
    {
        if (Application::count() > 0) {
            return; // skip if already seeded
        }

        $job1 = JobVacancy::where('title', 'PPP')->first();
        $job2 = JobVacancy::where('title', 'Fulltime Data Analist')->first();
        $user = User::where('email', 'fauzantrisuladana4@gmail.com')->first(); // Job Seeker

        if (! $job1 || ! $job2 || ! $user) {
            return; // ensure dependencies exist
        }

        // Sample CV names from dump (files may not exist in storage)
        Application::create([
            'user_id' => $user->id,
            'job_id' => $job1->id,
            'cv' => 'cvs/9JpZoiRTCqx0zXvvKXYhkBim2h1V9xJKV1X1KdXD.pdf',
            'status' => 'Accepted',
        ]);

        Application::create([
            'user_id' => $user->id,
            'job_id' => $job2->id,
            'cv' => 'cvs/TnbxUxBF9TG5tFQ2jgFZNycfVJUGxolNKkIJraMS.pdf',
            'status' => 'Rejected',
        ]);

        Application::create([
            'user_id' => $user->id,
            'job_id' => $job2->id,
            'cv' => 'cvs/KU7V0aoxY7wbdKnxb9kt6yJQtZ7Xvx2F897KRkXH.pdf',
            'status' => 'Pending',
        ]);

        Application::create([
            'user_id' => $user->id,
            'job_id' => $job2->id,
            'cv' => 'cvs/HNFolXiqOlxKDQGMY4R8YXxEEZJi6T6y3cQILY6S.pdf',
            'status' => 'Pending',
        ]);
    }
}
