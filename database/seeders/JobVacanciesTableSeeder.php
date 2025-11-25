<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JobVacancy;

class JobVacanciesTableSeeder extends Seeder
{
    public function run(): void
    {
        if (JobVacancy::count() > 0) {
            return; // skip if already seeded
        }

        JobVacancy::create([
            'title' => 'PPP',
            'description' => 'Dibutuhkan ahli it',
            'location' => 'Jakarta',
            'company' => 'PT internusa bangsa',
            'salary' => 8000000,
            'job_type' => 'Full-time',
            'logo' => null,
        ]);

        JobVacancy::create([
            'title' => 'Fulltime Data Analist',
            'description' => 'Dibutuhkan data analis untuk menganalisis data tambang batu bara',
            'location' => 'Kalimantan',
            'company' => 'PT barito pasisik',
            'salary' => 10000000,
            'job_type' => 'Full-time',
            'logo' => 'logos/fC89Wa42t0fCob3KiKVz38enUmltFmgxeT65RHst.jpg', // file mungkin belum ada
        ]);
    }
}
