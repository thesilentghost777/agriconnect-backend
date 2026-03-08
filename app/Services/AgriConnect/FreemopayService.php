<?php

namespace App\Services\AgriConnect;

use App\Models\AgriConnect\AcPayment;
use App\Models\AgriConnect\AcSubscription;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;

class FreemopayService
{
    private string $baseUrl;
    private string $appKey;
    private string $secretKey;
    private string $callbackUrl;

    public function __construct()
    {
        $this->baseUrl = config('services.freemopay.base_url', env('FREEMOPAY_BASE_URL', 'https://api-v2.freemopay.com'));
        $this->appKey = env('FREEMOPAY_APP_KEY', '');
        $this->secretKey = env('FREEMOPAY_SECRET_KEY', '');
        $this->callbackUrl = env('FREEMOPAY_CALLBACK_URL', '');
    }

    /**
     * Initier un paiement Freemopay.
     */
    public function initPayment(AcPayment $payment, string $payerPhone): array
    {
        $response = Http::withBasicAuth($this->appKey, $this->secretKey)
            ->post("{$this->baseUrl}/api/v2/payment", [
                'payer' => $payerPhone,
                'amount' => (string) intval($payment->amount),
                'externalId' => $payment->external_id,
                'description' => $payment->description ?? 'Paiement AgriConnect',
                'callback' => $this->callbackUrl,
            ]);

        if ($response->successful()) {
            $data = $response->json();
            $payment->update([
                'provider_reference' => $data['reference'] ?? null,
                'payer_phone' => $payerPhone,
            ]);
            return ['success' => true, 'data' => $data];
        }

        return ['success' => false, 'error' => $response->body()];
    }

    /**
     * Vérifier le statut d'un paiement.
     */
    public function checkStatus(string $reference): array
    {
        $response = Http::withBasicAuth($this->appKey, $this->secretKey)
            ->get("{$this->baseUrl}/api/v2/payment/{$reference}");

        if ($response->successful()) {
            return ['success' => true, 'data' => $response->json()];
        }

        return ['success' => false, 'error' => $response->body()];
    }

    /**
     * Traiter le callback Freemopay.
     */
    public function handleCallback(array $data): bool
    {
        $payment = AcPayment::where('external_id', $data['externalId'] ?? '')->first();

        if (!$payment) {
            \Log::error('Freemopay callback: payment not found', $data);
            return false;
        }

        $status = strtoupper($data['status'] ?? '');

        if ($status === 'SUCCESS') {
            $payment->update(['status' => 'paid']);
            // Activer l'abonnement lié si existant
            if ($payment->subscription_id) {
                AcSubscription::where('id', $payment->subscription_id)
                    ->update(['status' => 'active']);
            }
        } elseif ($status === 'FAILED') {
            $payment->update(['status' => 'failed']);
        }

        return true;
    }
}
