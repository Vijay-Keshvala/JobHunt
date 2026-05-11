<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Job>
 */
class JobFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->jobTitle(),
            'vacancy' => fake()->numberBetween(1, 5),
            'location' => fake()->city(),
            'description' => fake()->paragraphs(3, true),
            'experience' => fake()->randomElement(['0-1 years', '1-3 years', '3-5 years', '5+ years']),
            'company_name' => fake()->company(),
            'status' => 1,
            'isFeatured' => 0,
        ];
    }
}
