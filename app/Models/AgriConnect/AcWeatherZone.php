<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcWeatherZone extends Model
{
    protected $table = 'ac_weather_zones';
    protected $fillable = ['name', 'region', 'country', 'latitude', 'longitude'];

    public function alerts() { return $this->hasMany(AcWeatherAlert::class, 'zone_id'); }
    public function subscribers() { return $this->hasMany(AcWeatherSubscription::class, 'zone_id'); }
}
