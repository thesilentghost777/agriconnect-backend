<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcLike extends Model
{
    protected $table = 'ac_likes';
    protected $fillable = ['post_id', 'user_id'];

    public function post() { return $this->belongsTo(AcCommunityPost::class, 'post_id'); }
    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
}
