<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\AgriConnect\AcSubscriptionPlan;
use App\Models\AgriConnect\AcCrop;
use App\Models\AgriConnect\AcWeatherZone;
use App\Models\AgriConnect\AcUser;
use Illuminate\Support\Facades\Hash;

class AcSeeder extends Seeder
{
    public function run(): void
    {
        // ===== PLANS =====
        AcSubscriptionPlan::insert([
            [
                'slug' => 'free', 'name' => 'Gratuit', 'price' => 0, 'currency' => 'EUR',
                'features' => json_encode(['Accès marketplace', '3 posts/semaine', 'Prix du marché']),
                'max_posts_per_week' => 3, 'marketplace_access' => true,
                'weather_alerts' => false, 'advanced_analytics' => false, 'priority_support' => false,
                'is_active' => true, 'created_at' => now(), 'updated_at' => now(),
            ],
            [
                'slug' => 'premium', 'name' => 'Premium', 'price' => 6500, 'currency' => 'FCFA',
                'features' => json_encode(['Tout Free', 'Alertes météo', '10 posts/semaine', 'Alertes prix', 'Chatbot IA']),
                'max_posts_per_week' => 10, 'marketplace_access' => true,
                'weather_alerts' => true, 'advanced_analytics' => false, 'priority_support' => false,
                'is_active' => true, 'created_at' => now(), 'updated_at' => now(),
            ],
            [
                'slug' => 'business', 'name' => 'Business', 'price' => 65000, 'currency' => 'FCFA',
                'features' => json_encode(['Tout Premium', 'Posts illimités', 'Analytics avancés', 'Support prioritaire', 'Diagnostic IA', 'Micro-financement']),
                'max_posts_per_week' => 999, 'marketplace_access' => true,
                'weather_alerts' => true, 'advanced_analytics' => true, 'priority_support' => true,
                'is_active' => true, 'created_at' => now(), 'updated_at' => now(),
            ],
        ]);

        // ===== 20 CULTURES AFRICAINES =====
        $crops = [
            ['name' => 'Maïs', 'name_local' => 'Mbindi / Dra', 'category' => 'cereale'],
            ['name' => 'Riz', 'name_local' => 'Malo', 'category' => 'cereale'],
            ['name' => 'Mil', 'name_local' => 'Nyo / Sanyo', 'category' => 'cereale'],
            ['name' => 'Sorgho', 'name_local' => 'Gawo', 'category' => 'cereale'],
            ['name' => 'Blé', 'name_local' => 'Qamh', 'category' => 'cereale'],
            ['name' => 'Manioc', 'name_local' => 'Bâton / Bobolo', 'category' => 'tubercule'],
            ['name' => 'Igname', 'name_local' => 'Isu / Nyam', 'category' => 'tubercule'],
            ['name' => 'Patate douce', 'name_local' => 'Mbala', 'category' => 'tubercule'],
            ['name' => 'Plantain', 'name_local' => 'Kondré', 'category' => 'fruit'],
            ['name' => 'Banane', 'name_local' => 'Banana', 'category' => 'fruit'],
            ['name' => 'Mangue', 'name_local' => 'Mangoro', 'category' => 'fruit'],
            ['name' => 'Avocat', 'name_local' => 'Piya', 'category' => 'fruit'],
            ['name' => 'Tomate', 'name_local' => 'Tamatis', 'category' => 'legume'],
            ['name' => 'Oignon', 'name_local' => 'Jaba', 'category' => 'legume'],
            ['name' => 'Piment', 'name_local' => 'Pilipili', 'category' => 'legume'],
            ['name' => 'Gombo', 'name_local' => 'Dongo-dongo', 'category' => 'legume'],
            ['name' => 'Arachide', 'name_local' => 'Tiga / Owoh', 'category' => 'oleagineux'],
            ['name' => 'Palmier à huile', 'name_local' => 'Mbo\'o', 'category' => 'oleagineux'],
            ['name' => 'Cacao', 'name_local' => 'Kakao', 'category' => 'oleagineux'],
            ['name' => 'Café', 'name_local' => 'Kahawa', 'category' => 'oleagineux'],
        ];

        foreach ($crops as $crop) {
            AcCrop::create(array_merge($crop, ['is_active' => true]));
        }

        // ===== 5 ZONES MÉTÉO TEST =====
        AcWeatherZone::insert([
            ['name' => 'Casablanca', 'region' => 'Grand Casablanca', 'country' => 'Maroc', 'latitude' => 33.5731, 'longitude' => -7.5898, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Marrakech', 'region' => 'Marrakech-Safi', 'country' => 'Maroc', 'latitude' => 31.6295, 'longitude' => -7.9811, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Fès', 'region' => 'Fès-Meknès', 'country' => 'Maroc', 'latitude' => 34.0181, 'longitude' => -5.0078, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Dakar', 'region' => 'Dakar', 'country' => 'Sénégal', 'latitude' => 14.7167, 'longitude' => -17.4677, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Saint-Louis', 'region' => 'Saint-Louis', 'country' => 'Sénégal', 'latitude' => 16.0326, 'longitude' => -16.4818, 'created_at' => now(), 'updated_at' => now()],
        ]);

        // ===== SUPERADMIN =====
        $admin = AcUser::create([
            'name' => 'Super Admin',
            'email' => 'admin@agriconnect.com',
            'password' => Hash::make('admin123'),
            'phone' => '+212600000000',
            'region' => 'Casablanca',
            'country' => 'Maroc',
            'langue_preferee' => 'fr',
            'is_admin' => true,
        ]);

        // Assigner plan Business à l'admin
        $businessPlan = AcSubscriptionPlan::where('slug', 'business')->first();
        \App\Models\AgriConnect\AcSubscription::create([
            'user_id' => $admin->id,
            'plan_id' => $businessPlan->id,
            'status' => 'active',
            'starts_at' => now(),
            'expires_at' => now()->addYears(10),
        ]);
    }
}
