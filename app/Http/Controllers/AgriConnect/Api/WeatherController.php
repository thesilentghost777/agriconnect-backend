<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcWeatherZone;
use App\Models\AgriConnect\AcWeatherAlert;
use App\Models\AgriConnect\AcWeatherSubscription;
use Illuminate\Http\Request;

class WeatherController extends Controller
{
    // ===== ZONES =====

    public function zones()
    {
        return response()->json(['success' => true, 'data' => AcWeatherZone::all()]);
    }

    public function createZone(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'region' => 'required|string|max:100',
            'country' => 'required|string|max:100',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
        ]);

        return response()->json(['success' => true, 'data' => AcWeatherZone::create($validated)], 201);
    }

    // ===== ALERTES MÉTÉO =====

    public function alerts(Request $request)
    {
        $query = AcWeatherAlert::with('zone');

        if ($request->zone_id) $query->where('zone_id', $request->zone_id);
        if ($request->type) $query->where('type', $request->type);
        if ($request->severity) $query->where('severity', $request->severity);

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate($request->per_page ?? 15),
        ]);
    }

    public function createAlert(Request $request)
    {
        $validated = $request->validate([
            'zone_id' => 'required|exists:ac_weather_zones,id',
            'type' => 'required|in:weather,pest,drought,flood,storm',
            'severity' => 'required|in:low,medium,high,critical',
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'metadata' => 'nullable|array',
            'starts_at' => 'required|date',
            'ends_at' => 'nullable|date|after:starts_at',
        ]);

        return response()->json(['success' => true, 'data' => AcWeatherAlert::create($validated)], 201);
    }

    // ===== ABONNEMENTS ZONES =====

    public function subscribe(Request $request)
    {
        $request->validate(['zone_id' => 'required|exists:ac_weather_zones,id']);

        $sub = AcWeatherSubscription::firstOrCreate([
            'user_id' => $request->user()->id,
            'zone_id' => $request->zone_id,
        ], ['is_active' => true]);

        if (!$sub->is_active) {
            $sub->update(['is_active' => true]);
        }

        return response()->json(['success' => true, 'message' => 'Abonné à la zone.', 'data' => $sub]);
    }

    public function unsubscribe(Request $request)
    {
        $request->validate(['zone_id' => 'required|exists:ac_weather_zones,id']);

        AcWeatherSubscription::where('user_id', $request->user()->id)
            ->where('zone_id', $request->zone_id)
            ->update(['is_active' => false]);

        return response()->json(['success' => true, 'message' => 'Désabonné de la zone.']);
    }

    public function mySubscriptions(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->weatherSubscriptions()
                ->where('is_active', true)
                ->with('zone')
                ->get(),
        ]);
    }
}
