<?php

namespace App\Console\Commands\AgriConnect;

use Illuminate\Console\Command;
use App\Services\AgriConnect\PriceAlertService;

class CheckPriceAlerts extends Command
{
    protected $signature = 'ac:check-price-alerts';
    protected $description = 'Vérifie les alertes de prix et envoie les notifications (toutes les heures)';

    public function handle()
    {
        $service = new PriceAlertService();
        $triggered = $service->checkAlerts();

        $this->info("✅ {$triggered} alerte(s) de prix déclenchée(s).");
        return 0;
    }
}
