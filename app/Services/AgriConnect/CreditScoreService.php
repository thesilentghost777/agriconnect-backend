<?php

namespace App\Services\AgriConnect;

use App\Models\AgriConnect\AcUser;
use App\Models\AgriConnect\AcCreditScore;
use App\Models\AgriConnect\AcOrder;
use Carbon\Carbon;

class CreditScoreService
{
    /**
     * Calcule le score de crédit (0-100) pour un utilisateur.
     * Ancienneté: 20pts | Transactions complétées: 30pts | Connexions récentes: 20pts | Plan: 30pts
     */
    public function calculate(AcUser $user): AcCreditScore
    {
        $anciennete = $this->calculateAnciennete($user);
        $transactions = $this->calculateTransactions($user);
        $connexions = $this->calculateConnexions($user);
        $plan = $this->calculatePlan($user);

        $total = min(100, $anciennete + $transactions + $connexions + $plan);

        return AcCreditScore::create([
            'user_id' => $user->id,
            'score' => $total,
            'anciennete_points' => $anciennete,
            'transactions_points' => $transactions,
            'connexions_points' => $connexions,
            'plan_points' => $plan,
            'breakdown' => [
                'anciennete' => ['points' => $anciennete, 'max' => 20, 'months' => $user->created_at->diffInMonths(now())],
                'transactions' => ['points' => $transactions, 'max' => 30],
                'connexions' => ['points' => $connexions, 'max' => 20],
                'plan' => ['points' => $plan, 'max' => 30, 'plan' => $user->active_plan?->slug ?? 'free'],
            ],
        ]);
    }

    private function calculateAnciennete(AcUser $user): int
    {
        $months = $user->created_at->diffInMonths(now());
        // 1 point par mois, max 20
        return min(20, $months);
    }

    private function calculateTransactions(AcUser $user): int
    {
        $delivered = AcOrder::where(function ($q) use ($user) {
            $q->where('buyer_id', $user->id)->orWhere('seller_id', $user->id);
        })->where('status', 'delivered')->count();

        // 3 points par transaction complétée, max 30
        return min(30, $delivered * 3);
    }

    private function calculateConnexions(AcUser $user): int
    {
        // Basé sur l'activité récente (tokens créés dans les 30 derniers jours)
        $recentTokens = $user->tokens()->where('created_at', '>=', now()->subDays(30))->count();

        if ($recentTokens >= 20) return 20;
        if ($recentTokens >= 10) return 15;
        if ($recentTokens >= 5) return 10;
        if ($recentTokens >= 1) return 5;
        return 0;
    }

    private function calculatePlan(AcUser $user): int
    {
        $plan = $user->active_plan;
        if (!$plan) return 0;

        return match ($plan->slug) {
            'business' => 30,
            'premium' => 20,
            default => 0,
        };
    }

    /**
     * Calcule les scores pour tous les utilisateurs actifs.
     */
    public function calculateAll(): int
    {
        $users = AcUser::all();
        $count = 0;

        foreach ($users as $user) {
            $this->calculate($user);
            $count++;
        }

        return $count;
    }
}
