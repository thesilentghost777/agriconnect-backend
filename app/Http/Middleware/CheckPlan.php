<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckPlan
{
    /**
     * Vérifie que l'utilisateur a le plan requis.
     * Usage dans les routes : ->middleware('check.plan:premium') ou ->middleware('check.plan:business')
     */
    public function handle(Request $request, Closure $next, string ...$allowedPlans)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'Non authentifié.'], 401);
        }

        $activePlan = $user->active_plan;
        $currentSlug = $activePlan ? $activePlan->slug : 'free';

        // Hiérarchie : business > premium > free
        $hierarchy = ['free' => 0, 'premium' => 1, 'business' => 2];
        $currentLevel = $hierarchy[$currentSlug] ?? 0;

        $requiredLevel = 0;
        foreach ($allowedPlans as $plan) {
            $level = $hierarchy[$plan] ?? 0;
            if ($level > $requiredLevel) $requiredLevel = $level;
        }

        if ($currentLevel < $requiredLevel) {
            $planName = array_search($requiredLevel, $hierarchy);
            return response()->json([
                'success' => false,
                'message' => "Cette fonctionnalité nécessite un abonnement {$planName} ou supérieur.",
                'current_plan' => $currentSlug,
                'required_plan' => $planName,
                'upgrade_url' => '/api/v1/subscriptions/plans',
            ], 403);
        }

        return $next($request);
    }
}
