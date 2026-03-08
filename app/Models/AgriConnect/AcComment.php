<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcComment extends Model
{
    protected $table = 'ac_comments';
    protected $fillable = ['post_id', 'user_id', 'content'];

    public function post() { return $this->belongsTo(AcCommunityPost::class, 'post_id'); }
    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
