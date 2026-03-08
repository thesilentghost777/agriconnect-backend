<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcNotification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function index(Request $request)
    {
        $query = $request->user()->notifications();

        if ($request->type) $query->where('type', $request->type);
        if ($request->has('unread_only') && $request->unread_only) {
            $query->where('is_read', false);
        }

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate($request->per_page ?? 20),
            'unread_count' => $request->user()->notifications()->where('is_read', false)->count(),
        ]);
    }

    public function markRead(AcNotification $notification, Request $request)
    {
        if ($notification->user_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $notification->update(['is_read' => true]);
        return response()->json(['success' => true]);
    }

    public function markAllRead(Request $request)
    {
        $request->user()->notifications()->where('is_read', false)->update(['is_read' => true]);
        return response()->json(['success' => true, 'message' => 'Toutes les notifications marquées comme lues.']);
    }
}
