<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcDiagnosticLog extends Model
{
    protected $table = 'ac_diagnostic_logs';

    protected $fillable = ['user_id', 'image_path', 'prediction', 'confidence', 'response_time_ms'];

    protected $casts = ['prediction' => 'array'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
