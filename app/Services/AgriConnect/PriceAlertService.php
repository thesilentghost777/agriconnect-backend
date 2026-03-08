<?php

namespace App\Services\AgriConnect;

use App\Models\AgriConnect\AcPriceAlert;
use App\Models\AgriConnect\AcMarketPrice;
use App\Models\AgriConnect\AcNotification;
use Illuminate\Support\Facades\Mail;

class PriceAlertService
{
    /**
     * Vérifie toutes les alertes prix actives et déclenche les notifications.
     */
    public function checkAlerts(): int
    {
        $triggered = 0;
        $alerts = AcPriceAlert::where('is_active', true)->with(['crop', 'user'])->get();

        foreach ($alerts as $alert) {
            $latestPrice = AcMarketPrice::where('crop_id', $alert->crop_id)
                ->where('region', $alert->region)
                ->latest('recorded_at')
                ->first();

            if (!$latestPrice) continue;

            $shouldTrigger = match ($alert->condition) {
                'above' => $latestPrice->price >= $alert->threshold,
                'below' => $latestPrice->price <= $alert->threshold,
                default => false,
            };

            if ($shouldTrigger) {
                $conditionLabel = $alert->condition === 'above' ? 'au-dessus de' : 'en-dessous de';

                $notification = AcNotification::create([
                    'user_id' => $alert->user_id,
                    'type' => 'price',
                    'title' => "Alerte prix : {$alert->crop->name}",
                    'message' => "Le prix de {$alert->crop->name} à {$alert->region} est {$conditionLabel} {$alert->threshold} {$alert->currency}. Prix actuel : {$latestPrice->price} {$latestPrice->currency}/{$latestPrice->unit}",
                    'data' => [
                        'crop_id' => $alert->crop_id,
                        'price' => $latestPrice->price,
                        'threshold' => $alert->threshold,
                        'region' => $alert->region,
                    ],
                ]);

                // Envoi email
                $this->sendEmail($alert->user, $notification);

                $alert->update(['last_triggered_at' => now()]);
                $triggered++;
            }
        }

        return $triggered;
    }

    private function sendEmail($user, AcNotification $notification): void
    {
        try {
            Mail::raw($notification->message, function ($mail) use ($user, $notification) {
                $mail->to($user->email)
                    ->subject("[AgriConnect] {$notification->title}");
            });
            $notification->update(['email_sent' => true]);
        } catch (\Exception $e) {
            \Log::error("Email alert failed for user {$user->id}: " . $e->getMessage());
        }
    }
}
