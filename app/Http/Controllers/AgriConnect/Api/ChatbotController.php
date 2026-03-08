<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcChatbotLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ChatbotController extends Controller
{
    public function send(Request $request)
    {
        $request->validate(['message' => 'required|string|max:2000']);

        $user = $request->user();
        $apiUrl = env('CHATBOT_API_URL');

        if (!$apiUrl) {
            return response()->json(['success' => false, 'message' => 'Service chatbot non configuré.'], 503);
        }

        $start = microtime(true);

        try {
            $response = Http::timeout(30)->post($apiUrl, [
                'message' => $request->message,
                'langue' => $user->langue_preferee ?? 'fr',
                'user_id' => $user->id,
            ]);

            $elapsed = intval((microtime(true) - $start) * 1000);
            $responseText = $response->json('response') ?? $response->body();

            AcChatbotLog::create([
                'user_id' => $user->id,
                'message' => $request->message,
                'response' => $responseText,
                'langue' => $user->langue_preferee ?? 'fr',
                'response_time_ms' => $elapsed,
            ]);

            return response()->json([
                'success' => true,
                'data' => ['response' => $responseText, 'response_time_ms' => $elapsed],
            ]);
        } catch (\Exception $e) {
            $elapsed = intval((microtime(true) - $start) * 1000);

            AcChatbotLog::create([
                'user_id' => $user->id,
                'message' => $request->message,
                'response' => 'ERROR: ' . $e->getMessage(),
                'langue' => $user->langue_preferee ?? 'fr',
                'response_time_ms' => $elapsed,
            ]);

            return response()->json(['success' => false, 'message' => 'Erreur du service chatbot.'], 503);
        }
    }

    public function history(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => AcChatbotLog::where('user_id', $request->user()->id)
                ->latest()
                ->take(50)
                ->get(),
        ]);
    }
}
