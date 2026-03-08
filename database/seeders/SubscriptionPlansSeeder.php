<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubscriptionPlansSeeder extends Seeder
{
    public function run(): void
    {
        $plans = [
            [
                'slug'                => 'free',
                'name'                => 'Gratuit',
                'price'               => 0.00,
                'currency'            => 'XAF',
                'features'            => json_encode([
                    'Accès au marché (lecture)',
                    '3 publications communautaires/semaine',
                    'Prix du marché basiques',
                    'Profil agriculteur',
                ]),
                'max_posts_per_week'  => 3,
                'marketplace_access'  => true,
                'weather_alerts'      => false,
                'advanced_analytics'  => false,
                'priority_support'    => false,
                'is_active'           => true,
            ],
            [
                'slug'                => 'premium',
                'name'                => 'Premium',
                'price'               => 5000.00,
                'currency'            => 'XAF',
                'features'            => json_encode([
                    'Tout le plan Gratuit',
                    'Publications illimitées',
                    'Alertes météo en temps réel',
                    'Alertes prix personnalisées',
                    'Accès score de crédit',
                    'Demandes de prêt agricole',
                    'Assurance récolte',
                ]),
                'max_posts_per_week'  => 999,
                'marketplace_access'  => true,
                'weather_alerts'      => true,
                'advanced_analytics'  => false,
                'priority_support'    => false,
                'is_active'           => true,
            ],
            [
                'slug'                => 'business',
                'name'                => 'Business',
                'price'               => 15000.00,
                'currency'            => 'XAF',
                'features'            => json_encode([
                    'Tout le plan Premium',
                    'Analytiques avancées',
                    'Support prioritaire 24/7',
                    'Tableau de bord vendeur pro',
                    'Export des données',
                    'API access',
                    'Gestion multi-exploitations',
                ]),
                'max_posts_per_week'  => 999,
                'marketplace_access'  => true,
                'weather_alerts'      => true,
                'advanced_analytics'  => true,
                'priority_support'    => true,
                'is_active'           => true,
            ],
        ];

        foreach ($plans as $plan) {
            DB::table('ac_subscription_plans')->insert(array_merge($plan, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
