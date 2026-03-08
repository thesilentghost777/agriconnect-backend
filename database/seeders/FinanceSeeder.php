<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FinanceSeeder extends Seeder
{
    public function run(): void
    {
        // ─── Scores de crédit ─────────────────────────────────────────────────
        $creditScores = [
            [
                'user_id'             => 1,
                'score'               => 71,
                'anciennete_points'   => 18,
                'transactions_points' => 25,
                'connexions_points'   => 15,
                'plan_points'         => 13,
                'breakdown'           => json_encode([
                    'anciennete_mois'       => 6,
                    'nb_transactions'       => 5,
                    'montant_total_XAF'     => 185000,
                    'nb_posts_communaute'   => 2,
                    'plan'                  => 'premium',
                    'nb_avis_positifs'      => 1,
                ]),
            ],
            [
                'user_id'             => 3,
                'score'               => 85,
                'anciennete_points'   => 22,
                'transactions_points' => 30,
                'connexions_points'   => 18,
                'plan_points'         => 15,
                'breakdown'           => json_encode([
                    'anciennete_mois'       => 8,
                    'nb_transactions'       => 8,
                    'montant_total_XAF'     => 310000,
                    'nb_posts_communaute'   => 3,
                    'plan'                  => 'business',
                    'nb_avis_positifs'      => 2,
                ]),
            ],
            [
                'user_id'             => 4,
                'score'               => 68,
                'anciennete_points'   => 15,
                'transactions_points' => 22,
                'connexions_points'   => 18,
                'plan_points'         => 13,
                'breakdown'           => json_encode([
                    'anciennete_mois'       => 5,
                    'nb_transactions'       => 4,
                    'montant_total_XAF'     => 225000,
                    'nb_posts_communaute'   => 2,
                    'plan'                  => 'premium',
                    'nb_avis_positifs'      => 1,
                ]),
            ],
            [
                'user_id'             => 8,
                'score'               => 62,
                'anciennete_points'   => 12,
                'transactions_points' => 18,
                'connexions_points'   => 20,
                'plan_points'         => 12,
                'breakdown'           => json_encode([
                    'anciennete_mois'       => 4,
                    'nb_transactions'       => 3,
                    'montant_total_XAF'     => 90000,
                    'nb_posts_communaute'   => 4,
                    'plan'                  => 'premium',
                    'nb_avis_positifs'      => 0,
                ]),
            ],
        ];

        foreach ($creditScores as $score) {
            DB::table('ac_credit_scores')->insert(array_merge($score, [
                'created_at' => now()->subDays(rand(1, 5)),
                'updated_at' => now(),
            ]));
        }

        // ─── Demandes de prêt ─────────────────────────────────────────────────
        $loans = [
            [
                'user_id'                  => 8, // Benoît (prêt approuvé – motoculteur)
                'amount'                   => 1500000,
                'currency'                 => 'XAF',
                'purpose'                  => 'Achat motoculteur',
                'description'              => 'Je souhaite acquérir un motoculteur Honda FJ500 pour mécaniser mon exploitation de 18 ha dans l\'Adamaoua. Cela me permettra de doubler ma superficie cultivée et de réduire les coûts de main-d\'œuvre.',
                'duration_months'          => 24,
                'status'                   => 'disbursed',
                'rejection_reason'         => null,
                'credit_score_at_request'  => 62,
                'created_at'               => now()->subDays(30),
            ],
            [
                'user_id'                  => 1, // Jean-Pierre – prêt en cours d\'évaluation
                'amount'                   => 800000,
                'currency'                 => 'XAF',
                'purpose'                  => 'Système d\'irrigation goutte-à-goutte',
                'description'              => 'Installation d\'un système d\'irrigation pour mes 5,5 ha de maïs et manioc. Le projet permettra de cultiver en saison sèche et d\'augmenter la production annuelle de 60%.',
                'duration_months'          => 18,
                'status'                   => 'approved',
                'rejection_reason'         => null,
                'credit_score_at_request'  => 71,
                'created_at'               => now()->subDays(7),
            ],
            [
                'user_id'                  => 3, // Aminatou – prêt remboursé
                'amount'                   => 2000000,
                'currency'                 => 'XAF',
                'purpose'                  => 'Agrandissement entrepôt de stockage',
                'description'              => 'Construction d\'un magasin de stockage de 200 m² pour stocker mes oignons et céréales en attendant les meilleures conditions de marché.',
                'duration_months'          => 36,
                'status'                   => 'repaid',
                'rejection_reason'         => null,
                'credit_score_at_request'  => 78,
                'created_at'               => now()->subMonths(14),
            ],
            [
                'user_id'                  => 5, // Marie – prêt en attente
                'amount'                   => 600000,
                'currency'                 => 'XAF',
                'purpose'                  => 'Extension serre maraîchère',
                'description'              => 'Ajout d\'une troisième serre de 500 m² pour tripler la production de tomates. Plan de remboursement sur 12 mois.',
                'duration_months'          => 12,
                'status'                   => 'pending',
                'rejection_reason'         => null,
                'credit_score_at_request'  => 55,
                'created_at'               => now()->subDays(2),
            ],
        ];

        foreach ($loans as $loan) {
            DB::table('ac_loan_requests')->insert(array_merge($loan, ['updated_at' => now()]));
        }

        // ─── Assurances ───────────────────────────────────────────────────────
        $insurances = [
            [
                'user_id'         => 1,
                'type'            => 'crop',
                'coverage_amount' => 3000000,
                'premium'         => 75000,
                'currency'        => 'XAF',
                'status'          => 'active',
                'starts_at'       => now()->subMonths(2)->toDateString(),
                'expires_at'      => now()->addMonths(10)->toDateString(),
                'details'         => 'Assurance récolte maïs et manioc – couverture sécheresse, inondation, ravageurs.',
            ],
            [
                'user_id'         => 3,
                'type'            => 'crop',
                'coverage_amount' => 5000000,
                'premium'         => 125000,
                'currency'        => 'XAF',
                'status'          => 'active',
                'starts_at'       => now()->subMonths(1)->toDateString(),
                'expires_at'      => now()->addMonths(11)->toDateString(),
                'details'         => 'Assurance cultures maraîchères et céréales – zone Extrême-Nord.',
            ],
            [
                'user_id'         => 6,
                'type'            => 'equipment',
                'coverage_amount' => 2500000,
                'premium'         => 60000,
                'currency'        => 'XAF',
                'status'          => 'active',
                'starts_at'       => now()->subMonths(3)->toDateString(),
                'expires_at'      => now()->addMonths(9)->toDateString(),
                'details'         => 'Assurance matériel agricole : tracteur John Deere 3042D.',
            ],
            [
                'user_id'         => 7,
                'type'            => 'crop',
                'coverage_amount' => 4000000,
                'premium'         => 100000,
                'currency'        => 'XAF',
                'status'          => 'claimed',
                'starts_at'       => now()->subMonths(8)->toDateString(),
                'expires_at'      => now()->addMonths(4)->toDateString(),
                'details'         => 'Sinistre déclaré : attaque de mouche des fruits sur plantation de cacao – en cours de traitement.',
            ],
        ];

        foreach ($insurances as $ins) {
            DB::table('ac_insurances')->insert(array_merge($ins, [
                'created_at' => now()->subDays(rand(10, 90)),
                'updated_at' => now(),
            ]));
        }
    }
}
