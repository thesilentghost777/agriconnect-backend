<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcReview extends Model
{
    protected $table = 'ac_reviews';
    protected $fillable = ['user_id', 'order_id', 'seller_id', 'rating', 'comment'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function order() { return $this->belongsTo(AcOrder::class, 'order_id'); }
    public function seller() { return $this->belongsTo(AcUser::class, 'seller_id'); }
}
