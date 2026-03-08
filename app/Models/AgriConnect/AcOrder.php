<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcOrder extends Model
{
    protected $table = 'ac_orders';

    protected $fillable = [
        'reference', 'buyer_id', 'seller_id', 'product_id',
        'quantity', 'unit_price', 'total_amount',
        'commission_rate', 'commission_amount', 'currency',
        'status', 'notes',
    ];

    protected $casts = [
        'quantity' => 'decimal:2',
        'unit_price' => 'decimal:2',
        'total_amount' => 'decimal:2',
        'commission_rate' => 'decimal:2',
        'commission_amount' => 'decimal:2',
    ];

    public function buyer() { return $this->belongsTo(AcUser::class, 'buyer_id'); }
    public function seller() { return $this->belongsTo(AcUser::class, 'seller_id'); }
    public function product() { return $this->belongsTo(AcMarketplaceProduct::class, 'product_id'); }
    public function review() { return $this->hasOne(AcReview::class, 'order_id'); }
    public function transactions() { return $this->hasMany(AcTransaction::class, 'order_id'); }

    public static function generateReference(): string
    {
        return 'AC-ORD-' . strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 8));
    }

    public static function calculateCommission(float $amount): array
    {
        $rate = $amount < 500 ? 3.0 : 5.0;
        return ['rate' => $rate, 'amount' => round($amount * $rate / 100, 2)];
    }
}
