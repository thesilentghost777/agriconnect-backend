<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcInsurance extends Model
{
    protected $table = 'ac_insurances';

    protected $fillable = [
        'user_id', 'type', 'coverage_amount', 'premium',
        'currency', 'status', 'starts_at', 'expires_at', 'details',
    ];

    protected $casts = [
        'coverage_amount' => 'decimal:2',
        'premium' => 'decimal:2',
        'starts_at' => 'date',
        'expires_at' => 'date',
    ];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
