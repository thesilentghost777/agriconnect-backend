/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.1-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: agriconnect
-- ------------------------------------------------------
-- Server version	11.8.1-MariaDB-4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `ac_chatbot_logs`
--

DROP TABLE IF EXISTS `ac_chatbot_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_chatbot_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `response` text DEFAULT NULL,
  `langue` varchar(10) NOT NULL DEFAULT 'fr',
  `response_time_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_chatbot_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_chatbot_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_chatbot_logs`
--

LOCK TABLES `ac_chatbot_logs` WRITE;
/*!40000 ALTER TABLE `ac_chatbot_logs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ac_chatbot_logs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_comments`
--

DROP TABLE IF EXISTS `ac_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_comments_post_id_foreign` (`post_id`),
  KEY `ac_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ac_community_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_comments`
--

LOCK TABLES `ac_comments` WRITE;
/*!40000 ALTER TABLE `ac_comments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_comments` VALUES
(1,1,3,'Merci Jean-Pierre ! J\'utilise déjà la cendre de bois mais je ne connaissais pas les feuilles de neem. Je vais essayer dès la prochaine récolte.','2026-02-28 06:22:08','2026-03-07 06:22:08'),
(2,1,4,'Est-ce que cette méthode fonctionne aussi pour le sorgho ?','2026-02-28 06:22:08','2026-03-07 06:22:08'),
(3,1,1,'@Paul Oui, ça marche aussi pour le sorgho et le mil ! Le principe est le même.','2026-03-01 06:22:08','2026-03-07 06:22:08'),
(4,1,5,'Super article ! Je partage dans mon groupe WhatsApp du village.','2026-03-01 06:22:08','2026-03-07 06:22:08'),
(5,2,1,'Confirmé à Yaoundé aussi, les prix montent. J\'ai acheté hier à 400 FCFA/kg au marché Mvog-Mbi.','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(6,2,6,'Merci pour l\'info Aminatou. Je vais accélérer ma mise en marché cette semaine.','2026-03-05 06:22:08','2026-03-07 06:22:08'),
(7,2,8,'C\'est pour cette raison qu\'on a besoin des alertes prix d\'AgriConnect ! Ça évite de rater les opportunités.','2026-03-05 06:22:08','2026-03-07 06:22:08'),
(8,4,1,'Marie, bravo pour cette réussite ! Quelles variétés de tomates utilisez-vous ?','2026-02-24 06:22:08','2026-03-07 06:22:08'),
(9,4,5,'@Jean-Pierre Principalement Roma VF et Mongal F1. Les deux sont adaptées à notre climat.','2026-02-24 06:22:08','2026-03-07 06:22:08'),
(10,4,3,'Inspirant ! J\'aimerais faire la même chose pour les piments. Vous acceptez des visites ?','2026-02-25 06:22:08','2026-03-07 06:22:08'),
(11,7,1,'Super témoignage Benoît ! Le score de crédit est vraiment utile. Le mien est à 71 et j\'envisage aussi un prêt.','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(12,7,4,'Question : est-ce que les nouveaux inscrits peuvent déjà faire une demande de prêt ?','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(13,7,8,'@Paul Il faut au minimum 3 mois d\'activité et un score > 40. C\'est accessible !','2026-03-05 06:22:08','2026-03-07 06:22:08'),
(14,8,1,'Va chier','2026-03-07 16:03:24','2026-03-07 16:03:24'),
(15,8,1,'Idiote','2026-03-07 16:03:31','2026-03-07 16:03:31'),
(16,3,1,'Co\'nqrd','2026-03-07 16:03:49','2026-03-07 16:03:49'),
(17,3,1,'Co\'nqrd','2026-03-07 16:03:50','2026-03-07 16:03:50'),
(18,1,1,'Fou le Camp','2026-03-07 16:04:03','2026-03-07 16:04:03');
/*!40000 ALTER TABLE `ac_comments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_community_posts`
--

DROP TABLE IF EXISTS `ac_community_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_community_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `category` varchar(255) DEFAULT NULL,
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `comments_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_community_posts_user_id_created_at_index` (`user_id`,`created_at`),
  CONSTRAINT `ac_community_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_community_posts`
--

LOCK TABLES `ac_community_posts` WRITE;
/*!40000 ALTER TABLE `ac_community_posts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_community_posts` VALUES
(1,1,'Technique de conservation du maïs sans produits chimiques','Bonjour à tous ! Après 5 ans d\'expérience, j\'ai trouvé une méthode efficace pour conserver le maïs pendant 12 mois sans produits chimiques.\n\n**Étapes clés :**\n1. Séchage jusqu\'à moins de 13% d\'humidité\n2. Utilisation de feuilles de neem comme répulsif naturel\n3. Stockage en sacs hermétiques avec de la cendre de bois\n4. Contrôle mensuel de l\'humidité\n\nCette méthode m\'a permis de réduire mes pertes post-récolte de 40% à moins de 5%. Partagez vos expériences !','[\"post_mais_conservation.jpg\"]','technique',48,13,'2026-02-27 06:22:08','2026-03-07 16:04:29'),
(2,3,'Alerte : prix de l\'oignon en hausse de 30% cette semaine','Attention aux vendeurs et acheteurs ! Le prix de l\'oignon a augmenté de 30% cette semaine sur les marchés de Maroua et Garoua.\n\nCause principale : retard des camions en provenance du Niger à cause des routes endommagées.\n\nPour les acheteurs : approvisionnez-vous rapidement avant que les prix montent encore. Pour les vendeurs : c\'est le bon moment pour écouler vos stocks !\n\nJ\'ai vendu 50 filets ce matin à 9 000 FCFA pièce. Le marché repart à la hausse.',NULL,'marche',82,24,'2026-03-04 06:22:08','2026-03-07 14:32:12'),
(3,4,'Mon expérience avec le café arabica de Bafoussam','La récolte 2024 est exceptionnelle ! Pour ceux qui souhaitent se lancer dans la caféiculture, voici mes conseils pour la région Ouest :\n\n• Altitude idéale : 1200–1600 m\n• Variété recommandée : Arabica SL28\n• Floraison en février-mars après les petites saisons sèches\n• Récolte sélective (grains rouges uniquement) pour un meilleur prix\n• Partenariat avec la coopérative UCAO pour garantir l\'achat à prix fixe\n\nCette année j\'ai obtenu 3,8 tonnes de café parche sur 4 hectares. Les acheteurs européens proposent 4500–5000 FCFA/kg.','[\"cafe_plantation.jpg\",\"cafe_recolte.jpg\"]','technique',61,20,'2026-03-02 06:22:08','2026-03-07 16:03:50'),
(4,5,'Comment j\'ai multiplié mes revenus par 3 avec la tomate sous serre','Il y a 2 ans, je cultivais 0,5 ha de tomates en plein champ avec des résultats médiocres. Aujourd\'hui, avec 2 serres de 500 m² chacune, mes revenus ont triplé !\n\n**Investissement initial :** 2,5 millions FCFA (financement via crédit BEAC)\n**Retour sur investissement :** 8 mois\n\nAvantages :\n✅ Production 365 jours/an\n✅ Réduction des maladies de 70%\n✅ Économie d\'eau (-60%)\n✅ Prix premium sur Douala (+25%)\n\nJe suis disponible pour des visites et formations. Envoyez-moi un message !','[\"serre_tomate1.jpg\",\"serre_tomate2.jpg\"]','temoignage',128,35,'2026-02-23 06:22:08','2026-03-07 06:22:08'),
(5,6,'Cherche partenaire pour groupement d\'achat engrais','Bonjour à tous les agriculteurs de la région Nord !\n\nJe cherche des partenaires pour faire un groupement d\'achat d\'engrais NPK et urée. Minimum 10 personnes pour bénéficier du tarif grossiste.\n\n**Économie estimée :** 15–20% sur le prix habituel\n**Commande groupée :** 50 tonnes minimum\n**Livraison :** Garoua, Ngaoundal, Poli\n\nSi vous êtes intéressés, commentez ou envoyez-moi votre localité et quantité souhaitée. On peut aussi inclure des semences certifiées dans la commande.',NULL,'entraide',40,29,'2026-03-01 06:22:08','2026-03-07 16:04:24'),
(6,7,'Les bonnes pratiques de fermentation du cacao','La qualité du cacao commence après la récolte ! Beaucoup d\'agriculteurs perdent 30–40% de leur valeur à cause d\'une mauvaise fermentation.\n\n**Protocole que j\'utilise :**\n- Cabosse ouverte dans les 24h après récolte\n- Fermentation 6–7 jours en caisses en bois\n- Retournement obligatoire J+2 et J+4\n- Température cible : 48–52°C\n- Séchage ensuite 12–15 jours au soleil\n\n**Résultat :** fèves violettes < 3%, prime qualité de 15% sur le prix de base.\n\nLa coopérative SCADCAM organise des formations gratuites ce mois-ci à Ebolowa.','[\"fermentation_cacao.jpg\"]','technique',75,21,'2026-02-26 06:22:08','2026-03-07 06:22:08'),
(7,8,'Retour sur ma première demande de prêt agricole via AgriConnect','Je partage mon expérience pour encourager ceux qui hésitent.\n\nJ\'ai demandé un prêt de 1,5 million FCFA pour acheter un motoculteur. La démarche sur AgriConnect m\'a pris 20 minutes, et j\'ai eu une réponse en 3 jours.\n\nMon score de crédit était de 68/100 grâce à mes transactions sur la plateforme et mon abonnement Premium. Le taux obtenu est de 8% annuel, bien en dessous des tontines locales (30–40%).\n\nLe motoculteur m\'a permis de doubler ma surface cultivée cette saison. Merci AgriConnect !',NULL,'temoignage',94,42,'2026-03-03 06:22:08','2026-03-07 06:22:08'),
(8,1,'Êtes vous con','Mince','[]','question',1,2,'2026-03-07 11:36:17','2026-03-07 16:03:31'),
(9,1,'Try','Xtry','[]','question',0,0,'2026-03-07 16:13:09','2026-03-07 16:13:09');
/*!40000 ALTER TABLE `ac_community_posts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_credit_scores`
--

DROP TABLE IF EXISTS `ac_credit_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_credit_scores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  `anciennete_points` int(11) NOT NULL DEFAULT 0,
  `transactions_points` int(11) NOT NULL DEFAULT 0,
  `connexions_points` int(11) NOT NULL DEFAULT 0,
  `plan_points` int(11) NOT NULL DEFAULT 0,
  `breakdown` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`breakdown`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_credit_scores_user_id_created_at_index` (`user_id`,`created_at`),
  CONSTRAINT `ac_credit_scores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_credit_scores`
--

LOCK TABLES `ac_credit_scores` WRITE;
/*!40000 ALTER TABLE `ac_credit_scores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_credit_scores` VALUES
(1,1,71,18,25,15,13,'{\"anciennete_mois\":6,\"nb_transactions\":5,\"montant_total_XAF\":185000,\"nb_posts_communaute\":2,\"plan\":\"premium\",\"nb_avis_positifs\":1}','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(2,3,85,22,30,18,15,'{\"anciennete_mois\":8,\"nb_transactions\":8,\"montant_total_XAF\":310000,\"nb_posts_communaute\":3,\"plan\":\"business\",\"nb_avis_positifs\":2}','2026-03-03 06:22:08','2026-03-07 06:22:08'),
(3,4,68,15,22,18,13,'{\"anciennete_mois\":5,\"nb_transactions\":4,\"montant_total_XAF\":225000,\"nb_posts_communaute\":2,\"plan\":\"premium\",\"nb_avis_positifs\":1}','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(4,8,62,12,18,20,12,'{\"anciennete_mois\":4,\"nb_transactions\":3,\"montant_total_XAF\":90000,\"nb_posts_communaute\":4,\"plan\":\"premium\",\"nb_avis_positifs\":0}','2026-03-03 06:22:08','2026-03-07 06:22:08'),
(5,1,36,5,6,5,20,'{\"anciennete\":{\"points\":5,\"max\":20,\"months\":5.222538838346147},\"transactions\":{\"points\":6,\"max\":30},\"connexions\":{\"points\":5,\"max\":20},\"plan\":{\"points\":20,\"max\":30,\"plan\":\"premium\"}}','2026-03-07 11:54:52','2026-03-07 11:54:52');
/*!40000 ALTER TABLE `ac_credit_scores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_crops`
--

DROP TABLE IF EXISTS `ac_crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_crops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_local` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_crops`
--

LOCK TABLES `ac_crops` WRITE;
/*!40000 ALTER TABLE `ac_crops` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_crops` VALUES
(1,'Maïs','Mbigou','cereale','🌽',1,'2026-03-07 06:22:05','2026-03-07 06:22:05'),
(2,'Riz','Rizou','cereale','🌾',1,'2026-03-07 06:22:05','2026-03-07 06:22:05'),
(3,'Mil','Gawri','cereale','🌾',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(4,'Sorgho','Njigari','cereale','🌾',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(5,'Manioc','Bobolo','tubercule','🥔',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(6,'Igname','Nkan','tubercule','🥔',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(7,'Patate douce','Nkwem','tubercule','🍠',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(8,'Tomate','Tomate','legume','🍅',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(9,'Oignon','Oignon','legume','🧅',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(10,'Piment','Kanda','legume','🌶️',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(11,'Gombo','Kabo','legume','🥬',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(12,'Banane plantain','Mbang','fruit','🍌',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(13,'Mangue','Mango','fruit','🥭',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(14,'Avocat','Pear','fruit','🥑',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(15,'Ananas','Ananas','fruit','🍍',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(16,'Palmier à huile','Mbanga','oleagineux','🌴',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(17,'Arachide','N\'gon','oleagineux','🥜',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(18,'Soja','Soja','oleagineux','🫘',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(19,'Cacao','Cacao','oleagineux','🍫',1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(20,'Café','Café','oleagineux','☕',1,'2026-03-07 06:22:06','2026-03-07 06:22:06');
/*!40000 ALTER TABLE `ac_crops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_diagnostic_logs`
--

DROP TABLE IF EXISTS `ac_diagnostic_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_diagnostic_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `prediction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prediction`)),
  `confidence` double DEFAULT NULL,
  `response_time_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_diagnostic_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_diagnostic_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_diagnostic_logs`
--

LOCK TABLES `ac_diagnostic_logs` WRITE;
/*!40000 ALTER TABLE `ac_diagnostic_logs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ac_diagnostic_logs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_insurances`
--

DROP TABLE IF EXISTS `ac_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_insurances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `coverage_amount` decimal(14,2) NOT NULL,
  `premium` decimal(12,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `status` enum('active','expired','claimed','cancelled') NOT NULL DEFAULT 'active',
  `starts_at` date NOT NULL,
  `expires_at` date NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_insurances_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_insurances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_insurances`
--

LOCK TABLES `ac_insurances` WRITE;
/*!40000 ALTER TABLE `ac_insurances` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_insurances` VALUES
(1,1,'crop',3000000.00,75000.00,'XAF','active','2026-01-07','2027-01-07','Assurance récolte maïs et manioc – couverture sécheresse, inondation, ravageurs.','2026-01-21 06:22:08','2026-03-07 06:22:08'),
(2,3,'crop',5000000.00,125000.00,'XAF','active','2026-02-07','2027-02-07','Assurance cultures maraîchères et céréales – zone Extrême-Nord.','2025-12-19 06:22:08','2026-03-07 06:22:08'),
(3,6,'equipment',2500000.00,60000.00,'XAF','active','2025-12-07','2026-12-07','Assurance matériel agricole : tracteur John Deere 3042D.','2025-12-21 06:22:08','2026-03-07 06:22:08'),
(4,7,'crop',4000000.00,100000.00,'XAF','claimed','2025-07-07','2026-07-07','Sinistre déclaré : attaque de mouche des fruits sur plantation de cacao – en cours de traitement.','2026-02-02 06:22:08','2026-03-07 06:22:08');
/*!40000 ALTER TABLE `ac_insurances` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_likes`
--

DROP TABLE IF EXISTS `ac_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_likes_post_id_user_id_unique` (`post_id`,`user_id`),
  KEY `ac_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ac_community_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_likes`
--

LOCK TABLES `ac_likes` WRITE;
/*!40000 ALTER TABLE `ac_likes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_likes` VALUES
(1,1,3,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(2,1,4,'2026-03-02 06:22:08','2026-03-07 06:22:08'),
(3,1,5,'2026-03-04 06:22:08','2026-03-07 06:22:08'),
(4,1,6,'2026-03-02 06:22:08','2026-03-07 06:22:08'),
(5,1,7,'2026-03-02 06:22:08','2026-03-07 06:22:08'),
(6,1,8,'2026-03-03 06:22:08','2026-03-07 06:22:08'),
(8,2,4,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(9,2,6,'2026-03-03 06:22:08','2026-03-07 06:22:08'),
(10,2,8,'2026-02-26 06:22:08','2026-03-07 06:22:08'),
(12,3,5,'2026-03-01 06:22:08','2026-03-07 06:22:08'),
(13,3,7,'2026-02-27 06:22:08','2026-03-07 06:22:08'),
(14,3,8,'2026-03-01 06:22:08','2026-03-07 06:22:08'),
(15,4,1,'2026-02-25 06:22:08','2026-03-07 06:22:08'),
(16,4,3,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(17,4,4,'2026-02-26 06:22:08','2026-03-07 06:22:08'),
(18,4,6,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(20,5,3,'2026-03-01 06:22:08','2026-03-07 06:22:08'),
(21,5,7,'2026-02-28 06:22:08','2026-03-07 06:22:08'),
(22,5,8,'2026-02-26 06:22:08','2026-03-07 06:22:08'),
(23,7,1,'2026-02-28 06:22:08','2026-03-07 06:22:08'),
(24,7,3,'2026-02-26 06:22:08','2026-03-07 06:22:08'),
(25,7,4,'2026-02-27 06:22:08','2026-03-07 06:22:08'),
(26,7,5,'2026-03-04 06:22:08','2026-03-07 06:22:08'),
(29,8,1,'2026-03-07 14:31:58','2026-03-07 14:31:58'),
(31,1,1,'2026-03-07 16:04:29','2026-03-07 16:04:29');
/*!40000 ALTER TABLE `ac_likes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_loan_requests`
--

DROP TABLE IF EXISTS `ac_loan_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_loan_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `purpose` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_months` int(11) NOT NULL DEFAULT 12,
  `status` enum('pending','approved','rejected','disbursed','repaid') NOT NULL DEFAULT 'pending',
  `rejection_reason` text DEFAULT NULL,
  `credit_score_at_request` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_loan_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `ac_loan_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_loan_requests`
--

LOCK TABLES `ac_loan_requests` WRITE;
/*!40000 ALTER TABLE `ac_loan_requests` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_loan_requests` VALUES
(1,8,1500000.00,'XAF','Achat motoculteur','Je souhaite acquérir un motoculteur Honda FJ500 pour mécaniser mon exploitation de 18 ha dans l\'Adamaoua. Cela me permettra de doubler ma superficie cultivée et de réduire les coûts de main-d\'œuvre.',24,'disbursed',NULL,62,'2026-02-05 06:22:08','2026-03-07 06:22:08'),
(2,1,800000.00,'XAF','Système d\'irrigation goutte-à-goutte','Installation d\'un système d\'irrigation pour mes 5,5 ha de maïs et manioc. Le projet permettra de cultiver en saison sèche et d\'augmenter la production annuelle de 60%.',18,'approved',NULL,71,'2026-02-28 06:22:08','2026-03-07 06:22:08'),
(3,3,2000000.00,'XAF','Agrandissement entrepôt de stockage','Construction d\'un magasin de stockage de 200 m² pour stocker mes oignons et céréales en attendant les meilleures conditions de marché.',36,'repaid',NULL,78,'2025-01-07 06:22:08','2026-03-07 06:22:08'),
(4,5,600000.00,'XAF','Extension serre maraîchère','Ajout d\'une troisième serre de 500 m² pour tripler la production de tomates. Plan de remboursement sur 12 mois.',12,'pending',NULL,55,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(5,1,35000.00,'XAF','Tru',NULL,12,'pending',NULL,36,'2026-03-07 11:54:52','2026-03-07 11:54:52');
/*!40000 ALTER TABLE `ac_loan_requests` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_market_prices`
--

DROP TABLE IF EXISTS `ac_market_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_market_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `crop_id` bigint(20) unsigned NOT NULL,
  `region` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `market_name` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `unit` varchar(255) NOT NULL DEFAULT 'kg',
  `recorded_at` date NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_market_prices_crop_id_region_recorded_at_index` (`crop_id`,`region`,`recorded_at`),
  CONSTRAINT `ac_market_prices_crop_id_foreign` FOREIGN KEY (`crop_id`) REFERENCES `ac_crops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1797 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_market_prices`
--

LOCK TABLES `ac_market_prices` WRITE;
/*!40000 ALTER TABLE `ac_market_prices` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_market_prices` VALUES
(1,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',176.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(2,1,'Littoral','Cameroun','Marché Sandaga Douala',187.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(3,1,'Ouest','Cameroun','Marché Central Bafoussam',198.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(4,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',355.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(5,2,'Littoral','Cameroun','Marché Sandaga Douala',390.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(6,2,'Ouest','Cameroun','Marché Central Bafoussam',335.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(7,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',151.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(8,3,'Littoral','Cameroun','Marché Sandaga Douala',142.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(9,3,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(10,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',105.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(11,4,'Littoral','Cameroun','Marché Sandaga Douala',129.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(12,4,'Ouest','Cameroun','Marché Central Bafoussam',106.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(13,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(14,5,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(15,5,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(16,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',459.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(17,8,'Littoral','Cameroun','Marché Sandaga Douala',604.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(18,8,'Ouest','Cameroun','Marché Central Bafoussam',521.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(19,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',328.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(20,9,'Littoral','Cameroun','Marché Sandaga Douala',422.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(21,9,'Ouest','Cameroun','Marché Central Bafoussam',430.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(22,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',883.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(23,10,'Littoral','Cameroun','Marché Sandaga Douala',804.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(24,10,'Ouest','Cameroun','Marché Central Bafoussam',690.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(25,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',178.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(26,12,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(27,12,'Ouest','Cameroun','Marché Central Bafoussam',167.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(28,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',541.00,'XAF','litre','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(29,16,'Littoral','Cameroun','Marché Sandaga Douala',674.00,'XAF','litre','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(30,16,'Ouest','Cameroun','Marché Central Bafoussam',531.00,'XAF','litre','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(31,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',809.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(32,17,'Littoral','Cameroun','Marché Sandaga Douala',743.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(33,17,'Ouest','Cameroun','Marché Central Bafoussam',708.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(34,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1123.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(35,19,'Littoral','Cameroun','Marché Sandaga Douala',1318.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(36,19,'Ouest','Cameroun','Marché Central Bafoussam',1238.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(37,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3687.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(38,20,'Littoral','Cameroun','Marché Sandaga Douala',3633.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(39,20,'Ouest','Cameroun','Marché Central Bafoussam',3501.00,'XAF','kg','2026-01-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(40,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',216.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(41,1,'Littoral','Cameroun','Marché Sandaga Douala',195.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(42,1,'Ouest','Cameroun','Marché Central Bafoussam',224.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(43,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',364.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(44,2,'Littoral','Cameroun','Marché Sandaga Douala',387.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(45,2,'Ouest','Cameroun','Marché Central Bafoussam',334.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(46,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',129.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(47,3,'Littoral','Cameroun','Marché Sandaga Douala',114.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(48,3,'Ouest','Cameroun','Marché Central Bafoussam',113.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(49,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',137.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(50,4,'Littoral','Cameroun','Marché Sandaga Douala',140.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(51,4,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(52,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',140.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(53,5,'Littoral','Cameroun','Marché Sandaga Douala',134.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(54,5,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(55,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',625.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(56,8,'Littoral','Cameroun','Marché Sandaga Douala',489.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(57,8,'Ouest','Cameroun','Marché Central Bafoussam',592.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(58,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',337.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(59,9,'Littoral','Cameroun','Marché Sandaga Douala',434.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(60,9,'Ouest','Cameroun','Marché Central Bafoussam',411.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(61,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',699.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(62,10,'Littoral','Cameroun','Marché Sandaga Douala',708.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(63,10,'Ouest','Cameroun','Marché Central Bafoussam',813.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(64,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',177.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(65,12,'Littoral','Cameroun','Marché Sandaga Douala',184.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(66,12,'Ouest','Cameroun','Marché Central Bafoussam',182.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(67,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',559.00,'XAF','litre','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(68,16,'Littoral','Cameroun','Marché Sandaga Douala',688.00,'XAF','litre','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(69,16,'Ouest','Cameroun','Marché Central Bafoussam',660.00,'XAF','litre','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(70,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',642.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(71,17,'Littoral','Cameroun','Marché Sandaga Douala',781.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(72,17,'Ouest','Cameroun','Marché Central Bafoussam',808.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(73,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1368.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(74,19,'Littoral','Cameroun','Marché Sandaga Douala',1294.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(75,19,'Ouest','Cameroun','Marché Central Bafoussam',1298.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(76,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3415.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(77,20,'Littoral','Cameroun','Marché Sandaga Douala',3189.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(78,20,'Ouest','Cameroun','Marché Central Bafoussam',3283.00,'XAF','kg','2026-01-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(79,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',192.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(80,1,'Littoral','Cameroun','Marché Sandaga Douala',169.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(81,1,'Ouest','Cameroun','Marché Central Bafoussam',222.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(82,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',411.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(83,2,'Littoral','Cameroun','Marché Sandaga Douala',361.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(84,2,'Ouest','Cameroun','Marché Central Bafoussam',306.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(85,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',126.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(86,3,'Littoral','Cameroun','Marché Sandaga Douala',141.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(87,3,'Ouest','Cameroun','Marché Central Bafoussam',147.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(88,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',137.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(89,4,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(90,4,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(91,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',117.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(92,5,'Littoral','Cameroun','Marché Sandaga Douala',104.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(93,5,'Ouest','Cameroun','Marché Central Bafoussam',105.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(94,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',474.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(95,8,'Littoral','Cameroun','Marché Sandaga Douala',486.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(96,8,'Ouest','Cameroun','Marché Central Bafoussam',527.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(97,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',421.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(98,9,'Littoral','Cameroun','Marché Sandaga Douala',357.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(99,9,'Ouest','Cameroun','Marché Central Bafoussam',322.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(100,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',977.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(101,10,'Littoral','Cameroun','Marché Sandaga Douala',989.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(102,10,'Ouest','Cameroun','Marché Central Bafoussam',951.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(103,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',179.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(104,12,'Littoral','Cameroun','Marché Sandaga Douala',174.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(105,12,'Ouest','Cameroun','Marché Central Bafoussam',160.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(106,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',593.00,'XAF','litre','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(107,16,'Littoral','Cameroun','Marché Sandaga Douala',603.00,'XAF','litre','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(108,16,'Ouest','Cameroun','Marché Central Bafoussam',729.00,'XAF','litre','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(109,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',822.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(110,17,'Littoral','Cameroun','Marché Sandaga Douala',789.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(111,17,'Ouest','Cameroun','Marché Central Bafoussam',735.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(112,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1409.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(113,19,'Littoral','Cameroun','Marché Sandaga Douala',1409.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(114,19,'Ouest','Cameroun','Marché Central Bafoussam',1156.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(115,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',4010.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(116,20,'Littoral','Cameroun','Marché Sandaga Douala',3822.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(117,20,'Ouest','Cameroun','Marché Central Bafoussam',3600.00,'XAF','kg','2026-01-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(118,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',207.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(119,1,'Littoral','Cameroun','Marché Sandaga Douala',178.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(120,1,'Ouest','Cameroun','Marché Central Bafoussam',176.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(121,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',401.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(122,2,'Littoral','Cameroun','Marché Sandaga Douala',407.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(123,2,'Ouest','Cameroun','Marché Central Bafoussam',338.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(124,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',151.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(125,3,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(126,3,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(127,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',104.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(128,4,'Littoral','Cameroun','Marché Sandaga Douala',111.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(129,4,'Ouest','Cameroun','Marché Central Bafoussam',115.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(130,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(131,5,'Littoral','Cameroun','Marché Sandaga Douala',137.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(132,5,'Ouest','Cameroun','Marché Central Bafoussam',115.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(133,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',510.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(134,8,'Littoral','Cameroun','Marché Sandaga Douala',492.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(135,8,'Ouest','Cameroun','Marché Central Bafoussam',587.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(136,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',343.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(137,9,'Littoral','Cameroun','Marché Sandaga Douala',330.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(138,9,'Ouest','Cameroun','Marché Central Bafoussam',420.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(139,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',913.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(140,10,'Littoral','Cameroun','Marché Sandaga Douala',858.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(141,10,'Ouest','Cameroun','Marché Central Bafoussam',700.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(142,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',171.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(143,12,'Littoral','Cameroun','Marché Sandaga Douala',129.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(144,12,'Ouest','Cameroun','Marché Central Bafoussam',125.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(145,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',529.00,'XAF','litre','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(146,16,'Littoral','Cameroun','Marché Sandaga Douala',674.00,'XAF','litre','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(147,16,'Ouest','Cameroun','Marché Central Bafoussam',543.00,'XAF','litre','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(148,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',757.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(149,17,'Littoral','Cameroun','Marché Sandaga Douala',619.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(150,17,'Ouest','Cameroun','Marché Central Bafoussam',626.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(151,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1295.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(152,19,'Littoral','Cameroun','Marché Sandaga Douala',1249.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(153,19,'Ouest','Cameroun','Marché Central Bafoussam',1231.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(154,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3215.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(155,20,'Littoral','Cameroun','Marché Sandaga Douala',3489.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(156,20,'Ouest','Cameroun','Marché Central Bafoussam',3791.00,'XAF','kg','2026-01-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(157,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',197.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(158,1,'Littoral','Cameroun','Marché Sandaga Douala',182.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(159,1,'Ouest','Cameroun','Marché Central Bafoussam',167.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(160,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',372.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(161,2,'Littoral','Cameroun','Marché Sandaga Douala',324.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(162,2,'Ouest','Cameroun','Marché Central Bafoussam',366.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(163,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',128.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(164,3,'Littoral','Cameroun','Marché Sandaga Douala',146.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(165,3,'Ouest','Cameroun','Marché Central Bafoussam',143.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(166,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',129.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(167,4,'Littoral','Cameroun','Marché Sandaga Douala',108.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(168,4,'Ouest','Cameroun','Marché Central Bafoussam',145.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(169,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',125.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(170,5,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(171,5,'Ouest','Cameroun','Marché Central Bafoussam',114.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(172,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',552.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(173,8,'Littoral','Cameroun','Marché Sandaga Douala',498.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(174,8,'Ouest','Cameroun','Marché Central Bafoussam',439.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(175,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',305.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(176,9,'Littoral','Cameroun','Marché Sandaga Douala',386.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(177,9,'Ouest','Cameroun','Marché Central Bafoussam',446.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(178,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',927.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(179,10,'Littoral','Cameroun','Marché Sandaga Douala',882.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(180,10,'Ouest','Cameroun','Marché Central Bafoussam',719.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(181,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',168.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(182,12,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(183,12,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(184,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',530.00,'XAF','litre','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(185,16,'Littoral','Cameroun','Marché Sandaga Douala',709.00,'XAF','litre','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(186,16,'Ouest','Cameroun','Marché Central Bafoussam',717.00,'XAF','litre','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(187,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',739.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(188,17,'Littoral','Cameroun','Marché Sandaga Douala',653.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(189,17,'Ouest','Cameroun','Marché Central Bafoussam',629.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(190,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1307.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(191,19,'Littoral','Cameroun','Marché Sandaga Douala',1329.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(192,19,'Ouest','Cameroun','Marché Central Bafoussam',1220.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(193,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3922.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(194,20,'Littoral','Cameroun','Marché Sandaga Douala',3177.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(195,20,'Ouest','Cameroun','Marché Central Bafoussam',3840.00,'XAF','kg','2026-01-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(196,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',166.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(197,1,'Littoral','Cameroun','Marché Sandaga Douala',244.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(198,1,'Ouest','Cameroun','Marché Central Bafoussam',212.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(199,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',420.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(200,2,'Littoral','Cameroun','Marché Sandaga Douala',347.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(201,2,'Ouest','Cameroun','Marché Central Bafoussam',409.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(202,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(203,3,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(204,3,'Ouest','Cameroun','Marché Central Bafoussam',157.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(205,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',115.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(206,4,'Littoral','Cameroun','Marché Sandaga Douala',114.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(207,4,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(208,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',104.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(209,5,'Littoral','Cameroun','Marché Sandaga Douala',112.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(210,5,'Ouest','Cameroun','Marché Central Bafoussam',116.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(211,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',591.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(212,8,'Littoral','Cameroun','Marché Sandaga Douala',416.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(213,8,'Ouest','Cameroun','Marché Central Bafoussam',549.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(214,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',358.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(215,9,'Littoral','Cameroun','Marché Sandaga Douala',318.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(216,9,'Ouest','Cameroun','Marché Central Bafoussam',384.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(217,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',766.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(218,10,'Littoral','Cameroun','Marché Sandaga Douala',907.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(219,10,'Ouest','Cameroun','Marché Central Bafoussam',737.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(220,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',164.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(221,12,'Littoral','Cameroun','Marché Sandaga Douala',142.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(222,12,'Ouest','Cameroun','Marché Central Bafoussam',128.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(223,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',694.00,'XAF','litre','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(224,16,'Littoral','Cameroun','Marché Sandaga Douala',678.00,'XAF','litre','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(225,16,'Ouest','Cameroun','Marché Central Bafoussam',682.00,'XAF','litre','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(226,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',841.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(227,17,'Littoral','Cameroun','Marché Sandaga Douala',643.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(228,17,'Ouest','Cameroun','Marché Central Bafoussam',787.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(229,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1202.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(230,19,'Littoral','Cameroun','Marché Sandaga Douala',1190.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(231,19,'Ouest','Cameroun','Marché Central Bafoussam',1275.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(232,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',4019.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(233,20,'Littoral','Cameroun','Marché Sandaga Douala',3291.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(234,20,'Ouest','Cameroun','Marché Central Bafoussam',3315.00,'XAF','kg','2026-01-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(235,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',247.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(236,1,'Littoral','Cameroun','Marché Sandaga Douala',171.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(237,1,'Ouest','Cameroun','Marché Central Bafoussam',168.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(238,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',360.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(239,2,'Littoral','Cameroun','Marché Sandaga Douala',309.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(240,2,'Ouest','Cameroun','Marché Central Bafoussam',402.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(241,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',132.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(242,3,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(243,3,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(244,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',113.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(245,4,'Littoral','Cameroun','Marché Sandaga Douala',138.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(246,4,'Ouest','Cameroun','Marché Central Bafoussam',112.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(247,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',141.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(248,5,'Littoral','Cameroun','Marché Sandaga Douala',141.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(249,5,'Ouest','Cameroun','Marché Central Bafoussam',103.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(250,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',575.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(251,8,'Littoral','Cameroun','Marché Sandaga Douala',598.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(252,8,'Ouest','Cameroun','Marché Central Bafoussam',587.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(253,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',413.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(254,9,'Littoral','Cameroun','Marché Sandaga Douala',283.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(255,9,'Ouest','Cameroun','Marché Central Bafoussam',362.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(256,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',682.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(257,10,'Littoral','Cameroun','Marché Sandaga Douala',797.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(258,10,'Ouest','Cameroun','Marché Central Bafoussam',893.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(259,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',128.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(260,12,'Littoral','Cameroun','Marché Sandaga Douala',165.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(261,12,'Ouest','Cameroun','Marché Central Bafoussam',135.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(262,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',522.00,'XAF','litre','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(263,16,'Littoral','Cameroun','Marché Sandaga Douala',655.00,'XAF','litre','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(264,16,'Ouest','Cameroun','Marché Central Bafoussam',549.00,'XAF','litre','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(265,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',784.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(266,17,'Littoral','Cameroun','Marché Sandaga Douala',788.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(267,17,'Ouest','Cameroun','Marché Central Bafoussam',625.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(268,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1408.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(269,19,'Littoral','Cameroun','Marché Sandaga Douala',1104.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(270,19,'Ouest','Cameroun','Marché Central Bafoussam',1065.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(271,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3206.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(272,20,'Littoral','Cameroun','Marché Sandaga Douala',3970.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(273,20,'Ouest','Cameroun','Marché Central Bafoussam',3666.00,'XAF','kg','2026-01-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(274,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',194.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(275,1,'Littoral','Cameroun','Marché Sandaga Douala',171.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(276,1,'Ouest','Cameroun','Marché Central Bafoussam',186.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(277,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',392.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(278,2,'Littoral','Cameroun','Marché Sandaga Douala',333.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(279,2,'Ouest','Cameroun','Marché Central Bafoussam',368.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(280,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',152.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(281,3,'Littoral','Cameroun','Marché Sandaga Douala',125.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(282,3,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(283,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',143.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(284,4,'Littoral','Cameroun','Marché Sandaga Douala',124.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(285,4,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(286,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',123.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(287,5,'Littoral','Cameroun','Marché Sandaga Douala',104.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(288,5,'Ouest','Cameroun','Marché Central Bafoussam',128.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(289,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',544.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(290,8,'Littoral','Cameroun','Marché Sandaga Douala',433.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(291,8,'Ouest','Cameroun','Marché Central Bafoussam',494.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(292,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',392.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(293,9,'Littoral','Cameroun','Marché Sandaga Douala',429.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(294,9,'Ouest','Cameroun','Marché Central Bafoussam',380.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(295,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',742.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(296,10,'Littoral','Cameroun','Marché Sandaga Douala',810.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(297,10,'Ouest','Cameroun','Marché Central Bafoussam',680.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(298,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',173.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(299,12,'Littoral','Cameroun','Marché Sandaga Douala',183.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(300,12,'Ouest','Cameroun','Marché Central Bafoussam',150.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(301,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',520.00,'XAF','litre','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(302,16,'Littoral','Cameroun','Marché Sandaga Douala',617.00,'XAF','litre','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(303,16,'Ouest','Cameroun','Marché Central Bafoussam',581.00,'XAF','litre','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(304,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',625.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(305,17,'Littoral','Cameroun','Marché Sandaga Douala',821.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(306,17,'Ouest','Cameroun','Marché Central Bafoussam',667.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(307,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1330.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(308,19,'Littoral','Cameroun','Marché Sandaga Douala',1119.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(309,19,'Ouest','Cameroun','Marché Central Bafoussam',1037.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(310,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3745.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(311,20,'Littoral','Cameroun','Marché Sandaga Douala',4077.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(312,20,'Ouest','Cameroun','Marché Central Bafoussam',3368.00,'XAF','kg','2026-01-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(313,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',239.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(314,1,'Littoral','Cameroun','Marché Sandaga Douala',180.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(315,1,'Ouest','Cameroun','Marché Central Bafoussam',165.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(316,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',311.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(317,2,'Littoral','Cameroun','Marché Sandaga Douala',394.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(318,2,'Ouest','Cameroun','Marché Central Bafoussam',393.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(319,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',126.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(320,3,'Littoral','Cameroun','Marché Sandaga Douala',155.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(321,3,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(322,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',116.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(323,4,'Littoral','Cameroun','Marché Sandaga Douala',144.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(324,4,'Ouest','Cameroun','Marché Central Bafoussam',112.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(325,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(326,5,'Littoral','Cameroun','Marché Sandaga Douala',130.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(327,5,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(328,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',447.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(329,8,'Littoral','Cameroun','Marché Sandaga Douala',423.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(330,8,'Ouest','Cameroun','Marché Central Bafoussam',453.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(331,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',334.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(332,9,'Littoral','Cameroun','Marché Sandaga Douala',315.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(333,9,'Ouest','Cameroun','Marché Central Bafoussam',325.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(334,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',754.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(335,10,'Littoral','Cameroun','Marché Sandaga Douala',820.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(336,10,'Ouest','Cameroun','Marché Central Bafoussam',975.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(337,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',157.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(338,12,'Littoral','Cameroun','Marché Sandaga Douala',165.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(339,12,'Ouest','Cameroun','Marché Central Bafoussam',131.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(340,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',663.00,'XAF','litre','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(341,16,'Littoral','Cameroun','Marché Sandaga Douala',701.00,'XAF','litre','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(342,16,'Ouest','Cameroun','Marché Central Bafoussam',575.00,'XAF','litre','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(343,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',766.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(344,17,'Littoral','Cameroun','Marché Sandaga Douala',626.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(345,17,'Ouest','Cameroun','Marché Central Bafoussam',844.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(346,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1426.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(347,19,'Littoral','Cameroun','Marché Sandaga Douala',1250.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(348,19,'Ouest','Cameroun','Marché Central Bafoussam',1074.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(349,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',4027.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(350,20,'Littoral','Cameroun','Marché Sandaga Douala',3893.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(351,20,'Ouest','Cameroun','Marché Central Bafoussam',3387.00,'XAF','kg','2026-01-29','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(352,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',180.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(353,1,'Littoral','Cameroun','Marché Sandaga Douala',173.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(354,1,'Ouest','Cameroun','Marché Central Bafoussam',233.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(355,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',350.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(356,2,'Littoral','Cameroun','Marché Sandaga Douala',402.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(357,2,'Ouest','Cameroun','Marché Central Bafoussam',373.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(358,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',146.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(359,3,'Littoral','Cameroun','Marché Sandaga Douala',132.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(360,3,'Ouest','Cameroun','Marché Central Bafoussam',150.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(361,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',130.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(362,4,'Littoral','Cameroun','Marché Sandaga Douala',131.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(363,4,'Ouest','Cameroun','Marché Central Bafoussam',104.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(364,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',120.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(365,5,'Littoral','Cameroun','Marché Sandaga Douala',115.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(366,5,'Ouest','Cameroun','Marché Central Bafoussam',117.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(367,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',446.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(368,8,'Littoral','Cameroun','Marché Sandaga Douala',505.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(369,8,'Ouest','Cameroun','Marché Central Bafoussam',482.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(370,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',417.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(371,9,'Littoral','Cameroun','Marché Sandaga Douala',439.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(372,9,'Ouest','Cameroun','Marché Central Bafoussam',324.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(373,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',725.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(374,10,'Littoral','Cameroun','Marché Sandaga Douala',956.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(375,10,'Ouest','Cameroun','Marché Central Bafoussam',681.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(376,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',148.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(377,12,'Littoral','Cameroun','Marché Sandaga Douala',173.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(378,12,'Ouest','Cameroun','Marché Central Bafoussam',153.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(379,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',635.00,'XAF','litre','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(380,16,'Littoral','Cameroun','Marché Sandaga Douala',605.00,'XAF','litre','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(381,16,'Ouest','Cameroun','Marché Central Bafoussam',520.00,'XAF','litre','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(382,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',720.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(383,17,'Littoral','Cameroun','Marché Sandaga Douala',719.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(384,17,'Ouest','Cameroun','Marché Central Bafoussam',662.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(385,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1138.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(386,19,'Littoral','Cameroun','Marché Sandaga Douala',1080.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(387,19,'Ouest','Cameroun','Marché Central Bafoussam',1127.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(388,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3513.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(389,20,'Littoral','Cameroun','Marché Sandaga Douala',4049.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(390,20,'Ouest','Cameroun','Marché Central Bafoussam',3561.00,'XAF','kg','2026-01-30','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(391,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',226.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(392,1,'Littoral','Cameroun','Marché Sandaga Douala',214.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(393,1,'Ouest','Cameroun','Marché Central Bafoussam',198.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(394,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',341.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(395,2,'Littoral','Cameroun','Marché Sandaga Douala',315.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(396,2,'Ouest','Cameroun','Marché Central Bafoussam',348.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(397,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',140.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(398,3,'Littoral','Cameroun','Marché Sandaga Douala',135.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(399,3,'Ouest','Cameroun','Marché Central Bafoussam',113.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(400,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',110.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(401,4,'Littoral','Cameroun','Marché Sandaga Douala',122.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(402,4,'Ouest','Cameroun','Marché Central Bafoussam',112.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(403,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',110.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(404,5,'Littoral','Cameroun','Marché Sandaga Douala',130.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(405,5,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(406,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',433.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(407,8,'Littoral','Cameroun','Marché Sandaga Douala',441.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(408,8,'Ouest','Cameroun','Marché Central Bafoussam',505.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(409,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',339.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(410,9,'Littoral','Cameroun','Marché Sandaga Douala',438.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(411,9,'Ouest','Cameroun','Marché Central Bafoussam',325.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(412,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',682.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(413,10,'Littoral','Cameroun','Marché Sandaga Douala',880.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(414,10,'Ouest','Cameroun','Marché Central Bafoussam',784.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(415,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',175.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(416,12,'Littoral','Cameroun','Marché Sandaga Douala',167.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(417,12,'Ouest','Cameroun','Marché Central Bafoussam',159.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(418,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',707.00,'XAF','litre','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(419,16,'Littoral','Cameroun','Marché Sandaga Douala',709.00,'XAF','litre','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(420,16,'Ouest','Cameroun','Marché Central Bafoussam',524.00,'XAF','litre','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(421,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',776.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(422,17,'Littoral','Cameroun','Marché Sandaga Douala',822.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(423,17,'Ouest','Cameroun','Marché Central Bafoussam',595.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(424,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1221.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(425,19,'Littoral','Cameroun','Marché Sandaga Douala',1058.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(426,19,'Ouest','Cameroun','Marché Central Bafoussam',1328.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(427,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3096.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(428,20,'Littoral','Cameroun','Marché Sandaga Douala',3471.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(429,20,'Ouest','Cameroun','Marché Central Bafoussam',3205.00,'XAF','kg','2026-01-31','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(430,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',232.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(431,1,'Littoral','Cameroun','Marché Sandaga Douala',224.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(432,1,'Ouest','Cameroun','Marché Central Bafoussam',197.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(433,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',342.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(434,2,'Littoral','Cameroun','Marché Sandaga Douala',393.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(435,2,'Ouest','Cameroun','Marché Central Bafoussam',306.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(436,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(437,3,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(438,3,'Ouest','Cameroun','Marché Central Bafoussam',152.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(439,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',134.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(440,4,'Littoral','Cameroun','Marché Sandaga Douala',142.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(441,4,'Ouest','Cameroun','Marché Central Bafoussam',103.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(442,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',106.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(443,5,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(444,5,'Ouest','Cameroun','Marché Central Bafoussam',124.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(445,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',455.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(446,8,'Littoral','Cameroun','Marché Sandaga Douala',490.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(447,8,'Ouest','Cameroun','Marché Central Bafoussam',446.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(448,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',288.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(449,9,'Littoral','Cameroun','Marché Sandaga Douala',316.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(450,9,'Ouest','Cameroun','Marché Central Bafoussam',327.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(451,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',727.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(452,10,'Littoral','Cameroun','Marché Sandaga Douala',838.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(453,10,'Ouest','Cameroun','Marché Central Bafoussam',969.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(454,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',159.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(455,12,'Littoral','Cameroun','Marché Sandaga Douala',140.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(456,12,'Ouest','Cameroun','Marché Central Bafoussam',150.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(457,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',646.00,'XAF','litre','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(458,16,'Littoral','Cameroun','Marché Sandaga Douala',653.00,'XAF','litre','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(459,16,'Ouest','Cameroun','Marché Central Bafoussam',625.00,'XAF','litre','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(460,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',800.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(461,17,'Littoral','Cameroun','Marché Sandaga Douala',784.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(462,17,'Ouest','Cameroun','Marché Central Bafoussam',601.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(463,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1053.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(464,19,'Littoral','Cameroun','Marché Sandaga Douala',1135.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(465,19,'Ouest','Cameroun','Marché Central Bafoussam',1047.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(466,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3587.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(467,20,'Littoral','Cameroun','Marché Sandaga Douala',3552.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(468,20,'Ouest','Cameroun','Marché Central Bafoussam',3236.00,'XAF','kg','2026-02-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(469,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',229.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(470,1,'Littoral','Cameroun','Marché Sandaga Douala',220.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(471,1,'Ouest','Cameroun','Marché Central Bafoussam',221.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(472,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',377.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(473,2,'Littoral','Cameroun','Marché Sandaga Douala',387.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(474,2,'Ouest','Cameroun','Marché Central Bafoussam',331.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(475,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',126.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(476,3,'Littoral','Cameroun','Marché Sandaga Douala',127.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(477,3,'Ouest','Cameroun','Marché Central Bafoussam',117.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(478,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',128.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(479,4,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(480,4,'Ouest','Cameroun','Marché Central Bafoussam',140.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(481,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',125.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(482,5,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(483,5,'Ouest','Cameroun','Marché Central Bafoussam',132.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(484,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',585.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(485,8,'Littoral','Cameroun','Marché Sandaga Douala',587.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(486,8,'Ouest','Cameroun','Marché Central Bafoussam',443.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(487,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',358.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(488,9,'Littoral','Cameroun','Marché Sandaga Douala',310.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(489,9,'Ouest','Cameroun','Marché Central Bafoussam',376.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(490,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',772.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(491,10,'Littoral','Cameroun','Marché Sandaga Douala',825.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(492,10,'Ouest','Cameroun','Marché Central Bafoussam',961.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(493,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',164.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(494,12,'Littoral','Cameroun','Marché Sandaga Douala',159.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(495,12,'Ouest','Cameroun','Marché Central Bafoussam',160.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(496,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',514.00,'XAF','litre','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(497,16,'Littoral','Cameroun','Marché Sandaga Douala',706.00,'XAF','litre','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(498,16,'Ouest','Cameroun','Marché Central Bafoussam',532.00,'XAF','litre','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(499,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',632.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(500,17,'Littoral','Cameroun','Marché Sandaga Douala',779.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(501,17,'Ouest','Cameroun','Marché Central Bafoussam',793.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(502,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1293.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(503,19,'Littoral','Cameroun','Marché Sandaga Douala',1199.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(504,19,'Ouest','Cameroun','Marché Central Bafoussam',1079.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(505,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3345.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(506,20,'Littoral','Cameroun','Marché Sandaga Douala',3276.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(507,20,'Ouest','Cameroun','Marché Central Bafoussam',3672.00,'XAF','kg','2026-02-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(508,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',207.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(509,1,'Littoral','Cameroun','Marché Sandaga Douala',180.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(510,1,'Ouest','Cameroun','Marché Central Bafoussam',187.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(511,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',387.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(512,2,'Littoral','Cameroun','Marché Sandaga Douala',415.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(513,2,'Ouest','Cameroun','Marché Central Bafoussam',333.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(514,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',157.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(515,3,'Littoral','Cameroun','Marché Sandaga Douala',151.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(516,3,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(517,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',113.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(518,4,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(519,4,'Ouest','Cameroun','Marché Central Bafoussam',112.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(520,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',111.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(521,5,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(522,5,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(523,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',455.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(524,8,'Littoral','Cameroun','Marché Sandaga Douala',603.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(525,8,'Ouest','Cameroun','Marché Central Bafoussam',499.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(526,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',364.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(527,9,'Littoral','Cameroun','Marché Sandaga Douala',310.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(528,9,'Ouest','Cameroun','Marché Central Bafoussam',391.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(529,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',802.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(530,10,'Littoral','Cameroun','Marché Sandaga Douala',752.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(531,10,'Ouest','Cameroun','Marché Central Bafoussam',939.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(532,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',168.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(533,12,'Littoral','Cameroun','Marché Sandaga Douala',159.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(534,12,'Ouest','Cameroun','Marché Central Bafoussam',182.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(535,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',524.00,'XAF','litre','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(536,16,'Littoral','Cameroun','Marché Sandaga Douala',563.00,'XAF','litre','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(537,16,'Ouest','Cameroun','Marché Central Bafoussam',571.00,'XAF','litre','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(538,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',725.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(539,17,'Littoral','Cameroun','Marché Sandaga Douala',671.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(540,17,'Ouest','Cameroun','Marché Central Bafoussam',811.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(541,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1066.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(542,19,'Littoral','Cameroun','Marché Sandaga Douala',1066.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(543,19,'Ouest','Cameroun','Marché Central Bafoussam',1374.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(544,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3387.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(545,20,'Littoral','Cameroun','Marché Sandaga Douala',3154.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(546,20,'Ouest','Cameroun','Marché Central Bafoussam',3521.00,'XAF','kg','2026-02-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(547,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',227.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(548,1,'Littoral','Cameroun','Marché Sandaga Douala',182.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(549,1,'Ouest','Cameroun','Marché Central Bafoussam',211.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(550,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',371.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(551,2,'Littoral','Cameroun','Marché Sandaga Douala',297.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(552,2,'Ouest','Cameroun','Marché Central Bafoussam',324.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(553,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(554,3,'Littoral','Cameroun','Marché Sandaga Douala',147.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(555,3,'Ouest','Cameroun','Marché Central Bafoussam',152.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(556,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',129.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(557,4,'Littoral','Cameroun','Marché Sandaga Douala',129.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(558,4,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(559,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',127.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(560,5,'Littoral','Cameroun','Marché Sandaga Douala',117.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(561,5,'Ouest','Cameroun','Marché Central Bafoussam',143.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(562,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',531.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(563,8,'Littoral','Cameroun','Marché Sandaga Douala',494.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(564,8,'Ouest','Cameroun','Marché Central Bafoussam',583.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(565,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',291.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(566,9,'Littoral','Cameroun','Marché Sandaga Douala',428.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(567,9,'Ouest','Cameroun','Marché Central Bafoussam',323.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(568,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',823.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(569,10,'Littoral','Cameroun','Marché Sandaga Douala',826.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(570,10,'Ouest','Cameroun','Marché Central Bafoussam',758.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(571,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',134.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(572,12,'Littoral','Cameroun','Marché Sandaga Douala',150.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(573,12,'Ouest','Cameroun','Marché Central Bafoussam',171.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(574,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',533.00,'XAF','litre','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(575,16,'Littoral','Cameroun','Marché Sandaga Douala',658.00,'XAF','litre','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(576,16,'Ouest','Cameroun','Marché Central Bafoussam',688.00,'XAF','litre','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(577,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',824.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(578,17,'Littoral','Cameroun','Marché Sandaga Douala',670.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(579,17,'Ouest','Cameroun','Marché Central Bafoussam',750.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(580,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1140.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(581,19,'Littoral','Cameroun','Marché Sandaga Douala',1380.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(582,19,'Ouest','Cameroun','Marché Central Bafoussam',1221.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(583,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3850.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(584,20,'Littoral','Cameroun','Marché Sandaga Douala',3321.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(585,20,'Ouest','Cameroun','Marché Central Bafoussam',3210.00,'XAF','kg','2026-02-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(586,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',216.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(587,1,'Littoral','Cameroun','Marché Sandaga Douala',244.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(588,1,'Ouest','Cameroun','Marché Central Bafoussam',223.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(589,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',359.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(590,2,'Littoral','Cameroun','Marché Sandaga Douala',392.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(591,2,'Ouest','Cameroun','Marché Central Bafoussam',328.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(592,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',118.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(593,3,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(594,3,'Ouest','Cameroun','Marché Central Bafoussam',116.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(595,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',130.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(596,4,'Littoral','Cameroun','Marché Sandaga Douala',134.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(597,4,'Ouest','Cameroun','Marché Central Bafoussam',103.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(598,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',138.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(599,5,'Littoral','Cameroun','Marché Sandaga Douala',142.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(600,5,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(601,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',511.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(602,8,'Littoral','Cameroun','Marché Sandaga Douala',423.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(603,8,'Ouest','Cameroun','Marché Central Bafoussam',406.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(604,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',288.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(605,9,'Littoral','Cameroun','Marché Sandaga Douala',429.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(606,9,'Ouest','Cameroun','Marché Central Bafoussam',347.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(607,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',709.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(608,10,'Littoral','Cameroun','Marché Sandaga Douala',948.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(609,10,'Ouest','Cameroun','Marché Central Bafoussam',873.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(610,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',135.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(611,12,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(612,12,'Ouest','Cameroun','Marché Central Bafoussam',173.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(613,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',693.00,'XAF','litre','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(614,16,'Littoral','Cameroun','Marché Sandaga Douala',608.00,'XAF','litre','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(615,16,'Ouest','Cameroun','Marché Central Bafoussam',617.00,'XAF','litre','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(616,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',792.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(617,17,'Littoral','Cameroun','Marché Sandaga Douala',639.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(618,17,'Ouest','Cameroun','Marché Central Bafoussam',796.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(619,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1110.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(620,19,'Littoral','Cameroun','Marché Sandaga Douala',1367.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(621,19,'Ouest','Cameroun','Marché Central Bafoussam',1400.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(622,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3851.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(623,20,'Littoral','Cameroun','Marché Sandaga Douala',3601.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(624,20,'Ouest','Cameroun','Marché Central Bafoussam',3616.00,'XAF','kg','2026-02-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(625,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',229.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(626,1,'Littoral','Cameroun','Marché Sandaga Douala',202.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(627,1,'Ouest','Cameroun','Marché Central Bafoussam',229.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(628,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',404.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(629,2,'Littoral','Cameroun','Marché Sandaga Douala',298.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(630,2,'Ouest','Cameroun','Marché Central Bafoussam',386.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(631,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',145.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(632,3,'Littoral','Cameroun','Marché Sandaga Douala',124.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(633,3,'Ouest','Cameroun','Marché Central Bafoussam',151.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(634,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',112.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(635,4,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(636,4,'Ouest','Cameroun','Marché Central Bafoussam',136.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(637,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',104.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(638,5,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(639,5,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(640,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',559.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(641,8,'Littoral','Cameroun','Marché Sandaga Douala',439.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(642,8,'Ouest','Cameroun','Marché Central Bafoussam',497.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(643,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',316.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(644,9,'Littoral','Cameroun','Marché Sandaga Douala',351.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(645,9,'Ouest','Cameroun','Marché Central Bafoussam',316.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(646,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',954.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(647,10,'Littoral','Cameroun','Marché Sandaga Douala',752.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(648,10,'Ouest','Cameroun','Marché Central Bafoussam',931.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(649,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',182.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(650,12,'Littoral','Cameroun','Marché Sandaga Douala',159.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(651,12,'Ouest','Cameroun','Marché Central Bafoussam',152.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(652,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',512.00,'XAF','litre','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(653,16,'Littoral','Cameroun','Marché Sandaga Douala',560.00,'XAF','litre','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(654,16,'Ouest','Cameroun','Marché Central Bafoussam',551.00,'XAF','litre','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(655,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',635.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(656,17,'Littoral','Cameroun','Marché Sandaga Douala',589.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(657,17,'Ouest','Cameroun','Marché Central Bafoussam',653.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(658,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1311.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(659,19,'Littoral','Cameroun','Marché Sandaga Douala',1153.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(660,19,'Ouest','Cameroun','Marché Central Bafoussam',1092.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(661,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3918.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(662,20,'Littoral','Cameroun','Marché Sandaga Douala',3284.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(663,20,'Ouest','Cameroun','Marché Central Bafoussam',3439.00,'XAF','kg','2026-02-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(664,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',170.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(665,1,'Littoral','Cameroun','Marché Sandaga Douala',185.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(666,1,'Ouest','Cameroun','Marché Central Bafoussam',204.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(667,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',413.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(668,2,'Littoral','Cameroun','Marché Sandaga Douala',362.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(669,2,'Ouest','Cameroun','Marché Central Bafoussam',348.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(670,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',157.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(671,3,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(672,3,'Ouest','Cameroun','Marché Central Bafoussam',119.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(673,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',119.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(674,4,'Littoral','Cameroun','Marché Sandaga Douala',101.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(675,4,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(676,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',119.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(677,5,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(678,5,'Ouest','Cameroun','Marché Central Bafoussam',132.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(679,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',429.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(680,8,'Littoral','Cameroun','Marché Sandaga Douala',590.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(681,8,'Ouest','Cameroun','Marché Central Bafoussam',517.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(682,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',297.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(683,9,'Littoral','Cameroun','Marché Sandaga Douala',277.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(684,9,'Ouest','Cameroun','Marché Central Bafoussam',312.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(685,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',685.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(686,10,'Littoral','Cameroun','Marché Sandaga Douala',696.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(687,10,'Ouest','Cameroun','Marché Central Bafoussam',672.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(688,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',145.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(689,12,'Littoral','Cameroun','Marché Sandaga Douala',165.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(690,12,'Ouest','Cameroun','Marché Central Bafoussam',170.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(691,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',640.00,'XAF','litre','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(692,16,'Littoral','Cameroun','Marché Sandaga Douala',533.00,'XAF','litre','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(693,16,'Ouest','Cameroun','Marché Central Bafoussam',556.00,'XAF','litre','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(694,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',725.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(695,17,'Littoral','Cameroun','Marché Sandaga Douala',629.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(696,17,'Ouest','Cameroun','Marché Central Bafoussam',672.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(697,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1298.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(698,19,'Littoral','Cameroun','Marché Sandaga Douala',1262.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(699,19,'Ouest','Cameroun','Marché Central Bafoussam',1327.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(700,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3765.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(701,20,'Littoral','Cameroun','Marché Sandaga Douala',3330.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(702,20,'Ouest','Cameroun','Marché Central Bafoussam',3694.00,'XAF','kg','2026-02-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(703,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',228.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(704,1,'Littoral','Cameroun','Marché Sandaga Douala',191.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(705,1,'Ouest','Cameroun','Marché Central Bafoussam',235.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(706,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',398.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(707,2,'Littoral','Cameroun','Marché Sandaga Douala',343.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(708,2,'Ouest','Cameroun','Marché Central Bafoussam',363.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(709,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(710,3,'Littoral','Cameroun','Marché Sandaga Douala',150.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(711,3,'Ouest','Cameroun','Marché Central Bafoussam',120.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(712,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',118.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(713,4,'Littoral','Cameroun','Marché Sandaga Douala',102.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(714,4,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(715,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',140.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(716,5,'Littoral','Cameroun','Marché Sandaga Douala',130.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(717,5,'Ouest','Cameroun','Marché Central Bafoussam',131.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(718,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',508.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(719,8,'Littoral','Cameroun','Marché Sandaga Douala',493.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(720,8,'Ouest','Cameroun','Marché Central Bafoussam',424.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(721,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',354.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(722,9,'Littoral','Cameroun','Marché Sandaga Douala',308.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(723,9,'Ouest','Cameroun','Marché Central Bafoussam',372.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(724,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',826.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(725,10,'Littoral','Cameroun','Marché Sandaga Douala',802.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(726,10,'Ouest','Cameroun','Marché Central Bafoussam',877.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(727,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',171.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(728,12,'Littoral','Cameroun','Marché Sandaga Douala',164.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(729,12,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(730,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',641.00,'XAF','litre','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(731,16,'Littoral','Cameroun','Marché Sandaga Douala',613.00,'XAF','litre','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(732,16,'Ouest','Cameroun','Marché Central Bafoussam',659.00,'XAF','litre','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(733,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',806.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(734,17,'Littoral','Cameroun','Marché Sandaga Douala',616.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(735,17,'Ouest','Cameroun','Marché Central Bafoussam',711.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(736,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1158.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(737,19,'Littoral','Cameroun','Marché Sandaga Douala',1296.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(738,19,'Ouest','Cameroun','Marché Central Bafoussam',1127.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(739,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3632.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(740,20,'Littoral','Cameroun','Marché Sandaga Douala',3419.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(741,20,'Ouest','Cameroun','Marché Central Bafoussam',3841.00,'XAF','kg','2026-02-08','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(742,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',182.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(743,1,'Littoral','Cameroun','Marché Sandaga Douala',229.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(744,1,'Ouest','Cameroun','Marché Central Bafoussam',171.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(745,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',382.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(746,2,'Littoral','Cameroun','Marché Sandaga Douala',296.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(747,2,'Ouest','Cameroun','Marché Central Bafoussam',396.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(748,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',116.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(749,3,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(750,3,'Ouest','Cameroun','Marché Central Bafoussam',149.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(751,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',103.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(752,4,'Littoral','Cameroun','Marché Sandaga Douala',121.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(753,4,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(754,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',115.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(755,5,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(756,5,'Ouest','Cameroun','Marché Central Bafoussam',130.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(757,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',442.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(758,8,'Littoral','Cameroun','Marché Sandaga Douala',541.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(759,8,'Ouest','Cameroun','Marché Central Bafoussam',575.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(760,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',307.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(761,9,'Littoral','Cameroun','Marché Sandaga Douala',326.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(762,9,'Ouest','Cameroun','Marché Central Bafoussam',378.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(763,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',721.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(764,10,'Littoral','Cameroun','Marché Sandaga Douala',762.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(765,10,'Ouest','Cameroun','Marché Central Bafoussam',795.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(766,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',141.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(767,12,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(768,12,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(769,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',661.00,'XAF','litre','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(770,16,'Littoral','Cameroun','Marché Sandaga Douala',588.00,'XAF','litre','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(771,16,'Ouest','Cameroun','Marché Central Bafoussam',648.00,'XAF','litre','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(772,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',763.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(773,17,'Littoral','Cameroun','Marché Sandaga Douala',748.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(774,17,'Ouest','Cameroun','Marché Central Bafoussam',611.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(775,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1278.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(776,19,'Littoral','Cameroun','Marché Sandaga Douala',1282.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(777,19,'Ouest','Cameroun','Marché Central Bafoussam',1337.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(778,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3687.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(779,20,'Littoral','Cameroun','Marché Sandaga Douala',3661.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(780,20,'Ouest','Cameroun','Marché Central Bafoussam',3563.00,'XAF','kg','2026-02-09','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(781,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',211.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(782,1,'Littoral','Cameroun','Marché Sandaga Douala',172.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(783,1,'Ouest','Cameroun','Marché Central Bafoussam',168.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(784,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',353.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(785,2,'Littoral','Cameroun','Marché Sandaga Douala',292.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(786,2,'Ouest','Cameroun','Marché Central Bafoussam',360.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(787,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(788,3,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(789,3,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(790,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',101.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(791,4,'Littoral','Cameroun','Marché Sandaga Douala',125.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(792,4,'Ouest','Cameroun','Marché Central Bafoussam',137.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(793,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',101.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(794,5,'Littoral','Cameroun','Marché Sandaga Douala',137.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(795,5,'Ouest','Cameroun','Marché Central Bafoussam',110.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(796,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',582.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(797,8,'Littoral','Cameroun','Marché Sandaga Douala',537.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(798,8,'Ouest','Cameroun','Marché Central Bafoussam',494.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(799,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',418.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(800,9,'Littoral','Cameroun','Marché Sandaga Douala',277.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(801,9,'Ouest','Cameroun','Marché Central Bafoussam',276.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(802,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',741.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(803,10,'Littoral','Cameroun','Marché Sandaga Douala',845.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(804,10,'Ouest','Cameroun','Marché Central Bafoussam',936.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(805,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',179.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(806,12,'Littoral','Cameroun','Marché Sandaga Douala',136.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(807,12,'Ouest','Cameroun','Marché Central Bafoussam',127.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(808,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',578.00,'XAF','litre','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(809,16,'Littoral','Cameroun','Marché Sandaga Douala',626.00,'XAF','litre','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(810,16,'Ouest','Cameroun','Marché Central Bafoussam',686.00,'XAF','litre','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(811,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',722.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(812,17,'Littoral','Cameroun','Marché Sandaga Douala',692.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(813,17,'Ouest','Cameroun','Marché Central Bafoussam',741.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(814,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1179.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(815,19,'Littoral','Cameroun','Marché Sandaga Douala',1228.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(816,19,'Ouest','Cameroun','Marché Central Bafoussam',1340.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(817,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3599.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(818,20,'Littoral','Cameroun','Marché Sandaga Douala',3095.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(819,20,'Ouest','Cameroun','Marché Central Bafoussam',3942.00,'XAF','kg','2026-02-10','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(820,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',192.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(821,1,'Littoral','Cameroun','Marché Sandaga Douala',201.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(822,1,'Ouest','Cameroun','Marché Central Bafoussam',239.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(823,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',306.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(824,2,'Littoral','Cameroun','Marché Sandaga Douala',330.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(825,2,'Ouest','Cameroun','Marché Central Bafoussam',321.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(826,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',154.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(827,3,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(828,3,'Ouest','Cameroun','Marché Central Bafoussam',148.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(829,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(830,4,'Littoral','Cameroun','Marché Sandaga Douala',101.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(831,4,'Ouest','Cameroun','Marché Central Bafoussam',138.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(832,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',109.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(833,5,'Littoral','Cameroun','Marché Sandaga Douala',112.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(834,5,'Ouest','Cameroun','Marché Central Bafoussam',123.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(835,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',564.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(836,8,'Littoral','Cameroun','Marché Sandaga Douala',446.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(837,8,'Ouest','Cameroun','Marché Central Bafoussam',447.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(838,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',308.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(839,9,'Littoral','Cameroun','Marché Sandaga Douala',307.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(840,9,'Ouest','Cameroun','Marché Central Bafoussam',364.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(841,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',938.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(842,10,'Littoral','Cameroun','Marché Sandaga Douala',938.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(843,10,'Ouest','Cameroun','Marché Central Bafoussam',849.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(844,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',146.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(845,12,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(846,12,'Ouest','Cameroun','Marché Central Bafoussam',177.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(847,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',589.00,'XAF','litre','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(848,16,'Littoral','Cameroun','Marché Sandaga Douala',597.00,'XAF','litre','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(849,16,'Ouest','Cameroun','Marché Central Bafoussam',672.00,'XAF','litre','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(850,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',718.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(851,17,'Littoral','Cameroun','Marché Sandaga Douala',590.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(852,17,'Ouest','Cameroun','Marché Central Bafoussam',747.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(853,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1175.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(854,19,'Littoral','Cameroun','Marché Sandaga Douala',1210.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(855,19,'Ouest','Cameroun','Marché Central Bafoussam',1340.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(856,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3704.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(857,20,'Littoral','Cameroun','Marché Sandaga Douala',3385.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(858,20,'Ouest','Cameroun','Marché Central Bafoussam',3275.00,'XAF','kg','2026-02-11','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(859,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',215.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(860,1,'Littoral','Cameroun','Marché Sandaga Douala',198.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(861,1,'Ouest','Cameroun','Marché Central Bafoussam',170.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(862,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',327.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(863,2,'Littoral','Cameroun','Marché Sandaga Douala',386.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(864,2,'Ouest','Cameroun','Marché Central Bafoussam',336.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(865,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(866,3,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(867,3,'Ouest','Cameroun','Marché Central Bafoussam',121.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(868,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',100.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(869,4,'Littoral','Cameroun','Marché Sandaga Douala',106.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(870,4,'Ouest','Cameroun','Marché Central Bafoussam',128.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(871,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',118.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(872,5,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(873,5,'Ouest','Cameroun','Marché Central Bafoussam',104.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(874,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',429.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(875,8,'Littoral','Cameroun','Marché Sandaga Douala',537.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(876,8,'Ouest','Cameroun','Marché Central Bafoussam',402.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(877,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',327.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(878,9,'Littoral','Cameroun','Marché Sandaga Douala',403.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(879,9,'Ouest','Cameroun','Marché Central Bafoussam',273.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(880,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',667.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(881,10,'Littoral','Cameroun','Marché Sandaga Douala',695.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(882,10,'Ouest','Cameroun','Marché Central Bafoussam',761.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(883,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',169.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(884,12,'Littoral','Cameroun','Marché Sandaga Douala',164.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(885,12,'Ouest','Cameroun','Marché Central Bafoussam',134.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(886,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',666.00,'XAF','litre','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(887,16,'Littoral','Cameroun','Marché Sandaga Douala',552.00,'XAF','litre','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(888,16,'Ouest','Cameroun','Marché Central Bafoussam',597.00,'XAF','litre','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(889,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',647.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(890,17,'Littoral','Cameroun','Marché Sandaga Douala',597.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(891,17,'Ouest','Cameroun','Marché Central Bafoussam',739.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(892,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1116.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(893,19,'Littoral','Cameroun','Marché Sandaga Douala',1304.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(894,19,'Ouest','Cameroun','Marché Central Bafoussam',1302.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(895,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3180.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(896,20,'Littoral','Cameroun','Marché Sandaga Douala',3071.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(897,20,'Ouest','Cameroun','Marché Central Bafoussam',3477.00,'XAF','kg','2026-02-12','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(898,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',207.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(899,1,'Littoral','Cameroun','Marché Sandaga Douala',221.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(900,1,'Ouest','Cameroun','Marché Central Bafoussam',188.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(901,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',402.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(902,2,'Littoral','Cameroun','Marché Sandaga Douala',374.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(903,2,'Ouest','Cameroun','Marché Central Bafoussam',325.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(904,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',111.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(905,3,'Littoral','Cameroun','Marché Sandaga Douala',137.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(906,3,'Ouest','Cameroun','Marché Central Bafoussam',120.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(907,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(908,4,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(909,4,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(910,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',116.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(911,5,'Littoral','Cameroun','Marché Sandaga Douala',122.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(912,5,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(913,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',491.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(914,8,'Littoral','Cameroun','Marché Sandaga Douala',558.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(915,8,'Ouest','Cameroun','Marché Central Bafoussam',542.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(916,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',326.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(917,9,'Littoral','Cameroun','Marché Sandaga Douala',369.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(918,9,'Ouest','Cameroun','Marché Central Bafoussam',331.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(919,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',876.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(920,10,'Littoral','Cameroun','Marché Sandaga Douala',927.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(921,10,'Ouest','Cameroun','Marché Central Bafoussam',717.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(922,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',149.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(923,12,'Littoral','Cameroun','Marché Sandaga Douala',140.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(924,12,'Ouest','Cameroun','Marché Central Bafoussam',155.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(925,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',648.00,'XAF','litre','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(926,16,'Littoral','Cameroun','Marché Sandaga Douala',500.00,'XAF','litre','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(927,16,'Ouest','Cameroun','Marché Central Bafoussam',521.00,'XAF','litre','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(928,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',815.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(929,17,'Littoral','Cameroun','Marché Sandaga Douala',672.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(930,17,'Ouest','Cameroun','Marché Central Bafoussam',786.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(931,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1204.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(932,19,'Littoral','Cameroun','Marché Sandaga Douala',1306.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(933,19,'Ouest','Cameroun','Marché Central Bafoussam',1117.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(934,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3916.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(935,20,'Littoral','Cameroun','Marché Sandaga Douala',3032.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(936,20,'Ouest','Cameroun','Marché Central Bafoussam',3419.00,'XAF','kg','2026-02-13','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(937,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',215.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(938,1,'Littoral','Cameroun','Marché Sandaga Douala',198.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(939,1,'Ouest','Cameroun','Marché Central Bafoussam',238.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(940,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',337.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(941,2,'Littoral','Cameroun','Marché Sandaga Douala',312.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(942,2,'Ouest','Cameroun','Marché Central Bafoussam',379.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(943,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',106.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(944,3,'Littoral','Cameroun','Marché Sandaga Douala',125.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(945,3,'Ouest','Cameroun','Marché Central Bafoussam',151.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(946,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',138.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(947,4,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(948,4,'Ouest','Cameroun','Marché Central Bafoussam',110.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(949,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',131.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(950,5,'Littoral','Cameroun','Marché Sandaga Douala',108.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(951,5,'Ouest','Cameroun','Marché Central Bafoussam',114.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(952,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',493.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(953,8,'Littoral','Cameroun','Marché Sandaga Douala',528.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(954,8,'Ouest','Cameroun','Marché Central Bafoussam',452.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(955,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',331.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(956,9,'Littoral','Cameroun','Marché Sandaga Douala',269.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(957,9,'Ouest','Cameroun','Marché Central Bafoussam',275.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(958,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',705.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(959,10,'Littoral','Cameroun','Marché Sandaga Douala',726.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(960,10,'Ouest','Cameroun','Marché Central Bafoussam',811.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(961,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',164.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(962,12,'Littoral','Cameroun','Marché Sandaga Douala',163.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(963,12,'Ouest','Cameroun','Marché Central Bafoussam',177.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(964,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',544.00,'XAF','litre','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(965,16,'Littoral','Cameroun','Marché Sandaga Douala',597.00,'XAF','litre','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(966,16,'Ouest','Cameroun','Marché Central Bafoussam',689.00,'XAF','litre','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(967,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',705.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(968,17,'Littoral','Cameroun','Marché Sandaga Douala',813.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(969,17,'Ouest','Cameroun','Marché Central Bafoussam',641.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(970,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1202.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(971,19,'Littoral','Cameroun','Marché Sandaga Douala',1167.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(972,19,'Ouest','Cameroun','Marché Central Bafoussam',1106.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(973,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3174.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(974,20,'Littoral','Cameroun','Marché Sandaga Douala',3006.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(975,20,'Ouest','Cameroun','Marché Central Bafoussam',3369.00,'XAF','kg','2026-02-14','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(976,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',203.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(977,1,'Littoral','Cameroun','Marché Sandaga Douala',201.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(978,1,'Ouest','Cameroun','Marché Central Bafoussam',237.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(979,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',390.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(980,2,'Littoral','Cameroun','Marché Sandaga Douala',388.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(981,2,'Ouest','Cameroun','Marché Central Bafoussam',400.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(982,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',107.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(983,3,'Littoral','Cameroun','Marché Sandaga Douala',146.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(984,3,'Ouest','Cameroun','Marché Central Bafoussam',132.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(985,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',131.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(986,4,'Littoral','Cameroun','Marché Sandaga Douala',131.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(987,4,'Ouest','Cameroun','Marché Central Bafoussam',138.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(988,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',113.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(989,5,'Littoral','Cameroun','Marché Sandaga Douala',125.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(990,5,'Ouest','Cameroun','Marché Central Bafoussam',104.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(991,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',550.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(992,8,'Littoral','Cameroun','Marché Sandaga Douala',491.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(993,8,'Ouest','Cameroun','Marché Central Bafoussam',466.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(994,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',426.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(995,9,'Littoral','Cameroun','Marché Sandaga Douala',300.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(996,9,'Ouest','Cameroun','Marché Central Bafoussam',271.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(997,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',727.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(998,10,'Littoral','Cameroun','Marché Sandaga Douala',764.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(999,10,'Ouest','Cameroun','Marché Central Bafoussam',887.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1000,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',158.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1001,12,'Littoral','Cameroun','Marché Sandaga Douala',124.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1002,12,'Ouest','Cameroun','Marché Central Bafoussam',131.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1003,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',657.00,'XAF','litre','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1004,16,'Littoral','Cameroun','Marché Sandaga Douala',653.00,'XAF','litre','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1005,16,'Ouest','Cameroun','Marché Central Bafoussam',690.00,'XAF','litre','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1006,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',672.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1007,17,'Littoral','Cameroun','Marché Sandaga Douala',713.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1008,17,'Ouest','Cameroun','Marché Central Bafoussam',652.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1009,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1307.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1010,19,'Littoral','Cameroun','Marché Sandaga Douala',1351.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1011,19,'Ouest','Cameroun','Marché Central Bafoussam',1240.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1012,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3483.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1013,20,'Littoral','Cameroun','Marché Sandaga Douala',3444.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1014,20,'Ouest','Cameroun','Marché Central Bafoussam',3379.00,'XAF','kg','2026-02-15','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1015,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',234.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1016,1,'Littoral','Cameroun','Marché Sandaga Douala',214.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1017,1,'Ouest','Cameroun','Marché Central Bafoussam',181.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1018,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',369.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1019,2,'Littoral','Cameroun','Marché Sandaga Douala',396.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1020,2,'Ouest','Cameroun','Marché Central Bafoussam',375.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1021,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1022,3,'Littoral','Cameroun','Marché Sandaga Douala',153.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1023,3,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1024,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',132.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1025,4,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1026,4,'Ouest','Cameroun','Marché Central Bafoussam',99.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1027,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',109.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1028,5,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1029,5,'Ouest','Cameroun','Marché Central Bafoussam',99.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1030,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',545.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1031,8,'Littoral','Cameroun','Marché Sandaga Douala',411.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1032,8,'Ouest','Cameroun','Marché Central Bafoussam',485.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1033,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',351.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1034,9,'Littoral','Cameroun','Marché Sandaga Douala',318.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1035,9,'Ouest','Cameroun','Marché Central Bafoussam',331.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1036,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',888.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1037,10,'Littoral','Cameroun','Marché Sandaga Douala',931.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1038,10,'Ouest','Cameroun','Marché Central Bafoussam',720.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1039,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',143.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1040,12,'Littoral','Cameroun','Marché Sandaga Douala',176.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1041,12,'Ouest','Cameroun','Marché Central Bafoussam',144.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1042,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',638.00,'XAF','litre','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1043,16,'Littoral','Cameroun','Marché Sandaga Douala',580.00,'XAF','litre','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1044,16,'Ouest','Cameroun','Marché Central Bafoussam',641.00,'XAF','litre','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1045,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',761.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1046,17,'Littoral','Cameroun','Marché Sandaga Douala',666.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1047,17,'Ouest','Cameroun','Marché Central Bafoussam',783.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1048,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1177.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1049,19,'Littoral','Cameroun','Marché Sandaga Douala',1066.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1050,19,'Ouest','Cameroun','Marché Central Bafoussam',1212.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1051,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3285.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1052,20,'Littoral','Cameroun','Marché Sandaga Douala',3893.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1053,20,'Ouest','Cameroun','Marché Central Bafoussam',3709.00,'XAF','kg','2026-02-16','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1054,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',214.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1055,1,'Littoral','Cameroun','Marché Sandaga Douala',229.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1056,1,'Ouest','Cameroun','Marché Central Bafoussam',172.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1057,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',339.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1058,2,'Littoral','Cameroun','Marché Sandaga Douala',361.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1059,2,'Ouest','Cameroun','Marché Central Bafoussam',373.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1060,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',109.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1061,3,'Littoral','Cameroun','Marché Sandaga Douala',104.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1062,3,'Ouest','Cameroun','Marché Central Bafoussam',149.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1063,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',118.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1064,4,'Littoral','Cameroun','Marché Sandaga Douala',117.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1065,4,'Ouest','Cameroun','Marché Central Bafoussam',138.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1066,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',125.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1067,5,'Littoral','Cameroun','Marché Sandaga Douala',129.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1068,5,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1069,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',594.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1070,8,'Littoral','Cameroun','Marché Sandaga Douala',586.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1071,8,'Ouest','Cameroun','Marché Central Bafoussam',454.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1072,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',426.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1073,9,'Littoral','Cameroun','Marché Sandaga Douala',303.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1074,9,'Ouest','Cameroun','Marché Central Bafoussam',297.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1075,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',822.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1076,10,'Littoral','Cameroun','Marché Sandaga Douala',874.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1077,10,'Ouest','Cameroun','Marché Central Bafoussam',726.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1078,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',119.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1079,12,'Littoral','Cameroun','Marché Sandaga Douala',146.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1080,12,'Ouest','Cameroun','Marché Central Bafoussam',151.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1081,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',497.00,'XAF','litre','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1082,16,'Littoral','Cameroun','Marché Sandaga Douala',675.00,'XAF','litre','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1083,16,'Ouest','Cameroun','Marché Central Bafoussam',662.00,'XAF','litre','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1084,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',760.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1085,17,'Littoral','Cameroun','Marché Sandaga Douala',777.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1086,17,'Ouest','Cameroun','Marché Central Bafoussam',671.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1087,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1238.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1088,19,'Littoral','Cameroun','Marché Sandaga Douala',1137.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1089,19,'Ouest','Cameroun','Marché Central Bafoussam',1181.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1090,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3846.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1091,20,'Littoral','Cameroun','Marché Sandaga Douala',3417.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1092,20,'Ouest','Cameroun','Marché Central Bafoussam',3349.00,'XAF','kg','2026-02-17','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1093,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',162.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1094,1,'Littoral','Cameroun','Marché Sandaga Douala',237.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1095,1,'Ouest','Cameroun','Marché Central Bafoussam',171.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1096,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',366.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1097,2,'Littoral','Cameroun','Marché Sandaga Douala',374.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1098,2,'Ouest','Cameroun','Marché Central Bafoussam',325.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1099,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',136.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1100,3,'Littoral','Cameroun','Marché Sandaga Douala',121.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1101,3,'Ouest','Cameroun','Marché Central Bafoussam',128.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1102,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',100.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1103,4,'Littoral','Cameroun','Marché Sandaga Douala',121.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1104,4,'Ouest','Cameroun','Marché Central Bafoussam',99.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1105,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',139.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1106,5,'Littoral','Cameroun','Marché Sandaga Douala',100.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1107,5,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1108,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',568.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1109,8,'Littoral','Cameroun','Marché Sandaga Douala',496.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1110,8,'Ouest','Cameroun','Marché Central Bafoussam',423.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1111,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',390.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1112,9,'Littoral','Cameroun','Marché Sandaga Douala',400.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1113,9,'Ouest','Cameroun','Marché Central Bafoussam',272.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1114,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',776.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1115,10,'Littoral','Cameroun','Marché Sandaga Douala',834.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1116,10,'Ouest','Cameroun','Marché Central Bafoussam',882.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1117,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',164.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1118,12,'Littoral','Cameroun','Marché Sandaga Douala',155.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1119,12,'Ouest','Cameroun','Marché Central Bafoussam',134.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1120,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',626.00,'XAF','litre','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1121,16,'Littoral','Cameroun','Marché Sandaga Douala',641.00,'XAF','litre','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1122,16,'Ouest','Cameroun','Marché Central Bafoussam',608.00,'XAF','litre','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1123,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',746.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1124,17,'Littoral','Cameroun','Marché Sandaga Douala',793.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1125,17,'Ouest','Cameroun','Marché Central Bafoussam',739.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1126,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1207.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1127,19,'Littoral','Cameroun','Marché Sandaga Douala',997.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1128,19,'Ouest','Cameroun','Marché Central Bafoussam',1196.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1129,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3112.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1130,20,'Littoral','Cameroun','Marché Sandaga Douala',3783.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1131,20,'Ouest','Cameroun','Marché Central Bafoussam',3412.00,'XAF','kg','2026-02-18','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1132,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',206.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1133,1,'Littoral','Cameroun','Marché Sandaga Douala',210.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1134,1,'Ouest','Cameroun','Marché Central Bafoussam',167.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1135,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',301.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1136,2,'Littoral','Cameroun','Marché Sandaga Douala',342.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1137,2,'Ouest','Cameroun','Marché Central Bafoussam',351.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1138,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',134.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1139,3,'Littoral','Cameroun','Marché Sandaga Douala',139.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1140,3,'Ouest','Cameroun','Marché Central Bafoussam',124.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1141,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',132.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1142,4,'Littoral','Cameroun','Marché Sandaga Douala',111.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1143,4,'Ouest','Cameroun','Marché Central Bafoussam',109.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1144,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',102.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1145,5,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1146,5,'Ouest','Cameroun','Marché Central Bafoussam',121.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1147,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',491.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1148,8,'Littoral','Cameroun','Marché Sandaga Douala',541.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1149,8,'Ouest','Cameroun','Marché Central Bafoussam',535.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1150,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',371.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1151,9,'Littoral','Cameroun','Marché Sandaga Douala',381.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1152,9,'Ouest','Cameroun','Marché Central Bafoussam',402.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1153,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',903.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1154,10,'Littoral','Cameroun','Marché Sandaga Douala',907.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1155,10,'Ouest','Cameroun','Marché Central Bafoussam',668.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1156,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',138.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1157,12,'Littoral','Cameroun','Marché Sandaga Douala',153.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1158,12,'Ouest','Cameroun','Marché Central Bafoussam',134.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1159,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',651.00,'XAF','litre','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1160,16,'Littoral','Cameroun','Marché Sandaga Douala',657.00,'XAF','litre','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1161,16,'Ouest','Cameroun','Marché Central Bafoussam',681.00,'XAF','litre','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1162,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',647.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1163,17,'Littoral','Cameroun','Marché Sandaga Douala',809.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1164,17,'Ouest','Cameroun','Marché Central Bafoussam',796.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1165,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1293.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1166,19,'Littoral','Cameroun','Marché Sandaga Douala',1001.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1167,19,'Ouest','Cameroun','Marché Central Bafoussam',1031.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1168,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3572.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1169,20,'Littoral','Cameroun','Marché Sandaga Douala',3706.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1170,20,'Ouest','Cameroun','Marché Central Bafoussam',3354.00,'XAF','kg','2026-02-19','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1171,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',172.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1172,1,'Littoral','Cameroun','Marché Sandaga Douala',235.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1173,1,'Ouest','Cameroun','Marché Central Bafoussam',191.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1174,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',337.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1175,2,'Littoral','Cameroun','Marché Sandaga Douala',335.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1176,2,'Ouest','Cameroun','Marché Central Bafoussam',381.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1177,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1178,3,'Littoral','Cameroun','Marché Sandaga Douala',132.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1179,3,'Ouest','Cameroun','Marché Central Bafoussam',134.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1180,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1181,4,'Littoral','Cameroun','Marché Sandaga Douala',106.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1182,4,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1183,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',133.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1184,5,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1185,5,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1186,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',452.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1187,8,'Littoral','Cameroun','Marché Sandaga Douala',571.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1188,8,'Ouest','Cameroun','Marché Central Bafoussam',426.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1189,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',368.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1190,9,'Littoral','Cameroun','Marché Sandaga Douala',402.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1191,9,'Ouest','Cameroun','Marché Central Bafoussam',310.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1192,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',715.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1193,10,'Littoral','Cameroun','Marché Sandaga Douala',657.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1194,10,'Ouest','Cameroun','Marché Central Bafoussam',719.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1195,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',165.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1196,12,'Littoral','Cameroun','Marché Sandaga Douala',161.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1197,12,'Ouest','Cameroun','Marché Central Bafoussam',132.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1198,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',610.00,'XAF','litre','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1199,16,'Littoral','Cameroun','Marché Sandaga Douala',613.00,'XAF','litre','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1200,16,'Ouest','Cameroun','Marché Central Bafoussam',689.00,'XAF','litre','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1201,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',760.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1202,17,'Littoral','Cameroun','Marché Sandaga Douala',637.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1203,17,'Ouest','Cameroun','Marché Central Bafoussam',749.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1204,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1090.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1205,19,'Littoral','Cameroun','Marché Sandaga Douala',986.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1206,19,'Ouest','Cameroun','Marché Central Bafoussam',1319.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1207,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3477.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1208,20,'Littoral','Cameroun','Marché Sandaga Douala',3125.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1209,20,'Ouest','Cameroun','Marché Central Bafoussam',3238.00,'XAF','kg','2026-02-20','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1210,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',234.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1211,1,'Littoral','Cameroun','Marché Sandaga Douala',220.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1212,1,'Ouest','Cameroun','Marché Central Bafoussam',185.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1213,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',291.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1214,2,'Littoral','Cameroun','Marché Sandaga Douala',380.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1215,2,'Ouest','Cameroun','Marché Central Bafoussam',351.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1216,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',110.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1217,3,'Littoral','Cameroun','Marché Sandaga Douala',135.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1218,3,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1219,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',114.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1220,4,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1221,4,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1222,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',116.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1223,5,'Littoral','Cameroun','Marché Sandaga Douala',126.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1224,5,'Ouest','Cameroun','Marché Central Bafoussam',127.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1225,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',472.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1226,8,'Littoral','Cameroun','Marché Sandaga Douala',402.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1227,8,'Ouest','Cameroun','Marché Central Bafoussam',491.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1228,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',352.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1229,9,'Littoral','Cameroun','Marché Sandaga Douala',334.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1230,9,'Ouest','Cameroun','Marché Central Bafoussam',378.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1231,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',682.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1232,10,'Littoral','Cameroun','Marché Sandaga Douala',892.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1233,10,'Ouest','Cameroun','Marché Central Bafoussam',887.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1234,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',156.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1235,12,'Littoral','Cameroun','Marché Sandaga Douala',151.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1236,12,'Ouest','Cameroun','Marché Central Bafoussam',145.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1237,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',544.00,'XAF','litre','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1238,16,'Littoral','Cameroun','Marché Sandaga Douala',517.00,'XAF','litre','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1239,16,'Ouest','Cameroun','Marché Central Bafoussam',653.00,'XAF','litre','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1240,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',596.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1241,17,'Littoral','Cameroun','Marché Sandaga Douala',584.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1242,17,'Ouest','Cameroun','Marché Central Bafoussam',672.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1243,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1262.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1244,19,'Littoral','Cameroun','Marché Sandaga Douala',1069.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1245,19,'Ouest','Cameroun','Marché Central Bafoussam',1005.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1246,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3777.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1247,20,'Littoral','Cameroun','Marché Sandaga Douala',3737.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1248,20,'Ouest','Cameroun','Marché Central Bafoussam',2980.00,'XAF','kg','2026-02-21','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1249,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',230.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1250,1,'Littoral','Cameroun','Marché Sandaga Douala',175.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1251,1,'Ouest','Cameroun','Marché Central Bafoussam',217.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1252,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',400.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1253,2,'Littoral','Cameroun','Marché Sandaga Douala',403.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1254,2,'Ouest','Cameroun','Marché Central Bafoussam',310.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1255,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',144.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1256,3,'Littoral','Cameroun','Marché Sandaga Douala',126.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1257,3,'Ouest','Cameroun','Marché Central Bafoussam',150.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1258,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',111.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1259,4,'Littoral','Cameroun','Marché Sandaga Douala',101.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1260,4,'Ouest','Cameroun','Marché Central Bafoussam',100.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1261,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',107.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1262,5,'Littoral','Cameroun','Marché Sandaga Douala',111.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1263,5,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1264,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',510.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1265,8,'Littoral','Cameroun','Marché Sandaga Douala',585.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1266,8,'Ouest','Cameroun','Marché Central Bafoussam',440.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1267,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',276.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1268,9,'Littoral','Cameroun','Marché Sandaga Douala',283.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1269,9,'Ouest','Cameroun','Marché Central Bafoussam',291.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1270,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',668.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1271,10,'Littoral','Cameroun','Marché Sandaga Douala',895.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1272,10,'Ouest','Cameroun','Marché Central Bafoussam',678.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1273,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',128.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1274,12,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1275,12,'Ouest','Cameroun','Marché Central Bafoussam',168.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1276,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',518.00,'XAF','litre','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1277,16,'Littoral','Cameroun','Marché Sandaga Douala',578.00,'XAF','litre','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1278,16,'Ouest','Cameroun','Marché Central Bafoussam',559.00,'XAF','litre','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1279,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',607.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1280,17,'Littoral','Cameroun','Marché Sandaga Douala',577.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1281,17,'Ouest','Cameroun','Marché Central Bafoussam',756.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1282,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1010.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1283,19,'Littoral','Cameroun','Marché Sandaga Douala',1362.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1284,19,'Ouest','Cameroun','Marché Central Bafoussam',1114.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1285,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3748.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1286,20,'Littoral','Cameroun','Marché Sandaga Douala',3708.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1287,20,'Ouest','Cameroun','Marché Central Bafoussam',2984.00,'XAF','kg','2026-02-22','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1288,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',166.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1289,1,'Littoral','Cameroun','Marché Sandaga Douala',172.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1290,1,'Ouest','Cameroun','Marché Central Bafoussam',210.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1291,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',391.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1292,2,'Littoral','Cameroun','Marché Sandaga Douala',298.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1293,2,'Ouest','Cameroun','Marché Central Bafoussam',382.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1294,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',114.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1295,3,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1296,3,'Ouest','Cameroun','Marché Central Bafoussam',110.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1297,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',121.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1298,4,'Littoral','Cameroun','Marché Sandaga Douala',112.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1299,4,'Ouest','Cameroun','Marché Central Bafoussam',127.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1300,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',133.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1301,5,'Littoral','Cameroun','Marché Sandaga Douala',104.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1302,5,'Ouest','Cameroun','Marché Central Bafoussam',110.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1303,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',494.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1304,8,'Littoral','Cameroun','Marché Sandaga Douala',523.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1305,8,'Ouest','Cameroun','Marché Central Bafoussam',585.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1306,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',363.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1307,9,'Littoral','Cameroun','Marché Sandaga Douala',314.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1308,9,'Ouest','Cameroun','Marché Central Bafoussam',417.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1309,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',863.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1310,10,'Littoral','Cameroun','Marché Sandaga Douala',747.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1311,10,'Ouest','Cameroun','Marché Central Bafoussam',649.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1312,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',175.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1313,12,'Littoral','Cameroun','Marché Sandaga Douala',146.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1314,12,'Ouest','Cameroun','Marché Central Bafoussam',125.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1315,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',640.00,'XAF','litre','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1316,16,'Littoral','Cameroun','Marché Sandaga Douala',635.00,'XAF','litre','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1317,16,'Ouest','Cameroun','Marché Central Bafoussam',650.00,'XAF','litre','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1318,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',725.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1319,17,'Littoral','Cameroun','Marché Sandaga Douala',711.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1320,17,'Ouest','Cameroun','Marché Central Bafoussam',632.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1321,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',996.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1322,19,'Littoral','Cameroun','Marché Sandaga Douala',1091.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1323,19,'Ouest','Cameroun','Marché Central Bafoussam',1142.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1324,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3482.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1325,20,'Littoral','Cameroun','Marché Sandaga Douala',3553.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1326,20,'Ouest','Cameroun','Marché Central Bafoussam',3265.00,'XAF','kg','2026-02-23','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1327,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',171.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1328,1,'Littoral','Cameroun','Marché Sandaga Douala',189.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1329,1,'Ouest','Cameroun','Marché Central Bafoussam',202.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1330,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',305.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1331,2,'Littoral','Cameroun','Marché Sandaga Douala',307.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1332,2,'Ouest','Cameroun','Marché Central Bafoussam',353.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1333,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',139.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1334,3,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1335,3,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1336,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',132.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1337,4,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1338,4,'Ouest','Cameroun','Marché Central Bafoussam',103.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1339,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',136.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1340,5,'Littoral','Cameroun','Marché Sandaga Douala',107.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1341,5,'Ouest','Cameroun','Marché Central Bafoussam',114.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1342,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',446.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1343,8,'Littoral','Cameroun','Marché Sandaga Douala',428.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1344,8,'Ouest','Cameroun','Marché Central Bafoussam',444.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1345,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',366.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1346,9,'Littoral','Cameroun','Marché Sandaga Douala',360.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1347,9,'Ouest','Cameroun','Marché Central Bafoussam',389.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1348,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',884.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1349,10,'Littoral','Cameroun','Marché Sandaga Douala',872.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1350,10,'Ouest','Cameroun','Marché Central Bafoussam',896.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1351,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',170.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1352,12,'Littoral','Cameroun','Marché Sandaga Douala',138.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1353,12,'Ouest','Cameroun','Marché Central Bafoussam',169.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1354,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',556.00,'XAF','litre','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1355,16,'Littoral','Cameroun','Marché Sandaga Douala',632.00,'XAF','litre','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1356,16,'Ouest','Cameroun','Marché Central Bafoussam',617.00,'XAF','litre','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1357,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',712.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1358,17,'Littoral','Cameroun','Marché Sandaga Douala',609.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1359,17,'Ouest','Cameroun','Marché Central Bafoussam',764.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1360,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1354.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1361,19,'Littoral','Cameroun','Marché Sandaga Douala',1207.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1362,19,'Ouest','Cameroun','Marché Central Bafoussam',1312.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1363,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3603.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1364,20,'Littoral','Cameroun','Marché Sandaga Douala',3218.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1365,20,'Ouest','Cameroun','Marché Central Bafoussam',3031.00,'XAF','kg','2026-02-24','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1366,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',231.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1367,1,'Littoral','Cameroun','Marché Sandaga Douala',167.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1368,1,'Ouest','Cameroun','Marché Central Bafoussam',166.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1369,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',357.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1370,2,'Littoral','Cameroun','Marché Sandaga Douala',351.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1371,2,'Ouest','Cameroun','Marché Central Bafoussam',362.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1372,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',143.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1373,3,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1374,3,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1375,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',107.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1376,4,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1377,4,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1378,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',134.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1379,5,'Littoral','Cameroun','Marché Sandaga Douala',106.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1380,5,'Ouest','Cameroun','Marché Central Bafoussam',102.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1381,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',513.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1382,8,'Littoral','Cameroun','Marché Sandaga Douala',505.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1383,8,'Ouest','Cameroun','Marché Central Bafoussam',434.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1384,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',268.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1385,9,'Littoral','Cameroun','Marché Sandaga Douala',337.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1386,9,'Ouest','Cameroun','Marché Central Bafoussam',395.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1387,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',787.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1388,10,'Littoral','Cameroun','Marché Sandaga Douala',826.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1389,10,'Ouest','Cameroun','Marché Central Bafoussam',793.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1390,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',142.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1391,12,'Littoral','Cameroun','Marché Sandaga Douala',173.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1392,12,'Ouest','Cameroun','Marché Central Bafoussam',124.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1393,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',589.00,'XAF','litre','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1394,16,'Littoral','Cameroun','Marché Sandaga Douala',590.00,'XAF','litre','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1395,16,'Ouest','Cameroun','Marché Central Bafoussam',611.00,'XAF','litre','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1396,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',579.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1397,17,'Littoral','Cameroun','Marché Sandaga Douala',660.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1398,17,'Ouest','Cameroun','Marché Central Bafoussam',716.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1399,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1062.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1400,19,'Littoral','Cameroun','Marché Sandaga Douala',1160.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1401,19,'Ouest','Cameroun','Marché Central Bafoussam',1199.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1402,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3494.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1403,20,'Littoral','Cameroun','Marché Sandaga Douala',3085.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1404,20,'Ouest','Cameroun','Marché Central Bafoussam',3743.00,'XAF','kg','2026-02-25','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1405,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',201.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1406,1,'Littoral','Cameroun','Marché Sandaga Douala',179.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1407,1,'Ouest','Cameroun','Marché Central Bafoussam',185.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1408,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',315.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1409,2,'Littoral','Cameroun','Marché Sandaga Douala',350.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1410,2,'Ouest','Cameroun','Marché Central Bafoussam',369.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1411,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',132.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1412,3,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1413,3,'Ouest','Cameroun','Marché Central Bafoussam',151.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1414,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',110.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1415,4,'Littoral','Cameroun','Marché Sandaga Douala',101.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1416,4,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1417,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',135.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1418,5,'Littoral','Cameroun','Marché Sandaga Douala',131.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1419,5,'Ouest','Cameroun','Marché Central Bafoussam',123.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1420,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',430.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1421,8,'Littoral','Cameroun','Marché Sandaga Douala',479.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1422,8,'Ouest','Cameroun','Marché Central Bafoussam',558.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1423,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',263.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1424,9,'Littoral','Cameroun','Marché Sandaga Douala',363.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1425,9,'Ouest','Cameroun','Marché Central Bafoussam',363.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1426,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',759.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1427,10,'Littoral','Cameroun','Marché Sandaga Douala',733.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1428,10,'Ouest','Cameroun','Marché Central Bafoussam',859.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1429,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1430,12,'Littoral','Cameroun','Marché Sandaga Douala',123.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1431,12,'Ouest','Cameroun','Marché Central Bafoussam',144.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1432,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',624.00,'XAF','litre','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1433,16,'Littoral','Cameroun','Marché Sandaga Douala',651.00,'XAF','litre','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1434,16,'Ouest','Cameroun','Marché Central Bafoussam',664.00,'XAF','litre','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1435,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',731.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1436,17,'Littoral','Cameroun','Marché Sandaga Douala',745.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1437,17,'Ouest','Cameroun','Marché Central Bafoussam',642.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1438,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1018.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1439,19,'Littoral','Cameroun','Marché Sandaga Douala',983.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1440,19,'Ouest','Cameroun','Marché Central Bafoussam',1043.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1441,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3882.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1442,20,'Littoral','Cameroun','Marché Sandaga Douala',3725.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1443,20,'Ouest','Cameroun','Marché Central Bafoussam',3021.00,'XAF','kg','2026-02-26','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1444,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',185.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1445,1,'Littoral','Cameroun','Marché Sandaga Douala',198.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1446,1,'Ouest','Cameroun','Marché Central Bafoussam',183.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1447,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',386.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1448,2,'Littoral','Cameroun','Marché Sandaga Douala',354.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1449,2,'Ouest','Cameroun','Marché Central Bafoussam',328.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1450,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',105.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1451,3,'Littoral','Cameroun','Marché Sandaga Douala',143.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1452,3,'Ouest','Cameroun','Marché Central Bafoussam',111.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1453,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1454,4,'Littoral','Cameroun','Marché Sandaga Douala',129.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1455,4,'Ouest','Cameroun','Marché Central Bafoussam',107.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1456,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1457,5,'Littoral','Cameroun','Marché Sandaga Douala',134.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1458,5,'Ouest','Cameroun','Marché Central Bafoussam',118.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1459,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',534.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1460,8,'Littoral','Cameroun','Marché Sandaga Douala',533.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1461,8,'Ouest','Cameroun','Marché Central Bafoussam',465.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1462,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',403.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1463,9,'Littoral','Cameroun','Marché Sandaga Douala',372.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1464,9,'Ouest','Cameroun','Marché Central Bafoussam',325.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1465,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',844.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1466,10,'Littoral','Cameroun','Marché Sandaga Douala',695.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1467,10,'Ouest','Cameroun','Marché Central Bafoussam',704.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1468,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',140.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1469,12,'Littoral','Cameroun','Marché Sandaga Douala',171.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1470,12,'Ouest','Cameroun','Marché Central Bafoussam',149.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1471,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',578.00,'XAF','litre','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1472,16,'Littoral','Cameroun','Marché Sandaga Douala',586.00,'XAF','litre','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1473,16,'Ouest','Cameroun','Marché Central Bafoussam',508.00,'XAF','litre','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1474,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',733.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1475,17,'Littoral','Cameroun','Marché Sandaga Douala',573.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1476,17,'Ouest','Cameroun','Marché Central Bafoussam',759.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1477,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',988.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1478,19,'Littoral','Cameroun','Marché Sandaga Douala',1295.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1479,19,'Ouest','Cameroun','Marché Central Bafoussam',1337.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1480,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3767.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1481,20,'Littoral','Cameroun','Marché Sandaga Douala',3840.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1482,20,'Ouest','Cameroun','Marché Central Bafoussam',3057.00,'XAF','kg','2026-02-27','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1483,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',190.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1484,1,'Littoral','Cameroun','Marché Sandaga Douala',179.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1485,1,'Ouest','Cameroun','Marché Central Bafoussam',156.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1486,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',389.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1487,2,'Littoral','Cameroun','Marché Sandaga Douala',340.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1488,2,'Ouest','Cameroun','Marché Central Bafoussam',287.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1489,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',127.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1490,3,'Littoral','Cameroun','Marché Sandaga Douala',108.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1491,3,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1492,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',123.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1493,4,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1494,4,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1495,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',103.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1496,5,'Littoral','Cameroun','Marché Sandaga Douala',105.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1497,5,'Ouest','Cameroun','Marché Central Bafoussam',113.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1498,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',562.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1499,8,'Littoral','Cameroun','Marché Sandaga Douala',526.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1500,8,'Ouest','Cameroun','Marché Central Bafoussam',454.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1501,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',404.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1502,9,'Littoral','Cameroun','Marché Sandaga Douala',367.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1503,9,'Ouest','Cameroun','Marché Central Bafoussam',268.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1504,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',832.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1505,10,'Littoral','Cameroun','Marché Sandaga Douala',638.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1506,10,'Ouest','Cameroun','Marché Central Bafoussam',696.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1507,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',147.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1508,12,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1509,12,'Ouest','Cameroun','Marché Central Bafoussam',145.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1510,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',526.00,'XAF','litre','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1511,16,'Littoral','Cameroun','Marché Sandaga Douala',611.00,'XAF','litre','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1512,16,'Ouest','Cameroun','Marché Central Bafoussam',663.00,'XAF','litre','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1513,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',655.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1514,17,'Littoral','Cameroun','Marché Sandaga Douala',663.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1515,17,'Ouest','Cameroun','Marché Central Bafoussam',606.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1516,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1171.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1517,19,'Littoral','Cameroun','Marché Sandaga Douala',1003.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1518,19,'Ouest','Cameroun','Marché Central Bafoussam',1253.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1519,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3273.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1520,20,'Littoral','Cameroun','Marché Sandaga Douala',3499.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1521,20,'Ouest','Cameroun','Marché Central Bafoussam',2947.00,'XAF','kg','2026-02-28','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1522,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',209.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1523,1,'Littoral','Cameroun','Marché Sandaga Douala',177.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1524,1,'Ouest','Cameroun','Marché Central Bafoussam',209.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1525,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',335.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1526,2,'Littoral','Cameroun','Marché Sandaga Douala',365.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1527,2,'Ouest','Cameroun','Marché Central Bafoussam',388.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1528,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',107.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1529,3,'Littoral','Cameroun','Marché Sandaga Douala',149.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1530,3,'Ouest','Cameroun','Marché Central Bafoussam',113.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1531,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',112.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1532,4,'Littoral','Cameroun','Marché Sandaga Douala',113.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1533,4,'Ouest','Cameroun','Marché Central Bafoussam',106.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1534,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',125.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1535,5,'Littoral','Cameroun','Marché Sandaga Douala',97.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1536,5,'Ouest','Cameroun','Marché Central Bafoussam',116.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1537,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',562.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1538,8,'Littoral','Cameroun','Marché Sandaga Douala',433.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1539,8,'Ouest','Cameroun','Marché Central Bafoussam',553.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1540,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',287.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1541,9,'Littoral','Cameroun','Marché Sandaga Douala',371.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1542,9,'Ouest','Cameroun','Marché Central Bafoussam',324.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1543,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',642.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1544,10,'Littoral','Cameroun','Marché Sandaga Douala',657.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1545,10,'Ouest','Cameroun','Marché Central Bafoussam',686.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1546,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',139.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1547,12,'Littoral','Cameroun','Marché Sandaga Douala',122.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1548,12,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1549,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',560.00,'XAF','litre','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1550,16,'Littoral','Cameroun','Marché Sandaga Douala',632.00,'XAF','litre','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1551,16,'Ouest','Cameroun','Marché Central Bafoussam',556.00,'XAF','litre','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1552,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',762.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1553,17,'Littoral','Cameroun','Marché Sandaga Douala',744.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1554,17,'Ouest','Cameroun','Marché Central Bafoussam',571.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1555,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1285.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1556,19,'Littoral','Cameroun','Marché Sandaga Douala',1329.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1557,19,'Ouest','Cameroun','Marché Central Bafoussam',1047.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1558,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3683.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1559,20,'Littoral','Cameroun','Marché Sandaga Douala',3408.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1560,20,'Ouest','Cameroun','Marché Central Bafoussam',3734.00,'XAF','kg','2026-03-01','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1561,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',158.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1562,1,'Littoral','Cameroun','Marché Sandaga Douala',200.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1563,1,'Ouest','Cameroun','Marché Central Bafoussam',217.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1564,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',305.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1565,2,'Littoral','Cameroun','Marché Sandaga Douala',355.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1566,2,'Ouest','Cameroun','Marché Central Bafoussam',310.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1567,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',106.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1568,3,'Littoral','Cameroun','Marché Sandaga Douala',142.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1569,3,'Ouest','Cameroun','Marché Central Bafoussam',117.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1570,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',124.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1571,4,'Littoral','Cameroun','Marché Sandaga Douala',99.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1572,4,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1573,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',122.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1574,5,'Littoral','Cameroun','Marché Sandaga Douala',99.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1575,5,'Ouest','Cameroun','Marché Central Bafoussam',98.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1576,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',434.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1577,8,'Littoral','Cameroun','Marché Sandaga Douala',397.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1578,8,'Ouest','Cameroun','Marché Central Bafoussam',566.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1579,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',298.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1580,9,'Littoral','Cameroun','Marché Sandaga Douala',376.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1581,9,'Ouest','Cameroun','Marché Central Bafoussam',395.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1582,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',837.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1583,10,'Littoral','Cameroun','Marché Sandaga Douala',886.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1584,10,'Ouest','Cameroun','Marché Central Bafoussam',812.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1585,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',118.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1586,12,'Littoral','Cameroun','Marché Sandaga Douala',160.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1587,12,'Ouest','Cameroun','Marché Central Bafoussam',140.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1588,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',524.00,'XAF','litre','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1589,16,'Littoral','Cameroun','Marché Sandaga Douala',675.00,'XAF','litre','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1590,16,'Ouest','Cameroun','Marché Central Bafoussam',578.00,'XAF','litre','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1591,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',619.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1592,17,'Littoral','Cameroun','Marché Sandaga Douala',732.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1593,17,'Ouest','Cameroun','Marché Central Bafoussam',582.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1594,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1006.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1595,19,'Littoral','Cameroun','Marché Sandaga Douala',1176.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1596,19,'Ouest','Cameroun','Marché Central Bafoussam',984.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1597,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',2962.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1598,20,'Littoral','Cameroun','Marché Sandaga Douala',3825.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1599,20,'Ouest','Cameroun','Marché Central Bafoussam',3415.00,'XAF','kg','2026-03-02','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1600,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',196.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1601,1,'Littoral','Cameroun','Marché Sandaga Douala',188.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1602,1,'Ouest','Cameroun','Marché Central Bafoussam',179.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1603,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',391.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1604,2,'Littoral','Cameroun','Marché Sandaga Douala',288.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1605,2,'Ouest','Cameroun','Marché Central Bafoussam',286.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1606,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',134.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1607,3,'Littoral','Cameroun','Marché Sandaga Douala',131.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1608,3,'Ouest','Cameroun','Marché Central Bafoussam',131.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1609,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',130.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1610,4,'Littoral','Cameroun','Marché Sandaga Douala',132.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1611,4,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1612,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',120.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1613,5,'Littoral','Cameroun','Marché Sandaga Douala',101.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1614,5,'Ouest','Cameroun','Marché Central Bafoussam',129.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1615,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',392.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1616,8,'Littoral','Cameroun','Marché Sandaga Douala',403.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1617,8,'Ouest','Cameroun','Marché Central Bafoussam',485.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1618,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',367.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1619,9,'Littoral','Cameroun','Marché Sandaga Douala',335.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1620,9,'Ouest','Cameroun','Marché Central Bafoussam',310.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1621,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',744.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1622,10,'Littoral','Cameroun','Marché Sandaga Douala',794.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1623,10,'Ouest','Cameroun','Marché Central Bafoussam',715.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1624,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',161.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1625,12,'Littoral','Cameroun','Marché Sandaga Douala',148.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1626,12,'Ouest','Cameroun','Marché Central Bafoussam',157.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1627,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',635.00,'XAF','litre','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1628,16,'Littoral','Cameroun','Marché Sandaga Douala',576.00,'XAF','litre','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1629,16,'Ouest','Cameroun','Marché Central Bafoussam',539.00,'XAF','litre','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1630,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',696.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1631,17,'Littoral','Cameroun','Marché Sandaga Douala',668.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1632,17,'Ouest','Cameroun','Marché Central Bafoussam',574.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1633,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1160.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1634,19,'Littoral','Cameroun','Marché Sandaga Douala',1056.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1635,19,'Ouest','Cameroun','Marché Central Bafoussam',1143.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1636,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',2988.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1637,20,'Littoral','Cameroun','Marché Sandaga Douala',3303.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1638,20,'Ouest','Cameroun','Marché Central Bafoussam',3185.00,'XAF','kg','2026-03-03','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1639,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',206.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1640,1,'Littoral','Cameroun','Marché Sandaga Douala',221.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1641,1,'Ouest','Cameroun','Marché Central Bafoussam',183.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1642,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',388.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1643,2,'Littoral','Cameroun','Marché Sandaga Douala',360.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1644,2,'Ouest','Cameroun','Marché Central Bafoussam',291.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1645,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',123.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1646,3,'Littoral','Cameroun','Marché Sandaga Douala',127.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1647,3,'Ouest','Cameroun','Marché Central Bafoussam',139.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1648,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',135.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1649,4,'Littoral','Cameroun','Marché Sandaga Douala',110.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1650,4,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1651,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',113.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1652,5,'Littoral','Cameroun','Marché Sandaga Douala',106.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1653,5,'Ouest','Cameroun','Marché Central Bafoussam',124.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1654,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',544.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1655,8,'Littoral','Cameroun','Marché Sandaga Douala',554.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1656,8,'Ouest','Cameroun','Marché Central Bafoussam',535.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1657,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',364.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1658,9,'Littoral','Cameroun','Marché Sandaga Douala',301.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1659,9,'Ouest','Cameroun','Marché Central Bafoussam',286.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1660,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',873.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1661,10,'Littoral','Cameroun','Marché Sandaga Douala',668.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1662,10,'Ouest','Cameroun','Marché Central Bafoussam',776.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1663,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',159.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1664,12,'Littoral','Cameroun','Marché Sandaga Douala',119.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1665,12,'Ouest','Cameroun','Marché Central Bafoussam',120.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1666,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',628.00,'XAF','litre','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1667,16,'Littoral','Cameroun','Marché Sandaga Douala',595.00,'XAF','litre','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1668,16,'Ouest','Cameroun','Marché Central Bafoussam',628.00,'XAF','litre','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1669,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',634.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1670,17,'Littoral','Cameroun','Marché Sandaga Douala',674.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1671,17,'Ouest','Cameroun','Marché Central Bafoussam',655.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1672,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',989.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1673,19,'Littoral','Cameroun','Marché Sandaga Douala',1029.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1674,19,'Ouest','Cameroun','Marché Central Bafoussam',1119.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1675,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3781.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1676,20,'Littoral','Cameroun','Marché Sandaga Douala',2948.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1677,20,'Ouest','Cameroun','Marché Central Bafoussam',3520.00,'XAF','kg','2026-03-04','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1678,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',204.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1679,1,'Littoral','Cameroun','Marché Sandaga Douala',185.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1680,1,'Ouest','Cameroun','Marché Central Bafoussam',154.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1681,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',351.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1682,2,'Littoral','Cameroun','Marché Sandaga Douala',333.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1683,2,'Ouest','Cameroun','Marché Central Bafoussam',356.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1684,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',130.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1685,3,'Littoral','Cameroun','Marché Sandaga Douala',122.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1686,3,'Ouest','Cameroun','Marché Central Bafoussam',124.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1687,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',112.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1688,4,'Littoral','Cameroun','Marché Sandaga Douala',125.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1689,4,'Ouest','Cameroun','Marché Central Bafoussam',96.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1690,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',97.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1691,5,'Littoral','Cameroun','Marché Sandaga Douala',122.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1692,5,'Ouest','Cameroun','Marché Central Bafoussam',127.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1693,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',476.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1694,8,'Littoral','Cameroun','Marché Sandaga Douala',484.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1695,8,'Ouest','Cameroun','Marché Central Bafoussam',413.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1696,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',361.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1697,9,'Littoral','Cameroun','Marché Sandaga Douala',260.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1698,9,'Ouest','Cameroun','Marché Central Bafoussam',315.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1699,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',873.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1700,10,'Littoral','Cameroun','Marché Sandaga Douala',746.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1701,10,'Ouest','Cameroun','Marché Central Bafoussam',782.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1702,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',138.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1703,12,'Littoral','Cameroun','Marché Sandaga Douala',153.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1704,12,'Ouest','Cameroun','Marché Central Bafoussam',132.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1705,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',642.00,'XAF','litre','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1706,16,'Littoral','Cameroun','Marché Sandaga Douala',518.00,'XAF','litre','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1707,16,'Ouest','Cameroun','Marché Central Bafoussam',559.00,'XAF','litre','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1708,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',604.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1709,17,'Littoral','Cameroun','Marché Sandaga Douala',631.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1710,17,'Ouest','Cameroun','Marché Central Bafoussam',604.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1711,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1242.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1712,19,'Littoral','Cameroun','Marché Sandaga Douala',1206.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1713,19,'Ouest','Cameroun','Marché Central Bafoussam',1253.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1714,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3513.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1715,20,'Littoral','Cameroun','Marché Sandaga Douala',3007.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1716,20,'Ouest','Cameroun','Marché Central Bafoussam',3736.00,'XAF','kg','2026-03-05','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1717,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',169.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1718,1,'Littoral','Cameroun','Marché Sandaga Douala',168.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1719,1,'Ouest','Cameroun','Marché Central Bafoussam',156.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1720,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',284.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1721,2,'Littoral','Cameroun','Marché Sandaga Douala',366.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1722,2,'Ouest','Cameroun','Marché Central Bafoussam',330.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1723,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',108.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1724,3,'Littoral','Cameroun','Marché Sandaga Douala',113.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1725,3,'Ouest','Cameroun','Marché Central Bafoussam',108.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1726,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',107.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1727,4,'Littoral','Cameroun','Marché Sandaga Douala',97.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1728,4,'Ouest','Cameroun','Marché Central Bafoussam',130.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1729,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',98.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1730,5,'Littoral','Cameroun','Marché Sandaga Douala',128.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1731,5,'Ouest','Cameroun','Marché Central Bafoussam',126.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1732,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',426.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1733,8,'Littoral','Cameroun','Marché Sandaga Douala',444.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1734,8,'Ouest','Cameroun','Marché Central Bafoussam',417.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1735,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',380.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1736,9,'Littoral','Cameroun','Marché Sandaga Douala',407.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1737,9,'Ouest','Cameroun','Marché Central Bafoussam',286.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1738,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',804.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1739,10,'Littoral','Cameroun','Marché Sandaga Douala',627.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1740,10,'Ouest','Cameroun','Marché Central Bafoussam',895.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1741,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',124.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1742,12,'Littoral','Cameroun','Marché Sandaga Douala',160.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1743,12,'Ouest','Cameroun','Marché Central Bafoussam',141.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1744,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',556.00,'XAF','litre','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1745,16,'Littoral','Cameroun','Marché Sandaga Douala',631.00,'XAF','litre','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1746,16,'Ouest','Cameroun','Marché Central Bafoussam',573.00,'XAF','litre','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1747,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',576.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1748,17,'Littoral','Cameroun','Marché Sandaga Douala',731.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1749,17,'Ouest','Cameroun','Marché Central Bafoussam',660.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1750,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1124.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1751,19,'Littoral','Cameroun','Marché Sandaga Douala',977.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1752,19,'Ouest','Cameroun','Marché Central Bafoussam',1315.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1753,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3605.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1754,20,'Littoral','Cameroun','Marché Sandaga Douala',3756.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1755,20,'Ouest','Cameroun','Marché Central Bafoussam',3178.00,'XAF','kg','2026-03-06','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1756,1,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',206.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1757,1,'Littoral','Cameroun','Marché Sandaga Douala',158.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1758,1,'Ouest','Cameroun','Marché Central Bafoussam',202.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1759,2,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',327.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1760,2,'Littoral','Cameroun','Marché Sandaga Douala',327.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1761,2,'Ouest','Cameroun','Marché Central Bafoussam',296.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1762,3,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',110.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1763,3,'Littoral','Cameroun','Marché Sandaga Douala',120.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1764,3,'Ouest','Cameroun','Marché Central Bafoussam',134.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1765,4,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',99.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1766,4,'Littoral','Cameroun','Marché Sandaga Douala',109.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1767,4,'Ouest','Cameroun','Marché Central Bafoussam',102.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1768,5,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',133.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1769,5,'Littoral','Cameroun','Marché Sandaga Douala',133.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1770,5,'Ouest','Cameroun','Marché Central Bafoussam',122.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1771,8,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',554.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1772,8,'Littoral','Cameroun','Marché Sandaga Douala',567.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1773,8,'Ouest','Cameroun','Marché Central Bafoussam',425.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1774,9,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',305.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1775,9,'Littoral','Cameroun','Marché Sandaga Douala',404.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1776,9,'Ouest','Cameroun','Marché Central Bafoussam',343.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1777,10,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',895.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1778,10,'Littoral','Cameroun','Marché Sandaga Douala',673.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1779,10,'Ouest','Cameroun','Marché Central Bafoussam',717.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1780,12,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',116.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1781,12,'Littoral','Cameroun','Marché Sandaga Douala',149.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1782,12,'Ouest','Cameroun','Marché Central Bafoussam',133.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1783,16,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',610.00,'XAF','litre','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1784,16,'Littoral','Cameroun','Marché Sandaga Douala',521.00,'XAF','litre','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1785,16,'Ouest','Cameroun','Marché Central Bafoussam',575.00,'XAF','litre','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1786,17,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',723.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1787,17,'Littoral','Cameroun','Marché Sandaga Douala',683.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1788,17,'Ouest','Cameroun','Marché Central Bafoussam',767.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1789,19,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',1280.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1790,19,'Littoral','Cameroun','Marché Sandaga Douala',1210.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1791,19,'Ouest','Cameroun','Marché Central Bafoussam',1196.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1792,20,'Centre','Cameroun','Marché Mvog-Mbi Yaoundé',3745.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1793,20,'Littoral','Cameroun','Marché Sandaga Douala',2970.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1794,20,'Ouest','Cameroun','Marché Central Bafoussam',3782.00,'XAF','kg','2026-03-07','MINADER','2026-03-07 06:22:07','2026-03-07 06:22:07'),
(1795,1,'Centre','Bamako','Maïs bio pro',175.00,'XAF','kg','2026-03-07','marketplace','2026-03-07 10:52:14','2026-03-07 10:52:14'),
(1796,3,'Rest','Bro','Jsk',36.00,'XAF','kg','2026-03-07','marketplace','2026-03-07 15:16:38','2026-03-07 15:16:38');
/*!40000 ALTER TABLE `ac_market_prices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_marketplace_products`
--

DROP TABLE IF EXISTS `ac_marketplace_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_marketplace_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `crop_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `unit` varchar(255) NOT NULL DEFAULT 'kg',
  `quantity_available` decimal(12,2) NOT NULL,
  `region` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `status` enum('active','sold','expired','draft') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_marketplace_products_user_id_foreign` (`user_id`),
  KEY `ac_marketplace_products_crop_id_foreign` (`crop_id`),
  KEY `ac_marketplace_products_status_region_index` (`status`,`region`),
  CONSTRAINT `ac_marketplace_products_crop_id_foreign` FOREIGN KEY (`crop_id`) REFERENCES `ac_crops` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ac_marketplace_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_marketplace_products`
--

LOCK TABLES `ac_marketplace_products` WRITE;
/*!40000 ALTER TABLE `ac_marketplace_products` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_marketplace_products` VALUES
(1,1,1,'Maïs jaune séché – Qualité export','Maïs jaune issu de ma plantation de Mbalmayo. Séché naturellement au soleil, humidité < 13%. Idéal pour meunerie et alimentation animale. Disponible en sacs de 100 kg.',22000.00,'XAF','sac 100kg',50.00,'Centre','Cameroun','[\"mais_1.jpg\",\"mais_2.jpg\"]','active','2026-03-02 06:22:08','2026-03-07 06:22:08'),
(2,1,5,'Manioc frais – Variété douce','Manioc fraîchement récolté, variété non amère. Livraison possible sur Yaoundé et environs. Minimum 200 kg.',150.00,'XAF','kg',800.00,'Centre','Cameroun','[\"manioc_1.jpg\"]','active','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(3,3,9,'Oignon rouge de Maroua – Stock important','Oignon rouge du bassin de la Bénoué, qualité supérieure. Conservation 3–4 mois. Vendu en filets de 25 kg. Prix dégressif selon volume.',7500.00,'XAF','filet 25kg',200.00,'Extrême-Nord','Cameroun','[\"oignon_1.jpg\",\"oignon_2.jpg\",\"oignon_3.jpg\"]','active','2026-02-28 06:22:08','2026-03-07 06:22:08'),
(4,4,20,'Café arabica des Hauts-Plateaux – 1ère qualité','Café arabica de la région de Bafoussam. Altitude 1400m. Transformation semi-lavée. Goût fruité et acidité équilibrée. Certifié coopérative locale.',4500.00,'XAF','kg',150.00,'Ouest','Cameroun','[\"cafe_1.jpg\",\"cafe_2.jpg\"]','active','2026-02-25 06:22:08','2026-03-07 06:22:08'),
(5,5,8,'Tomates fraîches cerises et rondes','Production sous serre semi-ouverte, sans pesticides chimiques. Livraison quotidienne possible sur Douala. Minimum 50 kg.',550.00,'XAF','kg',300.00,'Littoral','Cameroun','[\"tomate_1.jpg\",\"tomate_2.jpg\"]','active','2026-03-05 06:22:08','2026-03-07 06:22:08'),
(6,6,17,'Arachide décortiquée – Région Nord','Arachide de bouche, triée et décortiquée. Excellente pour huile artisanale ou consommation directe. Conditionnée en sacs de 50 kg.',32000.00,'XAF','sac 50kg',80.00,'Nord','Cameroun','[\"arachide_1.jpg\"]','active','2026-02-27 06:22:08','2026-03-07 06:22:08'),
(7,7,19,'Fèves de cacao fermentées et séchées','Cacao grade 1, fermentation contrôlée 7 jours, séchage 15 jours au soleil. Teneur en fèves violettes < 3%. Certification UTZ en cours.',1350.00,'XAF','kg',500.00,'Sud','Cameroun','[\"cacao_1.jpg\",\"cacao_2.jpg\"]','active','2026-02-20 06:22:08','2026-03-07 06:22:08'),
(8,3,3,'Mil pénicillaire – Récolte 2024','Mil de la récolte 2024, bien séché. Idéal pour couscous, bouillie et bière locale. Vendu en sacs de 100 kg.',18000.00,'XAF','sac 100kg',30.00,'Extrême-Nord','Cameroun','[\"mil_1.jpg\"]','active','2026-02-23 06:22:08','2026-03-07 06:22:08'),
(9,1,NULL,'Tomates voir bro','Détails bro',350.00,'XAF','kg',360.00,'Dakar','Sénégal','[]','active','2026-03-07 10:00:05','2026-03-07 10:00:05'),
(10,1,1,'Maïs bio pro','Tryxtry',175.00,'XAF','kg',144.00,'Centre','Bamako','[\"file:\\/\\/\\/data\\/user\\/0\\/host.exp.exponent\\/cache\\/ImagePicker\\/89567894-917f-4f4f-92ed-ac1866f3dab9.jpeg\",\"file:\\/\\/\\/data\\/user\\/0\\/host.exp.exponent\\/cache\\/ImagePicker\\/1246fde4-6a7f-4aab-b7e1-dc2084f3c6ea.jpeg\"]','active','2026-03-07 10:52:14','2026-03-07 10:52:14'),
(11,1,3,'Jsk',NULL,36.00,'XAF','kg',45.00,'Rest','Bro','[\"product_69ac4f66bc4a71.42132218.jpeg\",\"product_69ac4f66bfe9c6.08739973.jpeg\"]','active','2026-03-07 15:16:38','2026-03-07 15:16:38');
/*!40000 ALTER TABLE `ac_marketplace_products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_notifications`
--

DROP TABLE IF EXISTS `ac_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` enum('alert','price','weather','community','order','system') NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_notifications_user_id_is_read_index` (`user_id`,`is_read`),
  CONSTRAINT `ac_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_notifications`
--

LOCK TABLES `ac_notifications` WRITE;
/*!40000 ALTER TABLE `ac_notifications` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_notifications` VALUES
(1,1,'order','🛒 Nouvelle commande reçue !','Ibrahim Moussa a commandé 4 sacs d\'arachide (128 000 FCFA). Confirmez la commande AC-2024-0006.','{\"order_id\":6,\"reference\":\"AC-2024-0006\"}',1,1,'2026-03-07 00:22:08','2026-03-07 11:44:02'),
(2,1,'price','📈 Alerte prix : Maïs dépasse 250 FCFA/kg','Le maïs est à 262 FCFA/kg sur le marché de Yaoundé – votre seuil d\'alerte a été atteint. C\'est le moment de vendre !','{\"crop_id\":1,\"prix\":262,\"marche\":\"March\\u00e9 Mvog-Mbi\"}',1,1,'2026-03-06 16:22:08','2026-03-07 11:44:02'),
(3,1,'weather','🐛 Alerte ravageurs – Région Centre','Des chenilles légionnaires ont été signalées dans votre zone. Traitez vos cultures de maïs immédiatement avec Lambda-cyhalothrine.','{\"alert_id\":4,\"zone\":\"Yaound\\u00e9 Centre\"}',1,1,'2026-03-06 06:22:08','2026-03-07 11:44:02'),
(4,1,'order','✅ Commande livrée et payée','La commande AC-2024-0001 (110 000 FCFA) a été livrée avec succès. L\'avis de Marie Ekotto : ⭐⭐⭐⭐⭐','{\"order_id\":1,\"reference\":\"AC-2024-0001\",\"rating\":5}',1,1,'2026-02-15 06:22:08','2026-03-07 06:22:08'),
(5,1,'system','💰 Prêt agricole approuvé !','Félicitations ! Votre demande de prêt de 800 000 FCFA pour l\'irrigation a été approuvée. Connectez-vous pour finaliser le dossier.','{\"loan_id\":2}',1,1,'2026-03-01 06:22:08','2026-03-07 11:44:02'),
(6,1,'community','❤️ Votre post a 47 likes !','\"Technique de conservation du maïs\" est le post le plus liké de la semaine dans la catégorie Technique.','{\"post_id\":1}',1,0,'2026-03-02 06:22:08','2026-03-07 06:22:08'),
(7,1,'alert','🌧️ Orages attendus à Douala','Des précipitations importantes (180 mm) sont prévues sur le Littoral. Si vous avez des stocks ou livraisons, anticipez.','{\"zone_id\":2,\"precipitation_mm\":180}',1,1,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(8,3,'price','📊 Prix mil en hausse – Extrême-Nord','Le mil est actuellement à 155 FCFA/kg à Maroua, au-dessus de votre seuil d\'alerte (150 FCFA). Profitez-en !','{\"crop_id\":3,\"prix\":155}',0,1,'2026-03-06 22:22:08','2026-03-07 06:22:08'),
(9,3,'weather','☀️ Sécheresse critique – Extrême-Nord','Situation critique dans votre zone. Déficit pluviométrique de 60%. Activez votre plan d\'irrigation si disponible.','{\"alert_id\":2,\"severite\":\"critical\"}',0,1,'2026-03-03 06:22:08','2026-03-07 06:22:08'),
(10,5,'order','📦 Commande en cours d\'expédition','Ibrahim Moussa a confirmé la réception de 100 kg de tomates. Paiement de 55 000 FCFA en cours de traitement.','{\"order_id\":4,\"reference\":\"AC-2024-0004\"}',0,1,'2026-03-06 06:22:08','2026-03-07 06:22:08'),
(11,5,'system','📝 Demande de prêt reçue','Votre demande de prêt de 600 000 FCFA est en cours d\'analyse. Réponse attendue sous 3 jours ouvrables.','{\"loan_id\":4}',1,1,'2026-03-05 06:22:08','2026-03-07 06:22:08'),
(12,8,'system','🎉 Prêt débloqueé – 1 500 000 FCFA','Votre prêt agricole de 1 500 000 FCFA a été décaissé. Les fonds sont disponibles dans votre compte mobile money.','{\"loan_id\":1,\"montant\":1500000}',1,1,'2026-02-10 06:22:08','2026-03-07 06:22:08'),
(13,8,'community','💬 94 personnes aiment votre témoignage','Votre post sur le prêt agricole est viral ! 94 likes et 42 commentaires. Vous inspirez la communauté.','{\"post_id\":7}',0,0,'2026-03-06 18:22:08','2026-03-07 06:22:08'),
(14,7,'order','Nouvelle commande !','Commande #AC-ORD-F555B017 de Jean-Pierre Mvondo pour 1 kg de Fèves de cacao fermentées et séchées','{\"order_id\":7}',0,0,'2026-03-07 11:57:35','2026-03-07 11:57:35'),
(15,7,'order','Nouvelle commande !','Commande #AC-ORD-D2AAA55D de Jean-Pierre Mvondo pour 366 kg de Fèves de cacao fermentées et séchées','{\"order_id\":8}',0,0,'2026-03-07 11:57:57','2026-03-07 11:57:57');
/*!40000 ALTER TABLE `ac_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_orders`
--

DROP TABLE IF EXISTS `ac_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `buyer_id` bigint(20) unsigned NOT NULL,
  `seller_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `total_amount` decimal(14,2) NOT NULL,
  `commission_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `commission_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `status` enum('pending','confirmed','shipped','delivered','cancelled','disputed') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_orders_reference_unique` (`reference`),
  KEY `ac_orders_product_id_foreign` (`product_id`),
  KEY `ac_orders_buyer_id_status_index` (`buyer_id`,`status`),
  KEY `ac_orders_seller_id_status_index` (`seller_id`,`status`),
  CONSTRAINT `ac_orders_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `ac_marketplace_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_orders`
--

LOCK TABLES `ac_orders` WRITE;
/*!40000 ALTER TABLE `ac_orders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_orders` VALUES
(1,'AC-2024-0001',5,1,1,5.00,22000.00,110000.00,3.00,3300.00,'XAF','delivered','Livré à Douala, satisfaction totale.','2026-02-15 06:22:08','2026-03-07 06:22:08'),
(2,'AC-2024-0002',1,3,3,10.00,7500.00,75000.00,3.00,2250.00,'XAF','delivered',NULL,'2026-02-20 06:22:08','2026-03-07 06:22:08'),
(3,'AC-2024-0003',4,7,7,100.00,1350.00,135000.00,3.00,4050.00,'XAF','delivered','Excellent produit, recommande fortement.','2026-02-23 06:22:08','2026-03-07 06:22:08'),
(4,'AC-2024-0004',6,5,5,100.00,550.00,55000.00,3.00,1650.00,'XAF','confirmed','Livraison prévue dans 3 jours','2026-03-05 06:22:08','2026-03-07 06:22:08'),
(5,'AC-2024-0005',8,4,4,20.00,4500.00,90000.00,3.00,2700.00,'XAF','shipped','En transit vers Ngaoundéré','2026-03-04 06:22:08','2026-03-07 06:22:08'),
(6,'AC-2024-0006',5,6,6,4.00,32000.00,128000.00,3.00,3840.00,'XAF','pending',NULL,'2026-03-07 00:22:08','2026-03-07 06:22:08'),
(7,'AC-ORD-F555B017',1,7,7,1.00,1350.00,1350.00,5.00,67.50,'XAF','pending',NULL,'2026-03-07 11:57:35','2026-03-07 11:57:35'),
(8,'AC-ORD-D2AAA55D',1,7,7,366.00,1350.00,494100.00,5.00,24705.00,'XAF','pending',NULL,'2026-03-07 11:57:57','2026-03-07 11:57:57');
/*!40000 ALTER TABLE `ac_orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_payments`
--

DROP TABLE IF EXISTS `ac_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `subscription_id` bigint(20) unsigned DEFAULT NULL,
  `provider` enum('stripe','freemopay') NOT NULL,
  `provider_reference` varchar(255) DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `status` enum('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  `payer_phone` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_payments_external_id_unique` (`external_id`),
  KEY `ac_payments_subscription_id_foreign` (`subscription_id`),
  KEY `ac_payments_user_id_status_index` (`user_id`,`status`),
  KEY `ac_payments_provider_reference_index` (`provider_reference`),
  CONSTRAINT `ac_payments_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `ac_subscriptions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ac_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_payments`
--

LOCK TABLES `ac_payments` WRITE;
/*!40000 ALTER TABLE `ac_payments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_payments` VALUES
(1,'237851d6-696d-46fa-9d94-a1496fbf9e42',1,5,'stripe','pi_3T8KFXKsVgIMnHfq27KGOhf3',15000.00,'XAF','pending',NULL,'Abonnement Business - AgriConnect',NULL,'2026-03-07 11:46:16','2026-03-07 11:46:42'),
(2,'fd9e9c8a-e3d5-4fd1-84ef-0fb1616a0f76',1,6,'freemopay','1eb0ce40-1160-46f0-b847-25b8f8588366',15000.00,'XAF','pending','696087354','Abonnement Business - AgriConnect',NULL,'2026-03-07 11:47:01','2026-03-07 11:47:04'),
(3,'89bc2677-f6de-4fd2-9364-7fd28cd296c2',1,7,'freemopay','984e4391-e1bc-4d63-bae7-f8192070de94',15000.00,'XAF','pending','696087354','Abonnement Business - AgriConnect',NULL,'2026-03-07 11:47:09','2026-03-07 11:47:13');
/*!40000 ALTER TABLE `ac_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_price_alerts`
--

DROP TABLE IF EXISTS `ac_price_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_price_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `crop_id` bigint(20) unsigned NOT NULL,
  `region` varchar(255) NOT NULL,
  `condition` enum('above','below') NOT NULL,
  `threshold` decimal(12,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_triggered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_price_alerts_user_id_foreign` (`user_id`),
  KEY `ac_price_alerts_crop_id_region_is_active_index` (`crop_id`,`region`,`is_active`),
  CONSTRAINT `ac_price_alerts_crop_id_foreign` FOREIGN KEY (`crop_id`) REFERENCES `ac_crops` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_price_alerts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_price_alerts`
--

LOCK TABLES `ac_price_alerts` WRITE;
/*!40000 ALTER TABLE `ac_price_alerts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_price_alerts` VALUES
(1,1,1,'Centre','above',250.00,'XAF',1,'2026-03-03 06:22:07','2026-03-02 06:22:07','2026-03-07 06:22:07'),
(2,1,8,'Centre','below',300.00,'XAF',1,NULL,'2026-02-06 06:22:07','2026-03-07 08:03:29'),
(3,3,3,'Extrême-Nord','above',150.00,'XAF',1,'2026-03-02 06:22:07','2026-02-09 06:22:07','2026-03-07 06:22:07'),
(4,4,20,'Ouest','above',2500.00,'XAF',1,NULL,'2026-02-18 06:22:07','2026-03-07 06:22:07'),
(5,6,4,'Nord','above',130.00,'XAF',1,'2026-03-03 06:22:07','2026-02-07 06:22:07','2026-03-07 06:22:07');
/*!40000 ALTER TABLE `ac_price_alerts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_reviews`
--

DROP TABLE IF EXISTS `ac_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `seller_id` bigint(20) unsigned NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_reviews_user_id_order_id_unique` (`user_id`,`order_id`),
  KEY `ac_reviews_order_id_foreign` (`order_id`),
  KEY `ac_reviews_seller_id_foreign` (`seller_id`),
  CONSTRAINT `ac_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ac_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_reviews_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_reviews`
--

LOCK TABLES `ac_reviews` WRITE;
/*!40000 ALTER TABLE `ac_reviews` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_reviews` VALUES
(1,5,1,1,5,'Maïs de très bonne qualité, livraison rapide. Je recommande vivement Jean-Pierre !','2026-02-28 06:22:08','2026-03-07 06:22:08'),
(2,1,2,3,5,'Oignons excellents, bien conservés. Aminatou est très professionnelle.','2026-03-02 06:22:08','2026-03-07 06:22:08'),
(3,4,3,7,4,'Cacao grade 1 comme annoncé. Fermentation impeccable. Livraison un peu longue.','2026-03-03 06:22:08','2026-03-07 06:22:08');
/*!40000 ALTER TABLE `ac_reviews` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_subscription_plans`
--

DROP TABLE IF EXISTS `ac_subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_subscription_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(5) NOT NULL DEFAULT 'EUR',
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `max_posts_per_week` int(11) NOT NULL DEFAULT 3,
  `marketplace_access` tinyint(1) NOT NULL DEFAULT 1,
  `weather_alerts` tinyint(1) NOT NULL DEFAULT 0,
  `advanced_analytics` tinyint(1) NOT NULL DEFAULT 0,
  `priority_support` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_subscription_plans_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_subscription_plans`
--

LOCK TABLES `ac_subscription_plans` WRITE;
/*!40000 ALTER TABLE `ac_subscription_plans` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_subscription_plans` VALUES
(1,'free','Gratuit',0.00,'XAF','[\"Acc\\u00e8s au march\\u00e9 (lecture)\",\"3 publications communautaires\\/semaine\",\"Prix du march\\u00e9 basiques\",\"Profil agriculteur\"]',3,1,0,0,0,1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(2,'premium','Premium',5000.00,'XAF','[\"Tout le plan Gratuit\",\"Publications illimit\\u00e9es\",\"Alertes m\\u00e9t\\u00e9o en temps r\\u00e9el\",\"Alertes prix personnalis\\u00e9es\",\"Acc\\u00e8s score de cr\\u00e9dit\",\"Demandes de pr\\u00eat agricole\",\"Assurance r\\u00e9colte\"]',999,1,1,0,0,1,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(3,'business','Business',15000.00,'XAF','[\"Tout le plan Premium\",\"Analytiques avanc\\u00e9es\",\"Support prioritaire 24\\/7\",\"Tableau de bord vendeur pro\",\"Export des donn\\u00e9es\",\"API access\",\"Gestion multi-exploitations\"]',999,1,1,1,1,1,'2026-03-07 06:22:06','2026-03-07 06:22:06');
/*!40000 ALTER TABLE `ac_subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_subscriptions`
--

DROP TABLE IF EXISTS `ac_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `status` enum('active','expired','cancelled') NOT NULL DEFAULT 'active',
  `starts_at` timestamp NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_subscriptions_plan_id_foreign` (`plan_id`),
  KEY `ac_subscriptions_user_id_status_index` (`user_id`,`status`),
  CONSTRAINT `ac_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `ac_subscription_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_subscriptions`
--

LOCK TABLES `ac_subscriptions` WRITE;
/*!40000 ALTER TABLE `ac_subscriptions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_subscriptions` VALUES
(1,1,2,'active','2026-01-07 06:22:07','2027-01-07 06:22:07','PAY-DEMO-001','2026-01-07 06:22:07','2026-03-07 06:22:07'),
(2,3,3,'active','2026-02-07 06:22:07','2027-02-07 06:22:07','PAY-AMI-002','2026-02-07 06:22:07','2026-03-07 06:22:07'),
(3,4,2,'active','2025-12-07 06:22:07','2026-12-07 06:22:07','PAY-PAU-003','2025-12-07 06:22:07','2026-03-07 06:22:07'),
(4,5,1,'active','2026-02-07 06:22:07',NULL,NULL,'2026-02-07 06:22:07','2026-03-07 06:22:07'),
(5,1,3,'expired','2026-03-07 11:46:16','2026-04-07 11:46:16',NULL,'2026-03-07 11:46:16','2026-03-07 11:46:16'),
(6,1,3,'expired','2026-03-07 11:47:01','2026-04-07 11:47:01',NULL,'2026-03-07 11:47:01','2026-03-07 11:47:01'),
(7,1,3,'expired','2026-03-07 11:47:09','2026-04-07 11:47:09',NULL,'2026-03-07 11:47:09','2026-03-07 11:47:09');
/*!40000 ALTER TABLE `ac_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_transactions`
--

DROP TABLE IF EXISTS `ac_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `type` enum('commission','payment','refund','subscription') NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `currency` varchar(5) NOT NULL DEFAULT 'XAF',
  `description` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_transactions_reference_unique` (`reference`),
  KEY `ac_transactions_user_id_foreign` (`user_id`),
  KEY `ac_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `ac_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `ac_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ac_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_transactions`
--

LOCK TABLES `ac_transactions` WRITE;
/*!40000 ALTER TABLE `ac_transactions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_transactions` VALUES
(1,'TRX-001',1,1,'payment',110000.00,'XAF','Paiement commande AC-2024-0001',NULL,'2026-02-17 06:22:08','2026-03-07 06:22:08'),
(2,'TRX-002',2,1,'commission',3300.00,'XAF','Commission plateforme – AC-2024-0001',NULL,'2026-03-03 06:22:08','2026-03-07 06:22:08'),
(3,'TRX-003',1,2,'payment',75000.00,'XAF','Paiement commande AC-2024-0002',NULL,'2026-02-19 06:22:08','2026-03-07 06:22:08'),
(4,'TRX-004',2,2,'commission',2250.00,'XAF','Commission plateforme – AC-2024-0002',NULL,'2026-02-28 06:22:08','2026-03-07 06:22:08'),
(5,'TRX-005',4,3,'payment',135000.00,'XAF','Paiement commande AC-2024-0003',NULL,'2026-02-20 06:22:08','2026-03-07 06:22:08'),
(6,'TRX-006',2,3,'commission',4050.00,'XAF','Commission plateforme – AC-2024-0003',NULL,'2026-02-21 06:22:08','2026-03-07 06:22:08'),
(7,'TRX-007',1,NULL,'subscription',5000.00,'XAF','Abonnement Premium – 1 mois',NULL,'2026-02-20 06:22:08','2026-03-07 06:22:08'),
(8,'TRX-008',3,NULL,'subscription',15000.00,'XAF','Abonnement Business – 1 mois',NULL,'2026-02-22 06:22:08','2026-03-07 06:22:08');
/*!40000 ALTER TABLE `ac_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_users`
--

DROP TABLE IF EXISTS `ac_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `superficie` decimal(10,2) DEFAULT NULL,
  `cultures_principales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cultures_principales`)),
  `langue_preferee` varchar(10) NOT NULL DEFAULT 'fr',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_users_email_unique` (`email`),
  UNIQUE KEY `ac_users_google_id_unique` (`google_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_users`
--

LOCK TABLES `ac_users` WRITE;
/*!40000 ALTER TABLE `ac_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_users` VALUES
(1,'Jean-Pierre Mvondo','demo@agriConnect.cm','$2y$12$X28/BzU76rGCS7FimViBW.TvXQcFDQns6bpZyAPRQS6F6r1WT7YlG',NULL,NULL,'+237 677 123 456','Centre','Cameroun',5.50,'[\"Ma\\u00efs\",\"Manioc\",\"Tomate\"]','fr',0,'2026-03-07 06:22:06',NULL,'2025-09-29 06:22:07','2026-03-07 06:22:07'),
(2,'Admin AgriConnect','admin@agriConnect.cm','$2y$12$qni7R/VWbVBgdMXuacLnY.U5BiYY./ayBF7as9v/aNrHt7Fx.gd3K',NULL,NULL,'+237 699 000 001','Centre','Cameroun',NULL,NULL,'fr',1,'2026-03-07 06:22:06',NULL,'2025-10-22 06:22:07','2026-03-07 06:22:07'),
(3,'Aminatou Sow','aminatou@test.cm','$2y$12$nkmT4nFrIDlMgj3Fd8NuWupfRrVMaDNlrW7WbMZM4ipyBaLyGVo1q',NULL,NULL,'+237 651 234 567','Extrême-Nord','Cameroun',12.00,'[\"Mil\",\"Sorgho\",\"Arachide\",\"Oignon\"]','fr',0,'2026-03-07 06:22:06',NULL,'2025-11-25 06:22:07','2026-03-07 06:22:07'),
(4,'Paul Nkeng','paul.nkeng@test.cm','$2y$12$OPBcuXW5Zf/buvL9qjFPNOXvqbQ3nwQR2HmVpAhH4xYGfvmtARoym',NULL,NULL,'+237 678 345 678','Ouest','Cameroun',8.25,'[\"Caf\\u00e9\",\"Ma\\u00efs\",\"Banane plantain\"]','fr',0,'2026-03-07 06:22:06',NULL,'2025-10-29 06:22:07','2026-03-07 06:22:07'),
(5,'Marie Ekotto','marie.ekotto@test.cm','$2y$12$MCX3lwOJYkZqMlqSet7Uxe2.E/mYbrHSSD76htrXjhAQlZENWAEvi',NULL,NULL,'+237 699 456 789','Littoral','Cameroun',3.00,'[\"Tomate\",\"Piment\",\"Gombo\",\"Ananas\"]','fr',0,'2026-03-07 06:22:07',NULL,'2025-10-20 06:22:07','2026-03-07 06:22:07'),
(6,'Ibrahim Moussa','ibrahim.moussa@test.cm','$2y$12$b1MrEWGQgzJhUxcR8i0kEO0Yl0dN5jOWHV3Vn8ckCpbGkcuXTJTlC',NULL,NULL,'+237 677 567 890','Nord','Cameroun',25.00,'[\"Coton\",\"Mil\",\"Sorgho\",\"Arachide\"]','fr',0,'2026-03-07 06:22:07',NULL,'2025-10-13 06:22:07','2026-03-07 06:22:07'),
(7,'Solange Ateba','solange.ateba@test.cm','$2y$12$IA.r8kr1KmIBuBGkzblQH.i7rrtvOcwLgQUhO8ttHiGcyyhe1WbP2',NULL,NULL,'+237 655 678 901','Sud','Cameroun',6.75,'[\"Cacao\",\"Palmier \\u00e0 huile\",\"Manioc\"]','fr',0,'2026-03-07 06:22:07',NULL,'2025-09-11 06:22:07','2026-03-07 06:22:07'),
(8,'Benoît Fomba','benoit.fomba@test.cm','$2y$12$VjG12VoAr7B4wy/MHx8UAulagMtBFp5HwLpnwtdDJ2.0UheCMV3gG',NULL,NULL,'+237 691 789 012','Adamaoua','Cameroun',18.50,'[\"Ma\\u00efs\",\"Patate douce\",\"Soja\"]','fr',0,'2026-03-07 06:22:07',NULL,'2025-12-28 06:22:07','2026-03-07 06:22:07');
/*!40000 ALTER TABLE `ac_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_weather_alerts`
--

DROP TABLE IF EXISTS `ac_weather_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_weather_alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `type` enum('weather','pest','drought','flood','storm') NOT NULL,
  `severity` varchar(255) NOT NULL DEFAULT 'medium',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `starts_at` timestamp NOT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ac_weather_alerts_zone_id_type_index` (`zone_id`,`type`),
  CONSTRAINT `ac_weather_alerts_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `ac_weather_zones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_weather_alerts`
--

LOCK TABLES `ac_weather_alerts` WRITE;
/*!40000 ALTER TABLE `ac_weather_alerts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_weather_alerts` VALUES
(1,4,'drought','high','Risque de sécheresse prolongée','Les prévisions météorologiques indiquent une période de faibles précipitations pour les 3 prochaines semaines dans la région Nord. Les agriculteurs sont invités à anticiper l\'irrigation de leurs cultures.','{\"temperature_max\":42,\"humidite\":18,\"vent_kmh\":25}','2026-03-05 06:22:08','2026-03-25 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08'),
(2,5,'drought','critical','Alerte sécheresse critique – Extrême-Nord','Situation critique dans la zone du Lac Tchad. Déficit pluviométrique de 60% par rapport à la normale saisonnière. Risque majeur pour les cultures de mil et sorgho.','{\"deficit_mm\":85,\"temperature_max\":45,\"humidite\":12}','2026-03-02 06:22:08','2026-04-01 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08'),
(3,2,'flood','medium','Risque d\'inondation – Zone côtière','Fortes pluies attendues cette semaine sur le Littoral. Les zones basses sont particulièrement exposées. Protégez vos stocks et évitez les zones inondables.','{\"precipitation_mm\":180,\"duree_heures\":48}','2026-03-08 06:22:08','2026-03-13 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08'),
(4,1,'pest','high','Invasion de chenilles légionnaires','Des signalements de Spodoptera frugiperda (chenille légionnaire d\'automne) ont été confirmés dans plusieurs exploitations de la région Centre. Traitez vos cultures de maïs immédiatement.','{\"cultures_touchees\":[\"Ma\\u00efs\",\"Sorgho\"],\"traitement_recommande\":\"Lambda-cyhalothrine\"}','2026-03-04 06:22:08','2026-03-21 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08'),
(5,3,'storm','medium','Orages violents attendus – Région Ouest','Des orages avec grêle et vents forts (60–80 km/h) sont prévus pour ce weekend. Sécurisez vos équipements et infrastructures agricoles.','{\"vent_kmh\":75,\"grele\":true,\"precipitation_mm\":95}','2026-03-09 06:22:08','2026-03-11 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08'),
(6,6,'weather','low','Retour de la saison des pluies','Les premières pluies de la saison sont attendues dans l\'Adamaoua. Bonne nouvelle pour les cultures ! Préparez vos semis.','{\"precipitation_prevue_mm\":45,\"temperature_min\":18}','2026-03-10 06:22:08','2026-03-17 06:22:08','2026-03-07 06:22:08','2026-03-07 06:22:08');
/*!40000 ALTER TABLE `ac_weather_alerts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_weather_subscriptions`
--

DROP TABLE IF EXISTS `ac_weather_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_weather_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `zone_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ac_weather_subscriptions_user_id_zone_id_unique` (`user_id`,`zone_id`),
  KEY `ac_weather_subscriptions_zone_id_foreign` (`zone_id`),
  CONSTRAINT `ac_weather_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ac_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ac_weather_subscriptions_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `ac_weather_zones` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_weather_subscriptions`
--

LOCK TABLES `ac_weather_subscriptions` WRITE;
/*!40000 ALTER TABLE `ac_weather_subscriptions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_weather_subscriptions` VALUES
(1,1,1,0,'2026-03-07 06:22:07','2026-03-07 09:28:33'),
(2,1,2,0,'2026-03-07 06:22:07','2026-03-07 09:28:34'),
(3,3,5,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(4,3,4,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(5,4,3,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(6,5,2,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(7,6,4,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(8,7,8,1,'2026-03-07 06:22:07','2026-03-07 06:22:07'),
(9,1,3,1,'2026-03-07 09:12:06','2026-03-07 09:12:06'),
(10,1,10,0,'2026-03-07 09:12:13','2026-03-07 09:20:23'),
(11,1,8,1,'2026-03-07 09:12:19','2026-03-07 09:12:19'),
(12,1,4,1,'2026-03-07 09:12:27','2026-03-07 09:12:27');
/*!40000 ALTER TABLE `ac_weather_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ac_weather_zones`
--

DROP TABLE IF EXISTS `ac_weather_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ac_weather_zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_weather_zones`
--

LOCK TABLES `ac_weather_zones` WRITE;
/*!40000 ALTER TABLE `ac_weather_zones` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ac_weather_zones` VALUES
(1,'Yaoundé Centre','Centre','Cameroun',3.8667000,11.5167000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(2,'Douala Littoral','Littoral','Cameroun',4.0511000,9.7679000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(3,'Bafoussam Ouest','Ouest','Cameroun',5.4737000,10.4179000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(4,'Garoua Nord','Nord','Cameroun',9.3017000,13.3963000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(5,'Maroua Extrême-Nord','Extrême-Nord','Cameroun',10.5913000,14.3163000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(6,'Ngaoundéré Adamaoua','Adamaoua','Cameroun',7.3167000,13.5833000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(7,'Bertoua Est','Est','Cameroun',4.5833000,13.6833000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(8,'Ebolowa Sud','Sud','Cameroun',2.9167000,11.1500000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(9,'Bamenda Nord-Ouest','Nord-Ouest','Cameroun',5.9597000,10.1455000,'2026-03-07 06:22:06','2026-03-07 06:22:06'),
(10,'Buea Sud-Ouest','Sud-Ouest','Cameroun',4.1527000,9.2403000,'2026-03-07 06:22:06','2026-03-07 06:22:06');
/*!40000 ALTER TABLE `ac_weather_zones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2024_04_01_000001_create_ac_users_table',1),
(5,'2024_04_01_000002_create_ac_subscription_plans_table',1),
(6,'2024_04_01_000003_create_ac_subscriptions_table',1),
(7,'2024_04_01_000004_create_ac_crops_table',1),
(8,'2024_04_01_000005_create_ac_market_prices_table',1),
(9,'2024_04_01_000006_create_ac_price_alerts_table',1),
(10,'2024_04_01_000007_create_ac_weather_zones_table',1),
(11,'2024_04_01_000008_create_ac_weather_subscriptions_table',1),
(12,'2024_04_01_000009_create_ac_weather_alerts_table',1),
(13,'2024_04_01_000010_create_ac_marketplace_products_table',1),
(14,'2024_04_01_000011_create_ac_orders_table',1),
(15,'2024_04_01_000012_create_ac_transactions_table',1),
(16,'2024_04_01_000013_create_ac_reviews_table',1),
(17,'2024_04_01_000014_create_ac_community_posts_table',1),
(18,'2024_04_01_000015_create_ac_comments_table',1),
(19,'2024_04_01_000016_create_ac_likes_table',1),
(20,'2024_04_01_000017_create_ac_loan_requests_table',1),
(21,'2024_04_01_000018_create_ac_insurances_table',1),
(22,'2024_04_01_000019_create_ac_credit_scores_table',1),
(23,'2024_04_01_000020_create_ac_notifications_table',1),
(24,'2024_04_01_000021_create_ac_chatbot_logs_table',1),
(25,'2024_04_01_000022_create_ac_diagnostic_logs_table',1),
(26,'2024_04_01_000023_create_ac_payments_table',1),
(27,'2026_03_05_193504_create_permission_tables',1),
(28,'2026_03_05_193504_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `personal_access_tokens` VALUES
(1,'App\\Models\\AgriConnect\\AcUser',1,'auth_token','3bac82b452c9dbc7f739b234c991fa49becabc27273c8785d2447b0757113db9','[\"*\"]','2026-03-07 16:51:04',NULL,'2026-03-07 06:23:36','2026-03-07 16:51:04');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-08 22:33:52
