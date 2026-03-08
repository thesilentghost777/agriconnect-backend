<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcWeatherAlert extends Model
{
    protected $table = 'ac_weather_alerts';

    protected $fillable = [
        'zone_id', 'type', 'severity', 'title',
        'description', 'metadata', 'starts_at', 'ends_at',
    ];

    protected $casts = [
        'metadata' => 'array',
        'starts_at' => 'datetime',
        'ends_at' => 'datetime',
    ];

    public function zone() { return $this->belongsTo(AcWeatherZone::class, 'zone_id'); }
}
