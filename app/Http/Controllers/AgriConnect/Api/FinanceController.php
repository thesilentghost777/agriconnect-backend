<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcLoanRequest;
use App\Models\AgriConnect\AcInsurance;
use App\Services\AgriConnect\CreditScoreService;
use Illuminate\Http\Request;

class FinanceController extends Controller
{
    // ===== PRÊTS =====

    public function loanIndex(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->loanRequests()->latest()->paginate(10),
        ]);
    }

    public function loanStore(Request $request)
    {
        $validated = $request->validate([
            'amount' => 'required|numeric|min:1000',
            'currency' => 'nullable|string|max:5',
            'purpose' => 'required|string|max:255',
            'description' => 'nullable|string|max:2000',
            'duration_months' => 'required|integer|min:1|max:60',
        ]);

        $user = $request->user();

        // Calculer le score de crédit actuel
        $scoreService = new CreditScoreService();
        $score = $scoreService->calculate($user);

        $validated['user_id'] = $user->id;
        $validated['credit_score_at_request'] = $score->score;

        $loan = AcLoanRequest::create($validated);

        return response()->json([
            'success' => true,
            'data' => $loan,
            'credit_score' => $score->score,
        ], 201);
    }

    public function loanShow(AcLoanRequest $loan, Request $request)
    {
        if ($loan->user_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        return response()->json(['success' => true, 'data' => $loan]);
    }

    // ===== ASSURANCES =====

    public function insuranceIndex(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->insurances()->latest()->paginate(10),
        ]);
    }

    public function insuranceStore(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required|in:crop,livestock,equipment',
            'coverage_amount' => 'required|numeric|min:1000',
            'premium' => 'required|numeric|min:100',
            'currency' => 'nullable|string|max:5',
            'starts_at' => 'required|date|after_or_equal:today',
            'expires_at' => 'required|date|after:starts_at',
            'details' => 'nullable|string|max:2000',
        ]);

        $validated['user_id'] = $request->user()->id;
        $insurance = AcInsurance::create($validated);

        return response()->json(['success' => true, 'data' => $insurance], 201);
    }

    // ===== SCORE DE CRÉDIT =====

    public function creditScore(Request $request)
    {
        $latest = $request->user()->latestCreditScore;
        $history = $request->user()->creditScores()->latest()->take(10)->get();

        return response()->json([
            'success' => true,
            'data' => [
                'current_score' => $latest,
                'history' => $history,
            ],
        ]);
    }
}
