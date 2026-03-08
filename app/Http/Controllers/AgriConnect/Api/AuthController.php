<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:ac_users,email',
            'password' => 'required|string|min:6|confirmed',
            'phone' => 'nullable|string|max:20',
            'region' => 'nullable|string|max:100',
            'country' => 'nullable|string|max:100',
            'superficie' => 'nullable|numeric|min:0',
            'cultures_principales' => 'nullable|array',
            'langue_preferee' => 'nullable|string|in:fr,en,ar',
        ]);

        $validated['password'] = Hash::make($validated['password']);
        $user = AcUser::create($validated);

        // Assigner plan FREE par défaut
        $freePlan = \App\Models\AgriConnect\AcSubscriptionPlan::where('slug', 'free')->first();
        if ($freePlan) {
            \App\Models\AgriConnect\AcSubscription::create([
                'user_id' => $user->id,
                'plan_id' => $freePlan->id,
                'status' => 'active',
                'starts_at' => now(),
                'expires_at' => null,
            ]);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Inscription réussie !',
            'data' => ['user' => $user, 'token' => $token],
        ], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        $user = AcUser::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['Identifiants incorrects.'],
            ]);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Connexion réussie !',
            'data' => ['user' => $user->load('activeSubscription.plan'), 'token' => $token],
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['success' => true, 'message' => 'Déconnexion réussie.']);
    }

    public function user(Request $request)
    {
        return response()->json([
            'success' => true,
            'data' => $request->user()->load(['activeSubscription.plan', 'latestCreditScore']),
        ]);
    }

    public function updateProfile(Request $request)
{
    $validated = $request->validate([
        'name'                  => 'sometimes|string|max:255',
        'phone'                 => 'nullable|string|max:20',
        'region'                => 'nullable|string|max:100',
        'country'               => 'nullable|string|max:100',
        'superficie'            => 'nullable|numeric|min:0',
        'cultures_principales'  => 'nullable|array',
        'langue_preferee'       => 'nullable|string|in:fr,en,ar',

        // Champs mot de passe
        'current_password'      => 'required_with:new_password|string',
        'new_password'          => 'nullable|string|min:8|confirmed',
    ]);

    $user = $request->user();

    // Mise à jour du mot de passe si demandée
    if ($request->filled('new_password')) {
        if (!Hash::check($request->current_password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Le mot de passe actuel est incorrect.',
            ], 422);
        }

        $validated['password'] = Hash::make($request->new_password);
    }

    // Retirer les champs de mot de passe du tableau avant update
    unset($validated['current_password'], $validated['new_password']);

    $user->update($validated);

    return response()->json([
        'success' => true,
        'message' => 'Profil mis à jour.',
        'data'    => $user->fresh(),
    ]);
}

    public function googleRedirect()
    {
        return response()->json([
            'url' => Socialite::driver('google')->stateless()->redirect()->getTargetUrl(),
        ]);
    }

    public function googleCallback(Request $request)
    {
        try {
            $googleUser = Socialite::driver('google')->stateless()->user();
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Erreur Google OAuth.'], 400);
        }

        $user = AcUser::updateOrCreate(
            ['google_id' => $googleUser->getId()],
            [
                'name' => $googleUser->getName(),
                'email' => $googleUser->getEmail(),
                'avatar' => $googleUser->getAvatar(),
            ]
        );

        // Assigner FREE si nouveau
        if ($user->wasRecentlyCreated) {
            $freePlan = \App\Models\AgriConnect\AcSubscriptionPlan::where('slug', 'free')->first();
            if ($freePlan) {
                \App\Models\AgriConnect\AcSubscription::create([
                    'user_id' => $user->id,
                    'plan_id' => $freePlan->id,
                    'status' => 'active',
                    'starts_at' => now(),
                    'expires_at' => now()->addYears(100),
                ]);
            }
        }

        $token = $user->createToken('google_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'data' => ['user' => $user, 'token' => $token],
        ]);
    }
}
