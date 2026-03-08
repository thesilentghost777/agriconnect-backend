<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcWeatherSubscription extends Model
{
    protected $table = 'ac_weather_subscriptions';
    protected $fillable = ['user_id', 'zone_id', 'is_active'];
    protected $casts = ['is_active' => 'boolean'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function zone() { return $this->belongsTo(AcWeatherZone::class, 'zone_id'); }
}
