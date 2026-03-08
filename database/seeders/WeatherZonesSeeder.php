<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WeatherZonesSeeder extends Seeder
{
    public function run(): void
    {
        $zones = [
            ['name' => 'Yaoundé Centre',       'region' => 'Centre',      'country' => 'Cameroun', 'latitude' => 3.8667,  'longitude' => 11.5167],
            ['name' => 'Douala Littoral',       'region' => 'Littoral',    'country' => 'Cameroun', 'latitude' => 4.0511,  'longitude' => 9.7679],
            ['name' => 'Bafoussam Ouest',       'region' => 'Ouest',       'country' => 'Cameroun', 'latitude' => 5.4737,  'longitude' => 10.4179],
            ['name' => 'Garoua Nord',           'region' => 'Nord',        'country' => 'Cameroun', 'latitude' => 9.3017,  'longitude' => 13.3963],
            ['name' => 'Maroua Extrême-Nord',   'region' => 'Extrême-Nord','country' => 'Cameroun', 'latitude' => 10.5913, 'longitude' => 14.3163],
            ['name' => 'Ngaoundéré Adamaoua',   'region' => 'Adamaoua',    'country' => 'Cameroun', 'latitude' => 7.3167,  'longitude' => 13.5833],
            ['name' => 'Bertoua Est',           'region' => 'Est',         'country' => 'Cameroun', 'latitude' => 4.5833,  'longitude' => 13.6833],
            ['name' => 'Ebolowa Sud',           'region' => 'Sud',         'country' => 'Cameroun', 'latitude' => 2.9167,  'longitude' => 11.15],
            ['name' => 'Bamenda Nord-Ouest',    'region' => 'Nord-Ouest',  'country' => 'Cameroun', 'latitude' => 5.9597,  'longitude' => 10.1455],
            ['name' => 'Buea Sud-Ouest',        'region' => 'Sud-Ouest',   'country' => 'Cameroun', 'latitude' => 4.1527,  'longitude' => 9.2403],
        ];

        foreach ($zones as $zone) {
            DB::table('ac_weather_zones')->insert(array_merge($zone, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
