<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcChatbotLog extends Model
{
    protected $table = 'ac_chatbot_logs';
    protected $fillable = ['user_id', 'message', 'response', 'langue', 'response_time_ms'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
