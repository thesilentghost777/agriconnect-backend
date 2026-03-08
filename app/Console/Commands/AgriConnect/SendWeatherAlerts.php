<?php

namespace App\Console\Commands\AgriConnect;

use Illuminate\Console\Command;
use App\Services\AgriConnect\WeatherAlertService;

class SendWeatherAlerts extends Command
{
    protected $signature = 'ac:send-weather-alerts';
    protected $description = 'Envoie les alertes météo aux abonnés des zones (toutes les 6h)';

    public function handle()
    {
        $service = new WeatherAlertService();
        $sent = $service->sendAlerts();

        $this->info("✅ {$sent} notification(s) météo envoyée(s).");
        return 0;
    }
}
