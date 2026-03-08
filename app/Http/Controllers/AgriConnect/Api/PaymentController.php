<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcPayment;
use App\Services\AgriConnect\StripeService;
use App\Services\AgriConnect\FreemopayService;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PaymentController extends Controller
{
    // ===== STRIPE =====

    public function stripeWebhook(Request $request)
    {
        $stripe = new StripeService();
        $success = $stripe->handleWebhook(
            $request->getContent(),
            $request->header('Stripe-Signature', '')
        );

        return response()->json(['received' => $success], $success ? 200 : 400);
    }

    // ===== FREEMOPAY =====

    public function freemopayInit(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric|min:100',
            'payer_phone' => 'required|string',
            'description' => 'nullable|string|max:255',
        ]);

        $payment = AcPayment::create([
            'external_id' => (string) Str::uuid(),
            'user_id' => $request->user()->id,
            'provider' => 'freemopay',
            'amount' => $request->amount,
            'currency' => 'XAF',
            'payer_phone' => $request->payer_phone,
            'description' => $request->description ?? 'Paiement AgriConnect',
        ]);

        $service = new FreemopayService();
        $result = $service->initPayment($payment, $request->payer_phone);

        if (!$result['success']) {
            $payment->update(['status' => 'failed']);
            return response()->json(['success' => false, 'message' => 'Erreur Freemopay.'], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'Paiement initié.',
            'data' => [
                'reference' => $result['data']['reference'] ?? null,
                'external_id' => $payment->external_id,
            ],
        ]);
    }

    public function freemopayCallback(Request $request)
    {
        $service = new FreemopayService();
        $service->handleCallback($request->all());

        return response()->json(['received' => true], 200);
    }

    public function freemopayStatus(string $reference)
    {
        $service = new FreemopayService();
        $result = $service->checkStatus($reference);

        return response()->json([
            'success' => $result['success'],
            'data' => $result['data'] ?? null,
            'error' => $result['error'] ?? null,
        ]);
    }

    // ===== HISTORIQUE =====

    public function history(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->payments()->latest()->paginate(15),
        ]);
    }
}
