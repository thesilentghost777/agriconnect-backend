<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcPriceAlert extends Model
{
    protected $table = 'ac_price_alerts';

    protected $fillable = [
        'user_id', 'crop_id', 'region', 'condition',
        'threshold', 'currency', 'is_active', 'last_triggered_at',
    ];

    protected $casts = [
        'threshold' => 'decimal:2',
        'is_active' => 'boolean',
        'last_triggered_at' => 'datetime',
    ];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function crop() { return $this->belongsTo(AcCrop::class, 'crop_id'); }
}
