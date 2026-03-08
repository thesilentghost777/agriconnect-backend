<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CropsSeeder extends Seeder
{
    public function run(): void
    {
        $crops = [
            // Céréales
            ['name' => 'Maïs',        'name_local' => 'Mbigou',    'category' => 'cereale',    'icon' => '🌽', 'is_active' => true],
            ['name' => 'Riz',         'name_local' => 'Rizou',     'category' => 'cereale',    'icon' => '🌾', 'is_active' => true],
            ['name' => 'Mil',         'name_local' => 'Gawri',     'category' => 'cereale',    'icon' => '🌾', 'is_active' => true],
            ['name' => 'Sorgho',      'name_local' => 'Njigari',   'category' => 'cereale',    'icon' => '🌾', 'is_active' => true],
            // Tubercules
            ['name' => 'Manioc',      'name_local' => 'Bobolo',    'category' => 'tubercule',  'icon' => '🥔', 'is_active' => true],
            ['name' => 'Igname',      'name_local' => 'Nkan',      'category' => 'tubercule',  'icon' => '🥔', 'is_active' => true],
            ['name' => 'Patate douce','name_local' => 'Nkwem',     'category' => 'tubercule',  'icon' => '🍠', 'is_active' => true],
            // Légumes
            ['name' => 'Tomate',      'name_local' => 'Tomate',    'category' => 'legume',     'icon' => '🍅', 'is_active' => true],
            ['name' => 'Oignon',      'name_local' => 'Oignon',    'category' => 'legume',     'icon' => '🧅', 'is_active' => true],
            ['name' => 'Piment',      'name_local' => 'Kanda',     'category' => 'legume',     'icon' => '🌶️', 'is_active' => true],
            ['name' => 'Gombo',       'name_local' => 'Kabo',      'category' => 'legume',     'icon' => '🥬', 'is_active' => true],
            // Fruits
            ['name' => 'Banane plantain','name_local' => 'Mbang',  'category' => 'fruit',      'icon' => '🍌', 'is_active' => true],
            ['name' => 'Mangue',      'name_local' => 'Mango',     'category' => 'fruit',      'icon' => '🥭', 'is_active' => true],
            ['name' => 'Avocat',      'name_local' => 'Pear',      'category' => 'fruit',      'icon' => '🥑', 'is_active' => true],
            ['name' => 'Ananas',      'name_local' => 'Ananas',    'category' => 'fruit',      'icon' => '🍍', 'is_active' => true],
            // Oléagineux
            ['name' => 'Palmier à huile','name_local' => 'Mbanga', 'category' => 'oleagineux', 'icon' => '🌴', 'is_active' => true],
            ['name' => 'Arachide',    'name_local' => "N'gon",     'category' => 'oleagineux', 'icon' => '🥜', 'is_active' => true],
            ['name' => 'Soja',        'name_local' => 'Soja',      'category' => 'oleagineux', 'icon' => '🫘', 'is_active' => true],
            // Café/Cacao
            ['name' => 'Cacao',       'name_local' => 'Cacao',     'category' => 'oleagineux', 'icon' => '🍫', 'is_active' => true],
            ['name' => 'Café',        'name_local' => 'Café',      'category' => 'oleagineux', 'icon' => '☕', 'is_active' => true],
        ];

        foreach ($crops as $crop) {
            DB::table('ac_crops')->insert(array_merge($crop, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
