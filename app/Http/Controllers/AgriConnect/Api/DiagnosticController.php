<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcDiagnosticLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class DiagnosticController extends Controller
{
    public function diagnose(Request $request)
    {
        $request->validate([
            'image' => 'required|image|max:10240', // 10MB max
        ]);

        $flaskUrl = env('FLASK_DIAGNOSTIC_URL');

        if (!$flaskUrl) {
            return response()->json(['success' => false, 'message' => 'Service diagnostic non configuré.'], 503);
        }

        // Stocker l'image
        $path = $request->file('image')->store('diagnostics', 'public');

        $start = microtime(true);

        try {
            $response = Http::timeout(60)
                ->attach('image', file_get_contents($request->file('image')->getRealPath()), $request->file('image')->getClientOriginalName())
                ->post($flaskUrl);

            $elapsed = intval((microtime(true) - $start) * 1000);
            $data = $response->json();

            $log = AcDiagnosticLog::create([
                'user_id' => $request->user()->id,
                'image_path' => $path,
                'prediction' => $data,
                'confidence' => $data['confidence'] ?? null,
                'response_time_ms' => $elapsed,
            ]);

            return response()->json([
                'success' => true,
                'data' => [
                    'prediction' => $data,
                    'image_url' => Storage::url($path),
                    'response_time_ms' => $elapsed,
                ],
            ]);
        } catch (\Exception $e) {
            $elapsed = intval((microtime(true) - $start) * 1000);

            AcDiagnosticLog::create([
                'user_id' => $request->user()->id,
                'image_path' => $path,
                'prediction' => ['error' => $e->getMessage()],
                'response_time_ms' => $elapsed,
            ]);

            return response()->json(['success' => false, 'message' => 'Erreur du service diagnostic.'], 503);
        }
    }

    public function history(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => AcDiagnosticLog::where('user_id', $request->user()->id)
                ->latest()
                ->paginate(10),
        ]);
    }
}
