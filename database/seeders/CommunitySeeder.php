<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CommunitySeeder extends Seeder
{
    public function run(): void
    {
        // ─── Posts communautaires ─────────────────────────────────────────────
        $posts = [
            [
                'user_id'        => 1,
                'title'          => 'Technique de conservation du maïs sans produits chimiques',
                'content'        => "Bonjour à tous ! Après 5 ans d'expérience, j'ai trouvé une méthode efficace pour conserver le maïs pendant 12 mois sans produits chimiques.\n\n**Étapes clés :**\n1. Séchage jusqu'à moins de 13% d'humidité\n2. Utilisation de feuilles de neem comme répulsif naturel\n3. Stockage en sacs hermétiques avec de la cendre de bois\n4. Contrôle mensuel de l'humidité\n\nCette méthode m'a permis de réduire mes pertes post-récolte de 40% à moins de 5%. Partagez vos expériences !",
                'category'       => 'technique',
                'images'         => json_encode(['post_mais_conservation.jpg']),
                'likes_count'    => 47,
                'comments_count' => 12,
                'created_at'     => now()->subDays(8),
            ],
            [
                'user_id'        => 3,
                'title'          => 'Alerte : prix de l\'oignon en hausse de 30% cette semaine',
                'content'        => "Attention aux vendeurs et acheteurs ! Le prix de l'oignon a augmenté de 30% cette semaine sur les marchés de Maroua et Garoua.\n\nCause principale : retard des camions en provenance du Niger à cause des routes endommagées.\n\nPour les acheteurs : approvisionnez-vous rapidement avant que les prix montent encore. Pour les vendeurs : c'est le bon moment pour écouler vos stocks !\n\nJ'ai vendu 50 filets ce matin à 9 000 FCFA pièce. Le marché repart à la hausse.",
                'category'       => 'marche',
                'images'         => null,
                'likes_count'    => 83,
                'comments_count' => 24,
                'created_at'     => now()->subDays(3),
            ],
            [
                'user_id'        => 4,
                'title'          => 'Mon expérience avec le café arabica de Bafoussam',
                'content'        => "La récolte 2024 est exceptionnelle ! Pour ceux qui souhaitent se lancer dans la caféiculture, voici mes conseils pour la région Ouest :\n\n• Altitude idéale : 1200–1600 m\n• Variété recommandée : Arabica SL28\n• Floraison en février-mars après les petites saisons sèches\n• Récolte sélective (grains rouges uniquement) pour un meilleur prix\n• Partenariat avec la coopérative UCAO pour garantir l'achat à prix fixe\n\nCette année j'ai obtenu 3,8 tonnes de café parche sur 4 hectares. Les acheteurs européens proposent 4500–5000 FCFA/kg.",
                'category'       => 'technique',
                'images'         => json_encode(['cafe_plantation.jpg', 'cafe_recolte.jpg']),
                'likes_count'    => 62,
                'comments_count' => 18,
                'created_at'     => now()->subDays(5),
            ],
            [
                'user_id'        => 5,
                'title'          => 'Comment j\'ai multiplié mes revenus par 3 avec la tomate sous serre',
                'content'        => "Il y a 2 ans, je cultivais 0,5 ha de tomates en plein champ avec des résultats médiocres. Aujourd'hui, avec 2 serres de 500 m² chacune, mes revenus ont triplé !\n\n**Investissement initial :** 2,5 millions FCFA (financement via crédit BEAC)\n**Retour sur investissement :** 8 mois\n\nAvantages :\n✅ Production 365 jours/an\n✅ Réduction des maladies de 70%\n✅ Économie d'eau (-60%)\n✅ Prix premium sur Douala (+25%)\n\nJe suis disponible pour des visites et formations. Envoyez-moi un message !",
                'category'       => 'temoignage',
                'images'         => json_encode(['serre_tomate1.jpg', 'serre_tomate2.jpg']),
                'likes_count'    => 128,
                'comments_count' => 35,
                'created_at'     => now()->subDays(12),
            ],
            [
                'user_id'        => 6,
                'title'          => 'Cherche partenaire pour groupement d\'achat engrais',
                'content'        => "Bonjour à tous les agriculteurs de la région Nord !\n\nJe cherche des partenaires pour faire un groupement d'achat d'engrais NPK et urée. Minimum 10 personnes pour bénéficier du tarif grossiste.\n\n**Économie estimée :** 15–20% sur le prix habituel\n**Commande groupée :** 50 tonnes minimum\n**Livraison :** Garoua, Ngaoundal, Poli\n\nSi vous êtes intéressés, commentez ou envoyez-moi votre localité et quantité souhaitée. On peut aussi inclure des semences certifiées dans la commande.",
                'category'       => 'entraide',
                'images'         => null,
                'likes_count'    => 41,
                'comments_count' => 29,
                'created_at'     => now()->subDays(6),
            ],
            [
                'user_id'        => 7,
                'title'          => 'Les bonnes pratiques de fermentation du cacao',
                'content'        => "La qualité du cacao commence après la récolte ! Beaucoup d'agriculteurs perdent 30–40% de leur valeur à cause d'une mauvaise fermentation.\n\n**Protocole que j'utilise :**\n- Cabosse ouverte dans les 24h après récolte\n- Fermentation 6–7 jours en caisses en bois\n- Retournement obligatoire J+2 et J+4\n- Température cible : 48–52°C\n- Séchage ensuite 12–15 jours au soleil\n\n**Résultat :** fèves violettes < 3%, prime qualité de 15% sur le prix de base.\n\nLa coopérative SCADCAM organise des formations gratuites ce mois-ci à Ebolowa.",
                'category'       => 'technique',
                'images'         => json_encode(['fermentation_cacao.jpg']),
                'likes_count'    => 75,
                'comments_count' => 21,
                'created_at'     => now()->subDays(9),
            ],
            [
                'user_id'        => 8,
                'title'          => 'Retour sur ma première demande de prêt agricole via AgriConnect',
                'content'        => "Je partage mon expérience pour encourager ceux qui hésitent.\n\nJ'ai demandé un prêt de 1,5 million FCFA pour acheter un motoculteur. La démarche sur AgriConnect m'a pris 20 minutes, et j'ai eu une réponse en 3 jours.\n\nMon score de crédit était de 68/100 grâce à mes transactions sur la plateforme et mon abonnement Premium. Le taux obtenu est de 8% annuel, bien en dessous des tontines locales (30–40%).\n\nLe motoculteur m'a permis de doubler ma surface cultivée cette saison. Merci AgriConnect !",
                'category'       => 'temoignage',
                'images'         => null,
                'likes_count'    => 94,
                'comments_count' => 42,
                'created_at'     => now()->subDays(4),
            ],
        ];

        foreach ($posts as $post) {
            DB::table('ac_community_posts')->insert(array_merge($post, ['updated_at' => now()]));
        }

        // ─── Commentaires ─────────────────────────────────────────────────────
        $comments = [
            // Post 1 – maïs conservation
            ['post_id' => 1, 'user_id' => 3, 'content' => 'Merci Jean-Pierre ! J\'utilise déjà la cendre de bois mais je ne connaissais pas les feuilles de neem. Je vais essayer dès la prochaine récolte.', 'created_at' => now()->subDays(7)],
            ['post_id' => 1, 'user_id' => 4, 'content' => 'Est-ce que cette méthode fonctionne aussi pour le sorgho ?', 'created_at' => now()->subDays(7)],
            ['post_id' => 1, 'user_id' => 1, 'content' => '@Paul Oui, ça marche aussi pour le sorgho et le mil ! Le principe est le même.', 'created_at' => now()->subDays(6)],
            ['post_id' => 1, 'user_id' => 5, 'content' => 'Super article ! Je partage dans mon groupe WhatsApp du village.', 'created_at' => now()->subDays(6)],

            // Post 2 – prix oignon
            ['post_id' => 2, 'user_id' => 1, 'content' => 'Confirmé à Yaoundé aussi, les prix montent. J\'ai acheté hier à 400 FCFA/kg au marché Mvog-Mbi.', 'created_at' => now()->subDays(3)],
            ['post_id' => 2, 'user_id' => 6, 'content' => 'Merci pour l\'info Aminatou. Je vais accélérer ma mise en marché cette semaine.', 'created_at' => now()->subDays(2)],
            ['post_id' => 2, 'user_id' => 8, 'content' => 'C\'est pour cette raison qu\'on a besoin des alertes prix d\'AgriConnect ! Ça évite de rater les opportunités.', 'created_at' => now()->subDays(2)],

            // Post 4 – tomate sous serre
            ['post_id' => 4, 'user_id' => 1, 'content' => 'Marie, bravo pour cette réussite ! Quelles variétés de tomates utilisez-vous ?', 'created_at' => now()->subDays(11)],
            ['post_id' => 4, 'user_id' => 5, 'content' => '@Jean-Pierre Principalement Roma VF et Mongal F1. Les deux sont adaptées à notre climat.', 'created_at' => now()->subDays(11)],
            ['post_id' => 4, 'user_id' => 3, 'content' => 'Inspirant ! J\'aimerais faire la même chose pour les piments. Vous acceptez des visites ?', 'created_at' => now()->subDays(10)],

            // Post 7 – prêt agricole
            ['post_id' => 7, 'user_id' => 1, 'content' => 'Super témoignage Benoît ! Le score de crédit est vraiment utile. Le mien est à 71 et j\'envisage aussi un prêt.', 'created_at' => now()->subDays(3)],
            ['post_id' => 7, 'user_id' => 4, 'content' => 'Question : est-ce que les nouveaux inscrits peuvent déjà faire une demande de prêt ?', 'created_at' => now()->subDays(3)],
            ['post_id' => 7, 'user_id' => 8, 'content' => '@Paul Il faut au minimum 3 mois d\'activité et un score > 40. C\'est accessible !', 'created_at' => now()->subDays(2)],
        ];

        foreach ($comments as $c) {
            DB::table('ac_comments')->insert(array_merge($c, ['updated_at' => now()]));
        }

        // ─── Likes ────────────────────────────────────────────────────────────
        $likes = [
            // Post 1
            ['post_id' => 1, 'user_id' => 3], ['post_id' => 1, 'user_id' => 4],
            ['post_id' => 1, 'user_id' => 5], ['post_id' => 1, 'user_id' => 6],
            ['post_id' => 1, 'user_id' => 7], ['post_id' => 1, 'user_id' => 8],
            // Post 2
            ['post_id' => 2, 'user_id' => 1], ['post_id' => 2, 'user_id' => 4],
            ['post_id' => 2, 'user_id' => 6], ['post_id' => 2, 'user_id' => 8],
            // Post 3
            ['post_id' => 3, 'user_id' => 1], ['post_id' => 3, 'user_id' => 5],
            ['post_id' => 3, 'user_id' => 7], ['post_id' => 3, 'user_id' => 8],
            // Post 4
            ['post_id' => 4, 'user_id' => 1], ['post_id' => 4, 'user_id' => 3],
            ['post_id' => 4, 'user_id' => 4], ['post_id' => 4, 'user_id' => 6],
            // Post 5
            ['post_id' => 5, 'user_id' => 1], ['post_id' => 5, 'user_id' => 3],
            ['post_id' => 5, 'user_id' => 7], ['post_id' => 5, 'user_id' => 8],
            // Post 7
            ['post_id' => 7, 'user_id' => 1], ['post_id' => 7, 'user_id' => 3],
            ['post_id' => 7, 'user_id' => 4], ['post_id' => 7, 'user_id' => 5],
        ];

        foreach ($likes as $l) {
            DB::table('ac_likes')->insert(array_merge($l, [
                'created_at' => now()->subDays(rand(1, 10)),
                'updated_at' => now(),
            ]));
        }
    }
}
