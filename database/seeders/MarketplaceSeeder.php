<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class MarketplaceSeeder extends Seeder
{
    public function run(): void
    {
        // ─── Produits marketplace ─────────────────────────────────────────────
        $products = [
            [
                'user_id'            => 1, // Jean-Pierre (demo)
                'crop_id'            => 1, // Maïs
                'title'              => 'Maïs jaune séché – Qualité export',
                'description'        => 'Maïs jaune issu de ma plantation de Mbalmayo. Séché naturellement au soleil, humidité < 13%. Idéal pour meunerie et alimentation animale. Disponible en sacs de 100 kg.',
                'price'              => 22000,
                'currency'           => 'XAF',
                'unit'               => 'sac 100kg',
                'quantity_available' => 50,
                'region'             => 'Centre',
                'country'            => 'Cameroun',
                'images'             => json_encode(['mais_1.jpg', 'mais_2.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(5),
            ],
            [
                'user_id'            => 1, // Jean-Pierre
                'crop_id'            => 5, // Manioc
                'title'              => 'Manioc frais – Variété douce',
                'description'        => 'Manioc fraîchement récolté, variété non amère. Livraison possible sur Yaoundé et environs. Minimum 200 kg.',
                'price'              => 150,
                'currency'           => 'XAF',
                'unit'               => 'kg',
                'quantity_available' => 800,
                'region'             => 'Centre',
                'country'            => 'Cameroun',
                'images'             => json_encode(['manioc_1.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(3),
            ],
            [
                'user_id'            => 3, // Aminatou
                'crop_id'            => 9, // Oignon
                'title'              => 'Oignon rouge de Maroua – Stock important',
                'description'        => 'Oignon rouge du bassin de la Bénoué, qualité supérieure. Conservation 3–4 mois. Vendu en filets de 25 kg. Prix dégressif selon volume.',
                'price'              => 7500,
                'currency'           => 'XAF',
                'unit'               => 'filet 25kg',
                'quantity_available' => 200,
                'region'             => 'Extrême-Nord',
                'country'            => 'Cameroun',
                'images'             => json_encode(['oignon_1.jpg', 'oignon_2.jpg', 'oignon_3.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(7),
            ],
            [
                'user_id'            => 4, // Paul
                'crop_id'            => 20, // Café
                'title'              => 'Café arabica des Hauts-Plateaux – 1ère qualité',
                'description'        => 'Café arabica de la région de Bafoussam. Altitude 1400m. Transformation semi-lavée. Goût fruité et acidité équilibrée. Certifié coopérative locale.',
                'price'              => 4500,
                'currency'           => 'XAF',
                'unit'               => 'kg',
                'quantity_available' => 150,
                'region'             => 'Ouest',
                'country'            => 'Cameroun',
                'images'             => json_encode(['cafe_1.jpg', 'cafe_2.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(10),
            ],
            [
                'user_id'            => 5, // Marie
                'crop_id'            => 8, // Tomate
                'title'              => 'Tomates fraîches cerises et rondes',
                'description'        => 'Production sous serre semi-ouverte, sans pesticides chimiques. Livraison quotidienne possible sur Douala. Minimum 50 kg.',
                'price'              => 550,
                'currency'           => 'XAF',
                'unit'               => 'kg',
                'quantity_available' => 300,
                'region'             => 'Littoral',
                'country'            => 'Cameroun',
                'images'             => json_encode(['tomate_1.jpg', 'tomate_2.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(2),
            ],
            [
                'user_id'            => 6, // Ibrahim
                'crop_id'            => 17, // Arachide
                'title'              => 'Arachide décortiquée – Région Nord',
                'description'        => 'Arachide de bouche, triée et décortiquée. Excellente pour huile artisanale ou consommation directe. Conditionnée en sacs de 50 kg.',
                'price'              => 32000,
                'currency'           => 'XAF',
                'unit'               => 'sac 50kg',
                'quantity_available' => 80,
                'region'             => 'Nord',
                'country'            => 'Cameroun',
                'images'             => json_encode(['arachide_1.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(8),
            ],
            [
                'user_id'            => 7, // Solange
                'crop_id'            => 19, // Cacao
                'title'              => 'Fèves de cacao fermentées et séchées',
                'description'        => 'Cacao grade 1, fermentation contrôlée 7 jours, séchage 15 jours au soleil. Teneur en fèves violettes < 3%. Certification UTZ en cours.',
                'price'              => 1350,
                'currency'           => 'XAF',
                'unit'               => 'kg',
                'quantity_available' => 500,
                'region'             => 'Sud',
                'country'            => 'Cameroun',
                'images'             => json_encode(['cacao_1.jpg', 'cacao_2.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(15),
            ],
            [
                'user_id'            => 3, // Aminatou
                'crop_id'            => 3, // Mil
                'title'              => 'Mil pénicillaire – Récolte 2024',
                'description'        => 'Mil de la récolte 2024, bien séché. Idéal pour couscous, bouillie et bière locale. Vendu en sacs de 100 kg.',
                'price'              => 18000,
                'currency'           => 'XAF',
                'unit'               => 'sac 100kg',
                'quantity_available' => 30,
                'region'             => 'Extrême-Nord',
                'country'            => 'Cameroun',
                'images'             => json_encode(['mil_1.jpg']),
                'status'             => 'active',
                'created_at'         => now()->subDays(12),
            ],
        ];

        foreach ($products as $p) {
            DB::table('ac_marketplace_products')->insert(array_merge($p, ['updated_at' => now()]));
        }

        // ─── Commandes ────────────────────────────────────────────────────────
        $orders = [
            // Commandes terminées (delivered)
            [
                'reference'       => 'AC-2024-0001',
                'buyer_id'        => 5,  // Marie achète du maïs à Jean-Pierre
                'seller_id'       => 1,
                'product_id'      => 1,
                'quantity'        => 5,
                'unit_price'      => 22000,
                'total_amount'    => 110000,
                'commission_rate' => 3.00,
                'commission_amount'=> 3300,
                'currency'        => 'XAF',
                'status'          => 'delivered',
                'notes'           => 'Livré à Douala, satisfaction totale.',
                'created_at'      => now()->subDays(20),
            ],
            [
                'reference'       => 'AC-2024-0002',
                'buyer_id'        => 1,  // Jean-Pierre achète oignon à Aminatou
                'seller_id'       => 3,
                'product_id'      => 3,
                'quantity'        => 10,
                'unit_price'      => 7500,
                'total_amount'    => 75000,
                'commission_rate' => 3.00,
                'commission_amount'=> 2250,
                'currency'        => 'XAF',
                'status'          => 'delivered',
                'notes'           => null,
                'created_at'      => now()->subDays(15),
            ],
            [
                'reference'       => 'AC-2024-0003',
                'buyer_id'        => 4, // Paul achète cacao à Solange
                'seller_id'       => 7,
                'product_id'      => 7,
                'quantity'        => 100,
                'unit_price'      => 1350,
                'total_amount'    => 135000,
                'commission_rate' => 3.00,
                'commission_amount'=> 4050,
                'currency'        => 'XAF',
                'status'          => 'delivered',
                'notes'           => 'Excellent produit, recommande fortement.',
                'created_at'      => now()->subDays(12),
            ],
            // Commandes en cours
            [
                'reference'       => 'AC-2024-0004',
                'buyer_id'        => 6, // Ibrahim achète tomates à Marie
                'seller_id'       => 5,
                'product_id'      => 5,
                'quantity'        => 100,
                'unit_price'      => 550,
                'total_amount'    => 55000,
                'commission_rate' => 3.00,
                'commission_amount'=> 1650,
                'currency'        => 'XAF',
                'status'          => 'confirmed',
                'notes'           => 'Livraison prévue dans 3 jours',
                'created_at'      => now()->subDays(2),
            ],
            [
                'reference'       => 'AC-2024-0005',
                'buyer_id'        => 8, // Benoît achète café à Paul
                'seller_id'       => 4,
                'product_id'      => 4,
                'quantity'        => 20,
                'unit_price'      => 4500,
                'total_amount'    => 90000,
                'commission_rate' => 3.00,
                'commission_amount'=> 2700,
                'currency'        => 'XAF',
                'status'          => 'shipped',
                'notes'           => 'En transit vers Ngaoundéré',
                'created_at'      => now()->subDays(3),
            ],
            [
                'reference'       => 'AC-2024-0006',
                'buyer_id'        => 5,
                'seller_id'       => 6,
                'product_id'      => 6, // arachide
                'quantity'        => 4,
                'unit_price'      => 32000,
                'total_amount'    => 128000,
                'commission_rate' => 3.00,
                'commission_amount'=> 3840,
                'currency'        => 'XAF',
                'status'          => 'pending',
                'notes'           => null,
                'created_at'      => now()->subHours(6),
            ],
        ];

        foreach ($orders as $o) {
            DB::table('ac_orders')->insert(array_merge($o, ['updated_at' => now()]));
        }

        // ─── Transactions ─────────────────────────────────────────────────────
        $transactions = [
            ['reference' => 'TRX-001', 'user_id' => 1, 'order_id' => 1, 'type' => 'payment',    'amount' => 110000, 'description' => 'Paiement commande AC-2024-0001'],
            ['reference' => 'TRX-002', 'user_id' => 2, 'order_id' => 1, 'type' => 'commission',  'amount' => 3300,   'description' => 'Commission plateforme – AC-2024-0001'],
            ['reference' => 'TRX-003', 'user_id' => 1, 'order_id' => 2, 'type' => 'payment',    'amount' => 75000,  'description' => 'Paiement commande AC-2024-0002'],
            ['reference' => 'TRX-004', 'user_id' => 2, 'order_id' => 2, 'type' => 'commission',  'amount' => 2250,   'description' => 'Commission plateforme – AC-2024-0002'],
            ['reference' => 'TRX-005', 'user_id' => 4, 'order_id' => 3, 'type' => 'payment',    'amount' => 135000, 'description' => 'Paiement commande AC-2024-0003'],
            ['reference' => 'TRX-006', 'user_id' => 2, 'order_id' => 3, 'type' => 'commission',  'amount' => 4050,   'description' => 'Commission plateforme – AC-2024-0003'],
            ['reference' => 'TRX-007', 'user_id' => 1, 'order_id' => null, 'type' => 'subscription', 'amount' => 5000, 'description' => 'Abonnement Premium – 1 mois'],
            ['reference' => 'TRX-008', 'user_id' => 3, 'order_id' => null, 'type' => 'subscription', 'amount' => 15000,'description' => 'Abonnement Business – 1 mois'],
        ];

        foreach ($transactions as $t) {
            DB::table('ac_transactions')->insert(array_merge($t, [
                'currency'   => 'XAF',
                'metadata'   => null,
                'created_at' => now()->subDays(rand(1, 20)),
                'updated_at' => now(),
            ]));
        }

        // ─── Avis / Reviews ────────────────────────────────────────────────────
        $reviews = [
            ['user_id' => 5, 'order_id' => 1, 'seller_id' => 1, 'rating' => 5, 'comment' => 'Maïs de très bonne qualité, livraison rapide. Je recommande vivement Jean-Pierre !'],
            ['user_id' => 1, 'order_id' => 2, 'seller_id' => 3, 'rating' => 5, 'comment' => 'Oignons excellents, bien conservés. Aminatou est très professionnelle.'],
            ['user_id' => 4, 'order_id' => 3, 'seller_id' => 7, 'rating' => 4, 'comment' => 'Cacao grade 1 comme annoncé. Fermentation impeccable. Livraison un peu longue.'],
        ];

        foreach ($reviews as $r) {
            DB::table('ac_reviews')->insert(array_merge($r, [
                'created_at' => now()->subDays(rand(1, 10)),
                'updated_at' => now(),
            ]));
        }
    }
}
