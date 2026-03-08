<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcCreditScore extends Model
{
    protected $table = 'ac_credit_scores';

    protected $fillable = [
        'user_id', 'score', 'anciennete_points', 'transactions_points',
        'connexions_points', 'plan_points', 'breakdown',
    ];

    protected $casts = ['breakdown' => 'array'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
