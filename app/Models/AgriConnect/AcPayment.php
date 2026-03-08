<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcPayment extends Model
{
    protected $table = 'ac_payments';

    protected $fillable = [
        'external_id', 'user_id', 'subscription_id', 'provider',
        'provider_reference', 'amount', 'currency', 'status',
        'payer_phone', 'description', 'metadata',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'metadata' => 'array',
    ];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function subscription() { return $this->belongsTo(AcSubscription::class, 'subscription_id'); }
}
