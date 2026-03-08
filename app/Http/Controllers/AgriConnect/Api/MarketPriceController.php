<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcMarketPrice;
use App\Models\AgriConnect\AcCrop;
use App\Models\AgriConnect\AcPriceAlert;
use Illuminate\Http\Request;

class MarketPriceController extends Controller
{
    public function index(Request $request)
    {
        $query = AcMarketPrice::with('crop');

        if ($request->crop_id) $query->where('crop_id', $request->crop_id);
        if ($request->region) $query->where('region', $request->region);
        if ($request->from) $query->where('recorded_at', '>=', $request->from);
        if ($request->to) $query->where('recorded_at', '<=', $request->to);

        return response()->json([
            'success' => true,
            'data' => $query->latest('recorded_at')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'crop_id' => 'required|exists:ac_crops,id',
            'region' => 'required|string|max:100',
            'country' => 'required|string|max:100',
            'market_name' => 'nullable|string|max:255',
            'price' => 'required|numeric|min:0',
            'currency' => 'nullable|string|max:5',
            'unit' => 'nullable|string|max:20',
            'recorded_at' => 'required|date',
            'source' => 'nullable|string|max:255',
        ]);

        $price = AcMarketPrice::create($validated);

        return response()->json(['success' => true, 'data' => $price->load('crop')], 201);
    }

    public function show(AcMarketPrice $marketPrice)
    {
        return response()->json(['success' => true, 'data' => $marketPrice->load('crop')]);
    }

    public function update(Request $request, AcMarketPrice $marketPrice)
    {
        $validated = $request->validate([
            'price' => 'sometimes|numeric|min:0',
            'market_name' => 'nullable|string|max:255',
            'source' => 'nullable|string|max:255',
        ]);

        $marketPrice->update($validated);

        return response()->json(['success' => true, 'data' => $marketPrice->fresh()]);
    }

    public function destroy(AcMarketPrice $marketPrice)
    {
        $marketPrice->delete();
        return response()->json(['success' => true, 'message' => 'Prix supprimé.']);
    }

    /**
     * Historique des prix pour un crop+region (série temporelle).
     */
    public function history(Request $request)
    {
        $request->validate([
            'crop_id' => 'required|exists:ac_crops,id',
            'region' => 'required|string',
            'months' => 'nullable|integer|min:1|max:24',
        ]);

        $months = $request->months ?? 6;

        $prices = AcMarketPrice::where('crop_id', $request->crop_id)
            ->where('region', $request->region)
            ->where('recorded_at', '>=', now()->subMonths($months))
            ->orderBy('recorded_at')
            ->get(['price', 'recorded_at', 'unit', 'currency']);

        return response()->json(['success' => true, 'data' => $prices]);
    }

    // ===== ALERTES PRIX =====

    public function alertIndex(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->priceAlerts()->with('crop')->get(),
        ]);
    }

    public function alertStore(Request $request)
    {
        $validated = $request->validate([
            'crop_id' => 'required|exists:ac_crops,id',
            'region' => 'required|string|max:100',
            'condition' => 'required|in:above,below',
            'threshold' => 'required|numeric|min:0',
            'currency' => 'nullable|string|max:5',
        ]);

        $validated['user_id'] = $request->user()->id;
        $alert = AcPriceAlert::create($validated);

        return response()->json(['success' => true, 'data' => $alert], 201);
    }

    public function alertDestroy(Request $request, AcPriceAlert $priceAlert)
    {
        if ($priceAlert->user_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $priceAlert->delete();
        return response()->json(['success' => true, 'message' => 'Alerte supprimée.']);
    }

    public function alertToggle(Request $request, AcPriceAlert $priceAlert)
    {
        if ($priceAlert->user_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $priceAlert->update(['is_active' => !$priceAlert->is_active]);
        return response()->json(['success' => true, 'data' => $priceAlert->fresh()]);
    }
}
