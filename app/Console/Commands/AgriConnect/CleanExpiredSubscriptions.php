<?php

namespace App\Console\Commands\AgriConnect;

use Illuminate\Console\Command;
use App\Models\AgriConnect\AcSubscription;

class CleanExpiredSubscriptions extends Command
{
    protected $signature = 'ac:clean-expired-subscriptions';
    protected $description = 'Marque les abonnements expirés (quotidien)';

    public function handle()
    {
        $count = AcSubscription::where('status', 'active')
            ->where('expires_at', '<', now())
            ->update(['status' => 'expired']);

        $this->info("✅ {$count} abonnement(s) expiré(s) nettoyé(s).");
        return 0;
    }
}
