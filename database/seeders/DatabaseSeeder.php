<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        //call AcSeeder
        $this->call([
            //AcSeeder::class,
            CropsSeeder::class,
            WeatherZonesSeeder::class,
            SubscriptionPlansSeeder::class,
            UsersSeeder::class,
            MarketPricesSeeder::class,
            WeatherAlertsSeeder::class,
            MarketplaceSeeder::class,
            CommunitySeeder::class,
            FinanceSeeder::class,
            NotificationsSeeder::class,
        ]);

    }
}
