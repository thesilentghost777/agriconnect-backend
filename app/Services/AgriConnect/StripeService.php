<?php

namespace App\Services\AgriConnect;

use App\Models\AgriConnect\AcPayment;
use App\Models\AgriConnect\AcSubscription;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use Stripe\Webhook;

class StripeService
{
    public function __construct()
    {
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
    }

    /**
     * Créer un PaymentIntent Stripe.
     */
    public function createPaymentIntent(AcPayment $payment): array
    {
        try {
            $intent = PaymentIntent::create([
                'amount' => intval($payment->amount * 100), // centimes
                'currency' => strtolower($payment->currency === 'XAF' ? 'eur' : $payment->currency),
                'metadata' => [
                    'external_id' => $payment->external_id,
                    'user_id' => $payment->user_id,
                ],
            ]);

            $payment->update(['provider_reference' => $intent->id]);

            return [
                'success' => true,
                'client_secret' => $intent->client_secret,
                'payment_intent_id' => $intent->id,
            ];
        } catch (\Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Traiter le webhook Stripe.
     */
    public function handleWebhook(string $payload, string $signature): bool
    {
        try {
            $event = Webhook::constructEvent(
                $payload,
                $signature,
                env('STRIPE_WEBHOOK_SECRET')
            );
        } catch (\Exception $e) {
            \Log::error('Stripe webhook signature failed: ' . $e->getMessage());
            return false;
        }

        if ($event->type === 'payment_intent.succeeded') {
            $intent = $event->data->object;
            $externalId = $intent->metadata->external_id ?? null;

            if ($externalId) {
                $payment = AcPayment::where('external_id', $externalId)->first();
                if ($payment) {
                    $payment->update(['status' => 'paid']);
                    if ($payment->subscription_id) {
                        AcSubscription::where('id', $payment->subscription_id)
                            ->update(['status' => 'active']);
                    }
                }
            }
        }

        return true;
    }
}
