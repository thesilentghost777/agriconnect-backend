<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcLoanRequest extends Model
{
    protected $table = 'ac_loan_requests';

    protected $fillable = [
        'user_id', 'amount', 'currency', 'purpose', 'description',
        'duration_months', 'status', 'rejection_reason', 'credit_score_at_request',
    ];

    protected $casts = ['amount' => 'decimal:2'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
