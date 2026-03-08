<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
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
