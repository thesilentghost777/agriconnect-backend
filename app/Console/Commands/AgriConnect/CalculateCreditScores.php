<?php

namespace App\Console\Commands\AgriConnect;

use Illuminate\Console\Command;
use App\Services\AgriConnect\CreditScoreService;

class CalculateCreditScores extends Command
{
    protected $signature = 'ac:calculate-credit-scores';
    protected $description = 'Recalcule les scores de crédit de tous les utilisateurs (quotidien minuit)';

    public function handle()
    {
        $service = new CreditScoreService();
        $count = $service->calculateAll();

        $this->info("✅ Scores recalculés pour {$count} utilisateur(s).");
        return 0;
    }
}
