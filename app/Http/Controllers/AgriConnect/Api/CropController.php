<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcCrop;
use Illuminate\Http\Request;

class CropController extends Controller
{
    public function index()
    {
        return response()->json([
            'success' => true,
            'data' => AcCrop::where('is_active', true)->get(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'name_local' => 'nullable|string|max:255',
            'category' => 'nullable|string|max:50',
            'icon' => 'nullable|string|max:50',
        ]);

        return response()->json(['success' => true, 'data' => AcCrop::create($validated)], 201);
    }

    public function update(Request $request, AcCrop $crop)
    {
        $crop->update($request->only(['name', 'name_local', 'category', 'icon', 'is_active']));
        return response()->json(['success' => true, 'data' => $crop->fresh()]);
    }

    public function destroy(AcCrop $crop)
    {
        $crop->delete();
        return response()->json(['success' => true, 'message' => 'Culture supprimée.']);
    }
}
