<?php

namespace Database\Seeders;

use App\Models\Job;
use App\Models\Category;
use App\Models\JobType;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $users = User::factory(5)->create();
        $categories = Category::factory(8)->create();
        $jobTypes = JobType::factory(5)->create();

        foreach (range(1, 25) as $i) {
            Job::factory()->create([
                'user_id' => $users->random()->id,
                'category_id' => $categories->random()->id,
                'job_type_id' => $jobTypes->random()->id,
                'status' => 1,
                'isFeatured' => $i <= 6 ? 1 : 0,
            ]);
        }
    }
}
