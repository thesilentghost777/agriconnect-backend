<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcSubscriptionPlan;
use App\Models\AgriConnect\AcSubscription;
use App\Models\AgriConnect\AcPayment;
use App\Services\AgriConnect\StripeService;
use App\Services\AgriConnect\FreemopayService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SubscriptionController extends Controller
{
    public function plans()
    {
        return response()->json([
            'success' => true,
            'data' => AcSubscriptionPlan::where('is_active', true)->get(),
        ]);
    }

    public function mySubscription(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->activeSubscription?->load('plan'),
        ]);
    }

    public function subscribe(Request $request)
    {
        $request->validate([
            'plan_id' => 'required|exists:ac_subscription_plans,id',
            'provider' => 'required|in:stripe,freemopay',
            'payer_phone' => 'required_if:provider,freemopay|string',
        ]);

        $plan = AcSubscriptionPlan::findOrFail($request->plan_id);

        if ($plan->isFree()) {
            return response()->json(['success' => false, 'message' => 'Utilisez le plan gratuit par défaut.'], 422);
        }

        // Créer subscription en attente
        $subscription = AcSubscription::create([
            'user_id' => $request->user()->id,
            'plan_id' => $plan->id,
            'status' => 'active', // sera activé après paiement → mis en pending
            'starts_at' => now(),
            'expires_at' => now()->addMonth(),
        ]);
        // Mettre en pending jusqu'au paiement
        $subscription->update(['status' => 'expired']);

        // Créer paiement
        $payment = AcPayment::create([
            'external_id' => (string) Str::uuid(),
            'user_id' => $request->user()->id,
            'subscription_id' => $subscription->id,
            'provider' => $request->provider,
            'amount' => $plan->price,
            'currency' => $plan->currency,
            'description' => "Abonnement {$plan->name} - AgriConnect",
        ]);

        if ($request->provider === 'stripe') {
            $stripe = new StripeService();
            $result = $stripe->createPaymentIntent($payment);

            if (!$result['success']) {
                return response()->json(['success' => false, 'message' => $result['error']], 500);
            }

            return response()->json([
                'success' => true,
                'data' => [
                    'client_secret' => $result['client_secret'],
                    'payment_id' => $payment->id,
                    'subscription_id' => $subscription->id,
                ],
            ]);
        }

        // Freemopay
        $freemopay = new FreemopayService();
        $result = $freemopay->initPayment($payment, $request->payer_phone);

        if (!$result['success']) {
            return response()->json(['success' => false, 'message' => 'Erreur Freemopay.', 'error' => $result['error']], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'Paiement initié. Confirmez sur votre téléphone.',
            'data' => [
                'reference' => $result['data']['reference'] ?? null,
                'payment_id' => $payment->id,
                'subscription_id' => $subscription->id,
            ],
        ]);
    }
}
