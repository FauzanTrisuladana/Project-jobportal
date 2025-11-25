<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    public function run(): void
    {
        // Avoid duplicate seeding if records already exist
        if (User::count() > 0) {
            return; // optional: remove if you want duplicates
        }

        User::create([
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => Hash::make('password'),
            'role' => 'user',
            'email_verified_at' => now(),
        ]);

        User::create([
            'name' => 'Admin',
            'email' => 'fauzantrisuladana@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'admin',
        ]);

        User::create([
            'name' => 'Job Seeker',
            'email' => 'fauzantrisuladana4@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'user',
        ]);
    }
}
