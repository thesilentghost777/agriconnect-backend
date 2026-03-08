<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WeatherZonesSeeder extends Seeder
{
    public function run(): void
    {
        $zones = [

            // CAMEROUN
            ['name' => 'Yaoundé Centre',       'region' => 'Centre',      'country' => 'Cameroun', 'latitude' => 3.8667,  'longitude' => 11.5167],
            ['name' => 'Douala Littoral',      'region' => 'Littoral',    'country' => 'Cameroun', 'latitude' => 4.0511,  'longitude' => 9.7679],
            ['name' => 'Bafoussam Ouest',      'region' => 'Ouest',       'country' => 'Cameroun', 'latitude' => 5.4737,  'longitude' => 10.4179],
            ['name' => 'Garoua Nord',          'region' => 'Nord',        'country' => 'Cameroun', 'latitude' => 9.3017,  'longitude' => 13.3963],
            ['name' => 'Maroua Extrême-Nord',  'region' => 'Extrême-Nord','country' => 'Cameroun', 'latitude' => 10.5913, 'longitude' => 14.3163],

            // SENEGAL
            ['name' => 'Dakar',        'region' => 'Dakar',       'country' => 'Sénégal', 'latitude' => 14.7167, 'longitude' => -17.4677],
            ['name' => 'Saint-Louis',  'region' => 'Saint-Louis', 'country' => 'Sénégal', 'latitude' => 16.0326, 'longitude' => -16.4818],
            ['name' => 'Kaolack',      'region' => 'Kaolack',     'country' => 'Sénégal', 'latitude' => 14.1469, 'longitude' => -16.0726],
            ['name' => 'Tambacounda',  'region' => 'Tambacounda', 'country' => 'Sénégal', 'latitude' => 13.7707, 'longitude' => -13.6673],

            // MAROC
            ['name' => 'Rabat',       'region' => 'Rabat-Salé-Kénitra', 'country' => 'Maroc', 'latitude' => 34.0209, 'longitude' => -6.8416],
            ['name' => 'Casablanca',  'region' => 'Casablanca-Settat',  'country' => 'Maroc', 'latitude' => 33.5731, 'longitude' => -7.5898],
            ['name' => 'Marrakech',   'region' => 'Marrakech-Safi',     'country' => 'Maroc', 'latitude' => 31.6295, 'longitude' => -7.9811],
            ['name' => 'Fès',         'region' => 'Fès-Meknès',         'country' => 'Maroc', 'latitude' => 34.0331, 'longitude' => -5.0003],
        ];

        foreach ($zones as $zone) {
            DB::table('ac_weather_zones')->insert(array_merge($zone, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
