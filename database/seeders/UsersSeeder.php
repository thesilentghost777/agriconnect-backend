<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    public function run(): void
    {
        // ─── Utilisateurs principaux (comptes de démo) ───────────────────────
        $users = [
            [
                'name'              => 'Jean-Pierre Mvondo',
                'email'             => 'demo@agriConnect.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 677 123 456',
                'region'            => 'Centre',
                'country'           => 'Cameroun',
                'superficie'        => 5.50,
                'cultures_principales' => json_encode(['Maïs', 'Manioc', 'Tomate']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Admin AgriConnect',
                'email'             => 'admin@agriConnect.cm',
                'password'          => Hash::make('admin123'),
                'phone'             => '+237 699 000 001',
                'region'            => 'Centre',
                'country'           => 'Cameroun',
                'superficie'        => null,
                'cultures_principales' => null,
                'langue_preferee'   => 'fr',
                'is_admin'          => true,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Aminatou Sow',
                'email'             => 'aminatou@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 651 234 567',
                'region'            => 'Extrême-Nord',
                'country'           => 'Cameroun',
                'superficie'        => 12.00,
                'cultures_principales' => json_encode(['Mil', 'Sorgho', 'Arachide', 'Oignon']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Paul Nkeng',
                'email'             => 'paul.nkeng@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 678 345 678',
                'region'            => 'Ouest',
                'country'           => 'Cameroun',
                'superficie'        => 8.25,
                'cultures_principales' => json_encode(['Café', 'Maïs', 'Banane plantain']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Marie Ekotto',
                'email'             => 'marie.ekotto@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 699 456 789',
                'region'            => 'Littoral',
                'country'           => 'Cameroun',
                'superficie'        => 3.00,
                'cultures_principales' => json_encode(['Tomate', 'Piment', 'Gombo', 'Ananas']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Ibrahim Moussa',
                'email'             => 'ibrahim.moussa@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 677 567 890',
                'region'            => 'Nord',
                'country'           => 'Cameroun',
                'superficie'        => 25.00,
                'cultures_principales' => json_encode(['Coton', 'Mil', 'Sorgho', 'Arachide']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Solange Ateba',
                'email'             => 'solange.ateba@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 655 678 901',
                'region'            => 'Sud',
                'country'           => 'Cameroun',
                'superficie'        => 6.75,
                'cultures_principales' => json_encode(['Cacao', 'Palmier à huile', 'Manioc']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
            [
                'name'              => 'Benoît Fomba',
                'email'             => 'benoit.fomba@test.cm',
                'password'          => Hash::make('password'),
                'phone'             => '+237 691 789 012',
                'region'            => 'Adamaoua',
                'country'           => 'Cameroun',
                'superficie'        => 18.50,
                'cultures_principales' => json_encode(['Maïs', 'Patate douce', 'Soja']),
                'langue_preferee'   => 'fr',
                'is_admin'          => false,
                'email_verified_at' => now(),
            ],
        ];

        foreach ($users as $user) {
            DB::table('ac_users')->insert(array_merge($user, [
                'created_at' => now()->subDays(rand(30, 180)),
                'updated_at' => now(),
            ]));
        }

        // ─── Abonnements ─────────────────────────────────────────────────────
        // user 1 (demo) → Premium
        DB::table('ac_subscriptions')->insert([
            'user_id'    => 1,
            'plan_id'    => 2, // premium
            'status'     => 'active',
            'starts_at'  => now()->subMonths(2),
            'expires_at' => now()->addMonths(10),
            'payment_id' => 'PAY-DEMO-001',
            'created_at' => now()->subMonths(2),
            'updated_at' => now(),
        ]);
        // user 3 (Aminatou) → Business
        DB::table('ac_subscriptions')->insert([
            'user_id'    => 3,
            'plan_id'    => 3,
            'status'     => 'active',
            'starts_at'  => now()->subMonth(),
            'expires_at' => now()->addMonths(11),
            'payment_id' => 'PAY-AMI-002',
            'created_at' => now()->subMonth(),
            'updated_at' => now(),
        ]);
        // user 4 → Premium
        DB::table('ac_subscriptions')->insert([
            'user_id'    => 4,
            'plan_id'    => 2,
            'status'     => 'active',
            'starts_at'  => now()->subMonths(3),
            'expires_at' => now()->addMonths(9),
            'payment_id' => 'PAY-PAU-003',
            'created_at' => now()->subMonths(3),
            'updated_at' => now(),
        ]);
        // user 5 → Free (pas de ligne = free par défaut, mais on crée quand même)
        DB::table('ac_subscriptions')->insert([
            'user_id'    => 5,
            'plan_id'    => 1,
            'status'     => 'active',
            'starts_at'  => now()->subMonths(1),
            'expires_at' => null,
            'payment_id' => null,
            'created_at' => now()->subMonths(1),
            'updated_at' => now(),
        ]);

        // ─── Abonnements météo ────────────────────────────────────────────────
        $weatherSubs = [
            ['user_id' => 1, 'zone_id' => 1], // Yaoundé
            ['user_id' => 1, 'zone_id' => 2], // Douala
            ['user_id' => 3, 'zone_id' => 5], // Maroua
            ['user_id' => 3, 'zone_id' => 4], // Garoua
            ['user_id' => 4, 'zone_id' => 3], // Bafoussam
            ['user_id' => 5, 'zone_id' => 2], // Douala
            ['user_id' => 6, 'zone_id' => 4], // Garoua
            ['user_id' => 7, 'zone_id' => 8], // Ebolowa
        ];
        foreach ($weatherSubs as $sub) {
            DB::table('ac_weather_subscriptions')->insert(array_merge($sub, [
                'is_active'  => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }

        // ─── Alertes prix ─────────────────────────────────────────────────────
        $priceAlerts = [
            ['user_id' => 1, 'crop_id' => 1,  'region' => 'Centre',      'condition' => 'above', 'threshold' => 250,  'currency' => 'XAF'],
            ['user_id' => 1, 'crop_id' => 8,  'region' => 'Centre',      'condition' => 'below', 'threshold' => 300,  'currency' => 'XAF'],
            ['user_id' => 3, 'crop_id' => 3,  'region' => 'Extrême-Nord','condition' => 'above', 'threshold' => 150,  'currency' => 'XAF'],
            ['user_id' => 4, 'crop_id' => 20, 'region' => 'Ouest',       'condition' => 'above', 'threshold' => 2500, 'currency' => 'XAF'],
            ['user_id' => 6, 'crop_id' => 4,  'region' => 'Nord',        'condition' => 'above', 'threshold' => 130,  'currency' => 'XAF'],
        ];
        foreach ($priceAlerts as $alert) {
            DB::table('ac_price_alerts')->insert(array_merge($alert, [
                'is_active'          => true,
                'last_triggered_at'  => rand(0, 1) ? now()->subDays(rand(1, 7)) : null,
                'created_at'         => now()->subDays(rand(5, 30)),
                'updated_at'         => now(),
            ]));
        }
    }
}
