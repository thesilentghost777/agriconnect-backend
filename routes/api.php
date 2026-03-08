<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| AgriConnect API Routes
|--------------------------------------------------------------------------
| Base: /api/v1/
| Ajouter dans routes/api.php : require __DIR__.'/../agriconnect/routes/agriconnect_api.php';
*/


Route::prefix('v1')->group(function () {

    //test
    Route::get('/test', function () {
        return response()->json(['message' => 'Test successful']);
    });

    // ===== AUTH (Public) =====
    Route::prefix('auth')->group(function () {
        Route::post('/register', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'register']);
        Route::post('/login', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'login']);
        Route::get('/google/redirect', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'googleRedirect']);
        Route::get('/google/callback', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'googleCallback']);
    });

    // ===== PUBLIC =====
    Route::get('/crops', [\App\Http\Controllers\AgriConnect\Api\CropController::class, 'index']);
    Route::get('/subscriptions/plans', [\App\Http\Controllers\AgriConnect\Api\SubscriptionController::class, 'plans']);
    Route::get('/market-prices', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'index']);
    Route::get('/market-prices/history', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'history']);
    Route::get('/marketplace/products', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'productIndex']);
    Route::get('/marketplace/products/{product}', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'productShow']);
    Route::get('/marketplace/sellers/{sellerId}/reviews', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'sellerReviews']);
    Route::get('/weather/zones', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'zones']);
    Route::get('/weather/alerts', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'alerts']);
    Route::get('/community/posts', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'index']);
    Route::get('/community/posts/{post}', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'show']);

    // ===== WEBHOOKS (No auth) =====
    Route::post('/payments/stripe/webhook', [\App\Http\Controllers\AgriConnect\Api\PaymentController::class, 'stripeWebhook']);
    Route::post('/payments/freemopay/callback', [\App\Http\Controllers\AgriConnect\Api\PaymentController::class, 'freemopayCallback']);

    // ===== AUTHENTIFIÉ =====
    Route::middleware('auth:sanctum')->group(function () {

        // Auth
        Route::post('/auth/logout', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'logout']);
        Route::get('/auth/user', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'user']);
        Route::put('/auth/profile', [\App\Http\Controllers\AgriConnect\Api\AuthController::class, 'updateProfile']);

        // Abonnements
        Route::get('/subscriptions/mine', [\App\Http\Controllers\AgriConnect\Api\SubscriptionController::class, 'mySubscription']);
        Route::post('/subscriptions/subscribe', [\App\Http\Controllers\AgriConnect\Api\SubscriptionController::class, 'subscribe']);

        // Cultures (CRUD admin)
        Route::post('/crops', [\App\Http\Controllers\AgriConnect\Api\CropController::class, 'store']);
        Route::put('/crops/{crop}', [\App\Http\Controllers\AgriConnect\Api\CropController::class, 'update']);
        Route::delete('/crops/{crop}', [\App\Http\Controllers\AgriConnect\Api\CropController::class, 'destroy']);

        // Prix du marché
        Route::post('/market-prices', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'store']);
        Route::get('/market-prices/{marketPrice}', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'show']);
        Route::put('/market-prices/{marketPrice}', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'update']);
        Route::delete('/market-prices/{marketPrice}', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'destroy']);

        // Alertes prix
        Route::get('/price-alerts', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'alertIndex']);
        Route::post('/price-alerts', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'alertStore']);
        Route::delete('/price-alerts/{priceAlert}', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'alertDestroy']);
        Route::patch('/price-alerts/{priceAlert}/toggle', [\App\Http\Controllers\AgriConnect\Api\MarketPriceController::class, 'alertToggle']);

        // Météo
        Route::post('/weather/zones', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'createZone']);
        Route::post('/weather/alerts', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'createAlert']);
        Route::post('/weather/subscribe', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'subscribe']);
        Route::post('/weather/unsubscribe', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'unsubscribe']);
        Route::get('/weather/my-subscriptions', [\App\Http\Controllers\AgriConnect\Api\WeatherController::class, 'mySubscriptions']);

        // Marketplace
        Route::post('/marketplace/products', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'productStore']);
        Route::put('/marketplace/products/{product}', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'productUpdate']);
        Route::delete('/marketplace/products/{product}', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'productDestroy']);
        Route::get('/marketplace/products/{product}/contact', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'contactSeller']);

        // Commandes
        Route::get('/orders', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'orderIndex']);
        Route::post('/orders', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'orderStore']);
        Route::get('/orders/{order}', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'orderShow']);
        Route::post('/orders/{order}/confirm', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'orderConfirm']);
        Route::patch('/orders/{order}/status', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'orderUpdateStatus']);

        // Avis
        Route::post('/orders/{order}/review', [\App\Http\Controllers\AgriConnect\Api\MarketplaceController::class, 'reviewStore']);

        // Communauté
        Route::post('/community/posts', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'store']);
        Route::put('/community/posts/{post}', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'update']);
        Route::delete('/community/posts/{post}', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'destroy']);
        Route::post('/community/posts/{post}/comments', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'commentStore']);
        Route::delete('/community/comments/{comment}', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'commentDestroy']);
        Route::post('/community/posts/{post}/like', [\App\Http\Controllers\AgriConnect\Api\CommunityController::class, 'toggleLike']);

        // Finance
        Route::get('/loans', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'loanIndex']);
        Route::post('/loans', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'loanStore']);
        Route::get('/loans/{loan}', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'loanShow']);
        Route::get('/insurances', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'insuranceIndex']);
        Route::post('/insurances', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'insuranceStore']);
        Route::get('/credit-score', [\App\Http\Controllers\AgriConnect\Api\FinanceController::class, 'creditScore']);

        // Paiements
        Route::post('/payments/freemopay/init', [\App\Http\Controllers\AgriConnect\Api\PaymentController::class, 'freemopayInit']);
        Route::get('/payments/freemopay/status/{reference}', [\App\Http\Controllers\AgriConnect\Api\PaymentController::class, 'freemopayStatus']);
        Route::get('/payments/history', [\App\Http\Controllers\AgriConnect\Api\PaymentController::class, 'history']);

        // Notifications
        Route::get('/notifications', [\App\Http\Controllers\AgriConnect\Api\NotificationController::class, 'index']);
        Route::patch('/notifications/{notification}/read', [\App\Http\Controllers\AgriConnect\Api\NotificationController::class, 'markRead']);
        Route::post('/notifications/read-all', [\App\Http\Controllers\AgriConnect\Api\NotificationController::class, 'markAllRead']);

        // Chatbot
        Route::post('/chatbot/send', [\App\Http\Controllers\AgriConnect\Api\ChatbotController::class, 'send']);
        Route::get('/chatbot/history', [\App\Http\Controllers\AgriConnect\Api\ChatbotController::class, 'history']);

        // Diagnostic
        Route::post('/diagnostic/diagnose', [\App\Http\Controllers\AgriConnect\Api\DiagnosticController::class, 'diagnose']);
        Route::get('/diagnostic/history', [\App\Http\Controllers\AgriConnect\Api\DiagnosticController::class, 'history']);

        // ===== ADMIN (is_admin check dans le controller) =====
        Route::prefix('admin')->group(function () {
            Route::get('/dashboard', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'dashboard']);
            Route::get('/users', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'users']);
            Route::get('/users/{user}', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'userShow']);
            Route::patch('/users/{user}/toggle-admin', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'userToggleAdmin']);
            Route::get('/orders', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'allOrders']);
            Route::get('/loans', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'allLoans']);
            Route::patch('/loans/{loan}', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'updateLoan']);
            Route::get('/payments', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'allPayments']);
            Route::post('/notifications/broadcast', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'broadcastNotification']);
            Route::post('/scores/recalculate', [\App\Http\Controllers\AgriConnect\Api\AdminController::class, 'recalculateScores']);
        });
    });
});
