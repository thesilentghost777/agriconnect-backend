<?php

namespace App\Models\AgriConnect;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class AcUser extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $table = 'ac_users';

    protected $fillable = [
        'name', 'email', 'password', 'google_id', 'avatar', 'phone',
        'region', 'country', 'superficie', 'cultures_principales',
        'langue_preferee', 'is_admin',
    ];

    protected $hidden = ['password', 'remember_token'];

    protected $casts = [
        'cultures_principales' => 'array',
        'superficie' => 'decimal:2',
        'is_admin' => 'boolean',
        'email_verified_at' => 'datetime',
    ];

    public function subscriptions()
    {
        return $this->hasMany(AcSubscription::class, 'user_id');
    }

    public function activeSubscription()
    {
        return $this->hasOne(AcSubscription::class, 'user_id')
            ->where('status', 'active')
            ->where('expires_at', '>', now())
            ->latest();
    }

    public function getActivePlanAttribute()
    {
        $sub = $this->activeSubscription;
        return $sub ? $sub->plan : AcSubscriptionPlan::where('slug', 'free')->first();
    }

    public function orders()
    {
        return $this->hasMany(AcOrder::class, 'buyer_id');
    }

    public function sales()
    {
        return $this->hasMany(AcOrder::class, 'seller_id');
    }

    public function products()
    {
        return $this->hasMany(AcMarketplaceProduct::class, 'user_id');
    }

    public function posts()
    {
        return $this->hasMany(AcCommunityPost::class, 'user_id');
    }

    public function notifications()
    {
        return $this->hasMany(AcNotification::class, 'user_id');
    }

    public function creditScores()
    {
        return $this->hasMany(AcCreditScore::class, 'user_id');
    }

    public function latestCreditScore()
    {
        return $this->hasOne(AcCreditScore::class, 'user_id')->latest();
    }

    public function weatherSubscriptions()
    {
        return $this->hasMany(AcWeatherSubscription::class, 'user_id');
    }

    public function priceAlerts()
    {
        return $this->hasMany(AcPriceAlert::class, 'user_id');
    }

    public function loanRequests()
    {
        return $this->hasMany(AcLoanRequest::class, 'user_id');
    }

    public function insurances()
    {
        return $this->hasMany(AcInsurance::class, 'user_id');
    }

    public function payments()
    {
        return $this->hasMany(AcPayment::class, 'user_id');
    }

    public function reviews()
    {
        return $this->hasMany(AcReview::class, 'user_id');
    }
}
