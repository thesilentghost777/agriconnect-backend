<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcNotification extends Model
{
    protected $table = 'ac_notifications';

    protected $fillable = [
        'user_id', 'type', 'title', 'message',
        'data', 'is_read', 'email_sent',
    ];

    protected $casts = [
        'data' => 'array',
        'is_read' => 'boolean',
        'email_sent' => 'boolean',
    ];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
