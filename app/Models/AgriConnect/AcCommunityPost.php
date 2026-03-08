<?php

namespace App\Models\AgriConnect;

use Illuminate\Database\Eloquent\Model;

class AcCommunityPost extends Model
{
    protected $table = 'ac_community_posts';

    protected $fillable = [
        'user_id', 'title', 'content', 'images', 'category',
        'likes_count', 'comments_count',
    ];

    protected $casts = ['images' => 'array'];

    public function user() { return $this->belongsTo(AcUser::class, 'user_id'); }
    public function comments() { return $this->hasMany(AcComment::class, 'post_id'); }
    public function likes() { return $this->hasMany(AcLike::class, 'post_id'); }

    public function isLikedBy(int $userId): bool
    {
        return $this->likes()->where('user_id', $userId)->exists();
    }
}
