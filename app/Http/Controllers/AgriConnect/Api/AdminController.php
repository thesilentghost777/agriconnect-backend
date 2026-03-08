<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\{AcUser, AcOrder, AcPayment, AcLoanRequest, AcMarketplaceProduct, AcCommunityPost, AcNotification, AcWeatherAlert};
use App\Services\AgriConnect\CreditScoreService;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function dashboard()
    {
        return response()->json([
            'success' => true,
            'data' => [
                'total_users' => AcUser::count(),
                'total_orders' => AcOrder::count(),
                'total_revenue' => AcPayment::where('status', 'paid')->sum('amount'),
                'pending_orders' => AcOrder::where('status', 'pending')->count(),
                'pending_loans' => AcLoanRequest::where('status', 'pending')->count(),
                'active_products' => AcMarketplaceProduct::where('status', 'active')->count(),
                'total_posts' => AcCommunityPost::count(),
                'recent_orders' => AcOrder::with(['buyer:id,name', 'product:id,title'])->latest()->take(10)->get(),
                'recent_users' => AcUser::latest()->take(10)->get(['id', 'name', 'email', 'created_at']),
            ],
        ]);
    }

    public function users(Request $request)
    {
        $query = AcUser::query();
        if ($request->search) {
            $query->where(function ($q) use ($request) {
                $q->where('name', 'like', "%{$request->search}%")
                  ->orWhere('email', 'like', "%{$request->search}%");
            });
        }

        return response()->json([
            'success' => true,
            'data' => $query->with('activeSubscription.plan')->latest()->paginate(20),
        ]);
    }

    public function userShow(AcUser $user)
    {
        return response()->json([
            'success' => true,
            'data' => $user->load(['activeSubscription.plan', 'latestCreditScore', 'orders', 'loanRequests']),
        ]);
    }

    public function userToggleAdmin(AcUser $user)
    {
        $user->update(['is_admin' => !$user->is_admin]);
        return response()->json(['success' => true, 'data' => $user->fresh()]);
    }

    public function allOrders(Request $request)
    {
        $query = AcOrder::with(['buyer:id,name', 'seller:id,name', 'product:id,title']);
        if ($request->status) $query->where('status', $request->status);

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate(20),
        ]);
    }

    public function allLoans(Request $request)
    {
        $query = AcLoanRequest::with('user:id,name,email');
        if ($request->status) $query->where('status', $request->status);

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate(20),
        ]);
    }

    public function updateLoan(Request $request, AcLoanRequest $loan)
    {
        $request->validate([
            'status' => 'required|in:approved,rejected,disbursed',
            'rejection_reason' => 'required_if:status,rejected|nullable|string|max:1000',
        ]);

        $loan->update($request->only(['status', 'rejection_reason']));

        AcNotification::create([
            'user_id' => $loan->user_id,
            'type' => 'system',
            'title' => 'Mise à jour de votre demande de prêt',
            'message' => "Votre demande de prêt de {$loan->amount} {$loan->currency} a été {$request->status}." .
                ($request->rejection_reason ? " Raison : {$request->rejection_reason}" : ''),
            'data' => ['loan_id' => $loan->id],
        ]);

        return response()->json(['success' => true, 'data' => $loan->fresh()]);
    }

    public function allPayments(Request $request)
    {
        $query = AcPayment::with('user:id,name');
        if ($request->status) $query->where('status', $request->status);
        if ($request->provider) $query->where('provider', $request->provider);

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate(20),
        ]);
    }

    public function broadcastNotification(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string|max:2000',
            'type' => 'nullable|in:alert,system',
        ]);

        $users = AcUser::all();
        $count = 0;

        foreach ($users as $user) {
            AcNotification::create([
                'user_id' => $user->id,
                'type' => $request->type ?? 'system',
                'title' => $request->title,
                'message' => $request->message,
            ]);
            $count++;
        }

        return response()->json([
            'success' => true,
            'message' => "Notification envoyée à {$count} utilisateurs.",
        ]);
    }

    public function recalculateScores()
    {
        $service = new CreditScoreService();
        $count = $service->calculateAll();

        return response()->json([
            'success' => true,
            'message' => "Scores recalculés pour {$count} utilisateurs.",
        ]);
    }
}
