<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcSubscriptionPlan extends Model
{
    protected $table = 'ac_subscription_plans';

    protected $fillable = [
        'slug', 'name', 'price', 'currency', 'features',
        'max_posts_per_week', 'marketplace_access', 'weather_alerts',
        'advanced_analytics', 'priority_support', 'is_active',
    ];

    protected $casts = [
        'features' => 'array',
        'price' => 'decimal:2',
        'marketplace_access' => 'boolean',
        'weather_alerts' => 'boolean',
        'advanced_analytics' => 'boolean',
        'priority_support' => 'boolean',
        'is_active' => 'boolean',
    ];

    public function subscriptions()
    {
        return $this->hasMany(AcSubscription::class, 'plan_id');
    }

    public function isFree(): bool
    {
        return $this->slug === 'free';
    }

    public function isPremiumOrAbove(): bool
    {
        return in_array($this->slug, ['premium', 'business']);
    }
}
