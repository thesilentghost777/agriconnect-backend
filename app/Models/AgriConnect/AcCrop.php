<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcCrop extends Model
{
    protected $table = 'ac_crops';

    protected $fillable = ['name', 'name_local', 'category', 'icon', 'is_active'];

    protected $casts = ['is_active' => 'boolean'];

    public function marketPrices()
    {
        return $this->hasMany(AcMarketPrice::class, 'crop_id');
    }

    public function latestPrice(?string $region = null)
    {
        $q = $this->marketPrices()->latest('recorded_at');
        if ($region) $q->where('region', $region);
        return $q->first();
    }
}
