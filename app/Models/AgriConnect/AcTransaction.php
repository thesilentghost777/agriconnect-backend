<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcTransaction extends Model
{
    protected $table = 'ac_transactions';

    protected $fillable = [
        'reference', 'user_id', 'order_id', 'type',
        'amount', 'currency', 'description', 'metadata',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'metadata' => 'array',
    ];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function order() { return $this->belongsTo(AcOrder::class, 'order_id'); }

    public static function generateReference(): string
    {
        return 'AC-TXN-' . strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 8));
    }
}
