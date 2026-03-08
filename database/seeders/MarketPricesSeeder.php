<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class MarketPricesSeeder extends Seeder
{
    public function run(): void
    {
        // ─── Prix de base par culture (XAF/kg sauf mention contraire) ────────
        // Les prix sont stockés dans la devise locale de chaque pays ;
        // on appliquera un facteur de conversion ci-dessous.
        $basePrices = [
            1  => ['base' => 200,  'variance' => 40,  'name' => 'Maïs'],
            2  => ['base' => 350,  'variance' => 60,  'name' => 'Riz'],
            3  => ['base' => 130,  'variance' => 25,  'name' => 'Mil'],
            4  => ['base' => 120,  'variance' => 20,  'name' => 'Sorgho'],
            5  => ['base' => 120,  'variance' => 20,  'name' => 'Manioc'],
            8  => ['base' => 500,  'variance' => 100, 'name' => 'Tomate'],
            9  => ['base' => 350,  'variance' => 80,  'name' => 'Oignon'],
            10 => ['base' => 800,  'variance' => 150, 'name' => 'Piment'],
            12 => ['base' => 150,  'variance' => 30,  'name' => 'Banane plantain'],
            16 => ['base' => 600,  'variance' => 100, 'name' => 'Palmier à huile'],
            17 => ['base' => 700,  'variance' => 120, 'name' => 'Arachide'],
            19 => ['base' => 1200, 'variance' => 200, 'name' => 'Cacao'],
            20 => ['base' => 3500, 'variance' => 500, 'name' => 'Café'],
            // Cultures spécifiques Maroc
            21 => ['base' => 3000, 'variance' => 400, 'name' => 'Blé tendre'],
            22 => ['base' => 2800, 'variance' => 350, 'name' => 'Orge'],
            23 => ['base' => 8000, 'variance' => 800, 'name' => 'Olive'],
            24 => ['base' => 5000, 'variance' => 600, 'name' => 'Agrumes'],
            // Cultures spécifiques Sénégal
            25 => ['base' => 400,  'variance' => 60,  'name' => 'Niébé'],
            26 => ['base' => 1500, 'variance' => 200, 'name' => 'Gombo'],
            27 => ['base' => 350,  'variance' => 50,  'name' => 'Patate douce'],
        ];

        // ─── Marchés par pays ────────────────────────────────────────────────
        // Chaque entrée porte : pays, devise, facteur de conversion depuis XAF,
        // cultures concernées, région et nom du marché.
        //
        // Taux indicatifs (mars 2025) :
        //   1 XAF ≈ 0,0018 EUR  →  1 MAD ≈ 61 XAF  →  facteur MAD = 1/61  ≈ 0.0164
        //   1 XAF ≈ 1 XOF  (même zone CFA)
        //   1 NGN ≈ 0,37 XAF   →  facteur NGN = 1/0.37 ≈ 2.70
        //   1 GHS ≈ 41 XAF     →  facteur GHS = 1/41   ≈ 0.0244
        //   1 KES ≈ 5,4 XAF    →  facteur KES = 1/5.4  ≈ 0.185

        $marketsByCountry = [

            // ── Cameroun ────────────────────────────────────────────────────
            [
                'country'        => 'Cameroun',
                'currency'       => 'XAF',
                'conv_factor'    => 1.0,
                'source'         => 'MINADER',
                'crop_ids'       => [1, 2, 3, 4, 5, 8, 9, 10, 12, 16, 17, 19, 20],
                'markets'        => [
                    ['region' => 'Centre',       'market' => 'Marché Mvog-Mbi Yaoundé'],
                    ['region' => 'Littoral',     'market' => 'Marché Sandaga Douala'],
                    ['region' => 'Ouest',        'market' => 'Marché Central Bafoussam'],
                    ['region' => 'Nord',         'market' => 'Grand Marché Garoua'],
                    ['region' => 'Extrême-Nord', 'market' => 'Marché Artisanal Maroua'],
                    ['region' => 'Adamaoua',     'market' => 'Marché Central Ngaoundéré'],
                ],
            ],

            // ── Maroc ────────────────────────────────────────────────────────
            [
                'country'        => 'Maroc',
                'currency'       => 'MAD',
                'conv_factor'    => 0.0164,  // XAF → MAD
                'source'         => 'ONICL',
                'crop_ids'       => [2, 8, 9, 10, 17, 21, 22, 23, 24],
                'markets'        => [
                    ['region' => 'Grand Casablanca', 'market' => 'Marché de Gros Casablanca'],
                    ['region' => 'Rabat-Salé',       'market' => 'Souk Had Sellam Rabat'],
                    ['region' => 'Souss-Massa',      'market' => 'Marché de Gros Agadir'],
                    ['region' => 'Fès-Meknès',       'market' => 'Marché Central Fès'],
                    ['region' => 'Marrakech-Safi',   'market' => 'Souk El Khemis Marrakech'],
                ],
            ],

            // ── Sénégal ──────────────────────────────────────────────────────
            [
                'country'        => 'Sénégal',
                'currency'       => 'XOF',
                'conv_factor'    => 1.0,     // XAF ≈ XOF (même zone CFA)
                'source'         => 'ANSD',
                'crop_ids'       => [1, 2, 3, 5, 8, 9, 10, 17, 25, 26, 27],
                'markets'        => [
                    ['region' => 'Dakar',       'market' => 'Marché Sandaga Dakar'],
                    ['region' => 'Thiès',       'market' => 'Marché Central Thiès'],
                    ['region' => 'Kaolack',     'market' => 'Marché Ndoumbé Dakar Kaolack'],
                    ['region' => 'Saint-Louis', 'market' => 'Marché Sor Saint-Louis'],
                    ['region' => 'Ziguinchor',  'market' => 'Marché Boudody Ziguinchor'],
                ],
            ],

            // ── Nigeria ──────────────────────────────────────────────────────
            [
                'country'        => 'Nigeria',
                'currency'       => 'NGN',
                'conv_factor'    => 2.70,    // XAF → NGN
                'source'         => 'FMARD',
                'crop_ids'       => [1, 2, 4, 5, 8, 9, 10, 12, 17, 19],
                'markets'        => [
                    ['region' => 'Lagos',    'market' => 'Mile 12 Market Lagos'],
                    ['region' => 'Kano',     'market' => 'Singer Market Kano'],
                    ['region' => 'Abuja',    'market' => 'Wuse Market Abuja'],
                    ['region' => 'Onitsha',  'market' => 'Main Market Onitsha'],
                ],
            ],

            // ── Côte d'Ivoire ────────────────────────────────────────────────
            [
                'country'        => "Côte d'Ivoire",
                'currency'       => 'XOF',
                'conv_factor'    => 1.0,
                'source'         => 'MINADER-CI',
                'crop_ids'       => [1, 2, 5, 8, 9, 10, 12, 16, 17, 19, 20],
                'markets'        => [
                    ['region' => 'Abidjan',     'market' => 'Marché de Gros Adjamé'],
                    ['region' => 'Bouaké',      'market' => 'Marché Central Bouaké'],
                    ['region' => 'Yamoussoukro','market' => 'Marché de Yamoussoukro'],
                ],
            ],

            // ── Ghana ────────────────────────────────────────────────────────
            [
                'country'        => 'Ghana',
                'currency'       => 'GHS',
                'conv_factor'    => 0.0244,  // XAF → GHS
                'source'         => 'MOFA-GH',
                'crop_ids'       => [1, 2, 5, 8, 9, 10, 12, 17, 19, 20],
                'markets'        => [
                    ['region' => 'Greater Accra', 'market' => 'Makola Market Accra'],
                    ['region' => 'Ashanti',       'market' => 'Kumasi Central Market'],
                    ['region' => 'Northern',      'market' => 'Tamale Central Market'],
                ],
            ],

            // ── Kenya ────────────────────────────────────────────────────────
            [
                'country'        => 'Kenya',
                'currency'       => 'KES',
                'conv_factor'    => 0.185,   // XAF → KES
                'source'         => 'NCPB',
                'crop_ids'       => [1, 2, 5, 8, 9, 10, 17, 27],
                'markets'        => [
                    ['region' => 'Nairobi',  'market' => 'Wakulima Market Nairobi'],
                    ['region' => 'Mombasa',  'market' => 'Kongowea Market Mombasa'],
                    ['region' => 'Kisumu',   'market' => 'Kibuye Market Kisumu'],
                ],
            ],
        ];

        $records = [];

        // ─── Générer 45 jours d'historique de prix ────────────────────────────
        for ($daysAgo = 45; $daysAgo >= 0; $daysAgo--) {
            $date = Carbon::now()->subDays($daysAgo)->toDateString();

            foreach ($marketsByCountry as $countryData) {
                // On prend au maximum 3 marchés par pays pour ne pas exploser la table
                $selectedMarkets = array_slice($countryData['markets'], 0, 3);

                foreach ($countryData['crop_ids'] as $cropId) {
                    if (!isset($basePrices[$cropId])) {
                        continue;
                    }
                    $info = $basePrices[$cropId];

                    foreach ($selectedMarkets as $market) {
                        $variance    = rand(-$info['variance'], $info['variance']);
                        $trendFactor = 1 + (($daysAgo - 22) * 0.002); // légère tendance haussière
                        $rawPrice    = max(50, round(($info['base'] + $variance) * $trendFactor));

                        // Conversion dans la devise locale
                        $localPrice = max(1, round($rawPrice * $countryData['conv_factor'], 2));

                        $records[] = [
                            'crop_id'     => $cropId,
                            'region'      => $market['region'],
                            'country'     => $countryData['country'],
                            'market_name' => $market['market'],
                            'price'       => $localPrice,
                            'currency'    => $countryData['currency'],
                            'unit'        => in_array($cropId, [16]) ? 'litre' : 'kg',
                            'recorded_at' => $date,
                            'source'      => $countryData['source'],
                            'created_at'  => now(),
                            'updated_at'  => now(),
                        ];
                    }
                }
            }
        }

        // ─── Insertion par lots ───────────────────────────────────────────────
        foreach (array_chunk($records, 200) as $chunk) {
            DB::table('ac_market_prices')->insert($chunk);
        }

        // ─── Alertes météo ────────────────────────────────────────────────────
        $weatherAlerts = [

            // ── Cameroun ────────────────────────────────────────────────────
            [
                'zone_id'     => 4,
                'type'        => 'drought',
                'severity'    => 'high',
                'title'       => 'Risque de sécheresse prolongée – Nord Cameroun',
                'description' => 'Les prévisions météorologiques indiquent une période de faibles précipitations pour les 3 prochaines semaines dans la région Nord. Les agriculteurs sont invités à anticiper l\'irrigation de leurs cultures.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'temperature_max' => 42, 'humidite' => 18, 'vent_kmh' => 25]),
                'starts_at'   => now()->subDays(2),
                'ends_at'     => now()->addDays(18),
            ],
            [
                'zone_id'     => 5,
                'type'        => 'drought',
                'severity'    => 'critical',
                'title'       => 'Alerte sécheresse critique – Extrême-Nord Cameroun',
                'description' => 'Situation critique dans la zone du Lac Tchad. Déficit pluviométrique de 60 % par rapport à la normale saisonnière. Risque majeur pour les cultures de mil et sorgho.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'deficit_mm' => 85, 'temperature_max' => 45, 'humidite' => 12]),
                'starts_at'   => now()->subDays(5),
                'ends_at'     => now()->addDays(25),
            ],
            [
                'zone_id'     => 2,
                'type'        => 'flood',
                'severity'    => 'medium',
                'title'       => 'Risque d\'inondation – Zone côtière Littoral',
                'description' => 'Fortes pluies attendues cette semaine sur le Littoral. Les zones basses sont particulièrement exposées. Protégez vos stocks et évitez les zones inondables.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'precipitation_mm' => 180, 'duree_heures' => 48]),
                'starts_at'   => now()->addDays(1),
                'ends_at'     => now()->addDays(6),
            ],
            [
                'zone_id'     => 1,
                'type'        => 'pest',
                'severity'    => 'high',
                'title'       => 'Invasion de chenilles légionnaires – Centre Cameroun',
                'description' => 'Des signalements de Spodoptera frugiperda ont été confirmés dans plusieurs exploitations de la région Centre. Traitez vos cultures de maïs immédiatement.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'cultures_touchees' => ['Maïs', 'Sorgho'], 'traitement_recommande' => 'Lambda-cyhalothrine']),
                'starts_at'   => now()->subDays(3),
                'ends_at'     => now()->addDays(14),
            ],
            [
                'zone_id'     => 3,
                'type'        => 'storm',
                'severity'    => 'medium',
                'title'       => 'Orages violents attendus – Région Ouest',
                'description' => 'Des orages avec grêle et vents forts (60–80 km/h) sont prévus pour ce weekend. Sécurisez vos équipements et infrastructures agricoles.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'vent_kmh' => 75, 'grele' => true, 'precipitation_mm' => 95]),
                'starts_at'   => now()->addDays(2),
                'ends_at'     => now()->addDays(4),
            ],
            [
                'zone_id'     => 6,
                'type'        => 'weather',
                'severity'    => 'low',
                'title'       => 'Retour de la saison des pluies – Adamaoua',
                'description' => 'Les premières pluies de la saison sont attendues dans l\'Adamaoua. Bonne nouvelle pour les cultures ! Préparez vos semis.',
                'metadata'    => json_encode(['country' => 'Cameroun', 'precipitation_prevue_mm' => 45, 'temperature_min' => 18]),
                'starts_at'   => now()->addDays(3),
                'ends_at'     => now()->addDays(10),
            ],

            // ── Maroc ────────────────────────────────────────────────────────
            [
                'zone_id'     => 10,
                'type'        => 'drought',
                'severity'    => 'high',
                'title'       => 'Stress hydrique – Souss-Massa Maroc',
                'description' => 'La région de Souss-Massa enregistre un déficit en eau d\'irrigation supérieur à 40 %. Les producteurs d\'agrumes et d\'oliviers sont fortement invités à rationaliser leur consommation.',
                'metadata'    => json_encode(['country' => 'Maroc', 'deficit_irrigation_pct' => 40, 'temperature_max' => 38, 'humidite' => 22]),
                'starts_at'   => now()->subDays(7),
                'ends_at'     => now()->addDays(20),
            ],
            [
                'zone_id'     => 11,
                'type'        => 'pest',
                'severity'    => 'medium',
                'title'       => 'Mouche de l\'olive – Fès-Meknès',
                'description' => 'Une recrudescence de Bactrocera oleae a été signalée dans les oliveraies de la région Fès-Meknès. Des traitements phytosanitaires ciblés sont recommandés avant la récolte.',
                'metadata'    => json_encode(['country' => 'Maroc', 'cultures_touchees' => ['Olive'], 'traitement_recommande' => 'piège attractif + spinosad']),
                'starts_at'   => now()->subDays(4),
                'ends_at'     => now()->addDays(10),
            ],
            [
                'zone_id'     => 12,
                'type'        => 'frost',
                'severity'    => 'medium',
                'title'       => 'Risque de gelée – Hauts Plateaux',
                'description' => 'Des températures nocturnes inférieures à -3 °C sont attendues sur les hauts plateaux du Moyen-Atlas. Les cultures de blé et d\'orge en début de cycle sont menacées.',
                'metadata'    => json_encode(['country' => 'Maroc', 'temperature_min' => -3, 'cultures_touchees' => ['Blé tendre', 'Orge']]),
                'starts_at'   => now()->addDays(1),
                'ends_at'     => now()->addDays(5),
            ],

            // ── Sénégal ──────────────────────────────────────────────────────
            [
                'zone_id'     => 20,
                'type'        => 'drought',
                'severity'    => 'high',
                'title'       => 'Sécheresse – Bassin arachidier',
                'description' => 'La zone du bassin arachidier (Kaolack, Thiès, Kaffrine) souffre d\'un déficit pluviométrique marqué. La production d\'arachide risque de baisser de 25 % cette campagne.',
                'metadata'    => json_encode(['country' => 'Sénégal', 'deficit_mm' => 60, 'cultures_touchees' => ['Arachide', 'Mil'], 'humidite' => 20]),
                'starts_at'   => now()->subDays(10),
                'ends_at'     => now()->addDays(15),
            ],
            [
                'zone_id'     => 21,
                'type'        => 'flood',
                'severity'    => 'high',
                'title'       => 'Inondations – Vallée du Fleuve Sénégal',
                'description' => 'La crue du fleuve Sénégal menace les périmètres irrigués de Saint-Louis et Podor. Mise en alerte des services de protection civile. Évacuez les stocks situés en zones basses.',
                'metadata'    => json_encode(['country' => 'Sénégal', 'niveau_fleuve_m' => 7.8, 'precipitation_mm' => 220, 'zones_risque' => ['Saint-Louis', 'Podor']]),
                'starts_at'   => now()->subDays(1),
                'ends_at'     => now()->addDays(12),
            ],
            [
                'zone_id'     => 22,
                'type'        => 'pest',
                'severity'    => 'critical',
                'title'       => 'Criquet pèlerin – Alerte rouge Sénégal',
                'description' => 'Des essaims de criquets pèlerins (Schistocerca gregaria) ont été détectés dans le nord du Sénégal. Une intervention aérienne est en cours. Signalez toute observation aux autorités agricoles.',
                'metadata'    => json_encode(['country' => 'Sénégal', 'surface_menacee_ha' => 15000, 'cultures_touchees' => ['Mil', 'Sorgho', 'Niébé']]),
                'starts_at'   => now()->subDays(2),
                'ends_at'     => now()->addDays(21),
            ],

            // ── Nigeria ──────────────────────────────────────────────────────
            [
                'zone_id'     => 30,
                'type'        => 'flood',
                'severity'    => 'critical',
                'title'       => 'Inondations – Delta du Niger',
                'description' => 'Des inondations sévères ravagent les cultures dans le Delta du Niger suite à l\'ouverture des vannes du barrage de Lagdo. Des milliers d\'hectares de manioc et riz sont affectés.',
                'metadata'    => json_encode(['country' => 'Nigeria', 'surface_inondee_ha' => 30000, 'cultures_touchees' => ['Manioc', 'Riz'], 'duree_prevue_jours' => 30]),
                'starts_at'   => now()->subDays(8),
                'ends_at'     => now()->addDays(22),
            ],

            // ── Côte d'Ivoire ────────────────────────────────────────────────
            [
                'zone_id'     => 40,
                'type'        => 'pest',
                'severity'    => 'high',
                'title'       => 'Mirides du cacaoyer – Centre-Ouest',
                'description' => 'Une forte pression de mirides est signalée dans les cacaoyères du Centre-Ouest. Les producteurs doivent traiter avant la grande saison pour préserver leurs rendements.',
                'metadata'    => json_encode(['country' => "Côte d'Ivoire", 'cultures_touchees' => ['Cacao'], 'traitement_recommande' => 'Imidaclopride']),
                'starts_at'   => now()->subDays(5),
                'ends_at'     => now()->addDays(20),
            ],

            // ── Ghana ────────────────────────────────────────────────────────
            [
                'zone_id'     => 50,
                'type'        => 'weather',
                'severity'    => 'low',
                'title'       => 'Pluies favorables – Region Ashanti',
                'description' => 'Des pluies abondantes et bien réparties sont attendues sur la région Ashanti. Conditions idéales pour démarrer la campagne de cacao et de maïs.',
                'metadata'    => json_encode(['country' => 'Ghana', 'precipitation_prevue_mm' => 80, 'temperature_min' => 22]),
                'starts_at'   => now()->addDays(2),
                'ends_at'     => now()->addDays(14),
            ],
        ];

        foreach ($weatherAlerts as $alert) {
            DB::table('ac_weather_alerts')->insert(array_merge($alert, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
