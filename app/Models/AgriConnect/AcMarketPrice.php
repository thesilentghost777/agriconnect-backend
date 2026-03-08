<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcMarketPrice extends Model
{
    protected $table = 'ac_market_prices';

    protected $fillable = [
        'crop_id', 'region', 'country', 'market_name',
        'price', 'currency', 'unit', 'recorded_at', 'source',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'recorded_at' => 'date',
    ];

    public function crop()
    {
        return $this->belongsTo(AcCrop::class, 'crop_id');
    }
}
