<?php

namespace App\Services\AgriConnect;

use App\Models\AgriConnect\AcWeatherAlert;
use App\Models\AgriConnect\AcWeatherSubscription;
use App\Models\AgriConnect\AcNotification;
use Illuminate\Support\Facades\Mail;

class WeatherAlertService
{
    /**
     * Envoie les alertes météo récentes aux abonnés des zones concernées.
     */
    public function sendAlerts(): int
    {
        $sent = 0;
        // Alertes des 6 dernières heures non encore notifiées
        $recentAlerts = AcWeatherAlert::where('created_at', '>=', now()->subHours(6))
            ->with('zone')
            ->get();

        foreach ($recentAlerts as $alert) {
            $subscribers = AcWeatherSubscription::where('zone_id', $alert->zone_id)
                ->where('is_active', true)
                ->with('user')
                ->get();

            foreach ($subscribers as $sub) {
                // Éviter les doublons
                $exists = AcNotification::where('user_id', $sub->user_id)
                    ->where('type', 'weather')
                    ->where('data->alert_id', $alert->id)
                    ->exists();

                if ($exists) continue;

                $notification = AcNotification::create([
                    'user_id' => $sub->user_id,
                    'type' => 'weather',
                    'title' => "[{$alert->severity}] {$alert->title}",
                    'message' => $alert->description,
                    'data' => [
                        'alert_id' => $alert->id,
                        'zone' => $alert->zone->name,
                        'type' => $alert->type,
                        'severity' => $alert->severity,
                    ],
                ]);

                try {
                    Mail::raw($notification->message, function ($mail) use ($sub, $notification) {
                        $mail->to($sub->user->email)
                            ->subject("[AgriConnect Météo] {$notification->title}");
                    });
                    $notification->update(['email_sent' => true]);
                } catch (\Exception $e) {
                    \Log::error("Weather email failed: " . $e->getMessage());
                }

                $sent++;
            }
        }

        return $sent;
    }
}
