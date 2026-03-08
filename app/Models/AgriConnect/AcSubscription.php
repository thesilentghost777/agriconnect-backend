<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcSubscription extends Model
{
    protected $table = 'ac_subscriptions';

    protected $fillable = [
        'user_id', 'plan_id', 'status', 'starts_at', 'expires_at', 'payment_id',
    ];

    protected $casts = [
        'starts_at' => 'datetime',
        'expires_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(AcUser::class, 'user_id');
    }

    public function plan()
    {
        return $this->belongsTo(AcSubscriptionPlan::class, 'plan_id');
    }

    public function isActive(): bool
    {
        return $this->status === 'active' && $this->expires_at > now();
    }
}
