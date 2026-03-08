<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NotificationsSeeder extends Seeder
{
    public function run(): void
    {
        $notifications = [
            // ── Utilisateur demo (user_id 1) ──────────────────────────────────
            [
                'user_id'    => 1,
                'type'       => 'order',
                'title'      => '🛒 Nouvelle commande reçue !',
                'message'    => 'Ibrahim Moussa a commandé 4 sacs d\'arachide (128 000 FCFA). Confirmez la commande AC-2024-0006.',
                'data'       => json_encode(['order_id' => 6, 'reference' => 'AC-2024-0006']),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subHours(6),
            ],
            [
                'user_id'    => 1,
                'type'       => 'price',
                'title'      => '📈 Alerte prix : Maïs dépasse 250 FCFA/kg',
                'message'    => 'Le maïs est à 262 FCFA/kg sur le marché de Yaoundé – votre seuil d\'alerte a été atteint. C\'est le moment de vendre !',
                'data'       => json_encode(['crop_id' => 1, 'prix' => 262, 'marche' => 'Marché Mvog-Mbi']),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subHours(14),
            ],
            [
                'user_id'    => 1,
                'type'       => 'weather',
                'title'      => '🐛 Alerte ravageurs – Région Centre',
                'message'    => 'Des chenilles légionnaires ont été signalées dans votre zone. Traitez vos cultures de maïs immédiatement avec Lambda-cyhalothrine.',
                'data'       => json_encode(['alert_id' => 4, 'zone' => 'Yaoundé Centre']),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subDays(1),
            ],
            [
                'user_id'    => 1,
                'type'       => 'order',
                'title'      => '✅ Commande livrée et payée',
                'message'    => 'La commande AC-2024-0001 (110 000 FCFA) a été livrée avec succès. L\'avis de Marie Ekotto : ⭐⭐⭐⭐⭐',
                'data'       => json_encode(['order_id' => 1, 'reference' => 'AC-2024-0001', 'rating' => 5]),
                'is_read'    => true,
                'email_sent' => true,
                'created_at' => now()->subDays(20),
            ],
            [
                'user_id'    => 1,
                'type'       => 'system',
                'title'      => '💰 Prêt agricole approuvé !',
                'message'    => 'Félicitations ! Votre demande de prêt de 800 000 FCFA pour l\'irrigation a été approuvée. Connectez-vous pour finaliser le dossier.',
                'data'       => json_encode(['loan_id' => 2]),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subDays(6),
            ],
            [
                'user_id'    => 1,
                'type'       => 'community',
                'title'      => '❤️ Votre post a 47 likes !',
                'message'    => '"Technique de conservation du maïs" est le post le plus liké de la semaine dans la catégorie Technique.',
                'data'       => json_encode(['post_id' => 1]),
                'is_read'    => true,
                'email_sent' => false,
                'created_at' => now()->subDays(5),
            ],
            [
                'user_id'    => 1,
                'type'       => 'alert',
                'title'      => '🌧️ Orages attendus à Douala',
                'message'    => 'Des précipitations importantes (180 mm) sont prévues sur le Littoral. Si vous avez des stocks ou livraisons, anticipez.',
                'data'       => json_encode(['zone_id' => 2, 'precipitation_mm' => 180]),
                'is_read'    => true,
                'email_sent' => true,
                'created_at' => now()->subDays(2),
            ],

            // ── Aminatou (user_id 3) ──────────────────────────────────────────
            [
                'user_id'    => 3,
                'type'       => 'price',
                'title'      => '📊 Prix mil en hausse – Extrême-Nord',
                'message'    => 'Le mil est actuellement à 155 FCFA/kg à Maroua, au-dessus de votre seuil d\'alerte (150 FCFA). Profitez-en !',
                'data'       => json_encode(['crop_id' => 3, 'prix' => 155]),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subHours(8),
            ],
            [
                'user_id'    => 3,
                'type'       => 'weather',
                'title'      => '☀️ Sécheresse critique – Extrême-Nord',
                'message'    => 'Situation critique dans votre zone. Déficit pluviométrique de 60%. Activez votre plan d\'irrigation si disponible.',
                'data'       => json_encode(['alert_id' => 2, 'severite' => 'critical']),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subDays(4),
            ],

            // ── Marie (user_id 5) ─────────────────────────────────────────────
            [
                'user_id'    => 5,
                'type'       => 'order',
                'title'      => '📦 Commande en cours d\'expédition',
                'message'    => 'Ibrahim Moussa a confirmé la réception de 100 kg de tomates. Paiement de 55 000 FCFA en cours de traitement.',
                'data'       => json_encode(['order_id' => 4, 'reference' => 'AC-2024-0004']),
                'is_read'    => false,
                'email_sent' => true,
                'created_at' => now()->subDays(1),
            ],
            [
                'user_id'    => 5,
                'type'       => 'system',
                'title'      => '📝 Demande de prêt reçue',
                'message'    => 'Votre demande de prêt de 600 000 FCFA est en cours d\'analyse. Réponse attendue sous 3 jours ouvrables.',
                'data'       => json_encode(['loan_id' => 4]),
                'is_read'    => true,
                'email_sent' => true,
                'created_at' => now()->subDays(2),
            ],

            // ── Benoît (user_id 8) ────────────────────────────────────────────
            [
                'user_id'    => 8,
                'type'       => 'system',
                'title'      => '🎉 Prêt débloqueé – 1 500 000 FCFA',
                'message'    => 'Votre prêt agricole de 1 500 000 FCFA a été décaissé. Les fonds sont disponibles dans votre compte mobile money.',
                'data'       => json_encode(['loan_id' => 1, 'montant' => 1500000]),
                'is_read'    => true,
                'email_sent' => true,
                'created_at' => now()->subDays(25),
            ],
            [
                'user_id'    => 8,
                'type'       => 'community',
                'title'      => '💬 94 personnes aiment votre témoignage',
                'message'    => 'Votre post sur le prêt agricole est viral ! 94 likes et 42 commentaires. Vous inspirez la communauté.',
                'data'       => json_encode(['post_id' => 7]),
                'is_read'    => false,
                'email_sent' => false,
                'created_at' => now()->subHours(12),
            ],
        ];

        foreach ($notifications as $notif) {
            DB::table('ac_notifications')->insert(array_merge($notif, ['updated_at' => now()]));
        }
    }
}
