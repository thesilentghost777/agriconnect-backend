<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcMarketplaceProduct extends Model
{
    protected $table = 'ac_marketplace_products';

    protected $fillable = [
        'user_id', 'crop_id', 'title', 'description', 'price',
        'currency', 'unit', 'quantity_available', 'region',
        'country', 'images', 'status',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'quantity_available' => 'decimal:2',
        'images' => 'array',
    ];

    public function seller() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function crop() { return $this->belongsTo(AcCrop::class, 'crop_id'); }
    public function orders() { return $this->hasMany(AcOrder::class, 'product_id'); }
}
