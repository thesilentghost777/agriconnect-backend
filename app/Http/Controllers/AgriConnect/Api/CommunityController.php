<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcCommunityPost;
use App\Models\AgriConnect\AcComment;
use App\Models\AgriConnect\AcLike;
use App\Models\AgriConnect\AcSubscriptionPlan;
use Illuminate\Http\Request;

class CommunityController extends Controller
{
    public function index(Request $request)
    {
        $query = AcCommunityPost::with('user:id,name,avatar');

        if ($request->category) $query->where('category', $request->category);

        $posts = $query->latest()->paginate($request->per_page ?? 15);

        // Ajouter is_liked pour l'utilisateur connecté
        if ($request->user()) {
            $posts->getCollection()->transform(function ($post) use ($request) {
                $post->is_liked = $post->isLikedBy($request->user()->id);
                return $post;
            });
        }

        return response()->json(['success' => true, 'data' => $posts]);
    }

    public function store(Request $request)
    {
        $user = $request->user();
        $plan = $user->active_plan;
        $maxPosts = $plan ? $plan->max_posts_per_week : 3;

        // Vérifier limite FREE
        $postsThisWeek = AcCommunityPost::where('user_id', $user->id)
            ->where('created_at', '>=', now()->startOfWeek())
            ->count();

        if ($postsThisWeek >= $maxPosts) {
            return response()->json([
                'success' => false,
                'message' => "Limite de {$maxPosts} posts/semaine atteinte. Passez à Premium pour publier plus.",
            ], 429);
        }

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string|max:5000',
            'images' => 'nullable|array',
            'category' => 'nullable|string|max:50',
        ]);

        $validated['user_id'] = $user->id;
        $post = AcCommunityPost::create($validated);

        return response()->json(['success' => true, 'data' => $post->load('user:id,name,avatar')], 201);
    }

    public function show(AcCommunityPost $post, Request $request)
    {
        $post->load(['user:id,name,avatar', 'comments.user:id,name,avatar']);
        if ($request->user()) {
            $post->is_liked = $post->isLikedBy($request->user()->id);
        }

        return response()->json(['success' => true, 'data' => $post]);
    }

    public function update(Request $request, AcCommunityPost $post)
    {
        if ($post->user_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $post->update($request->only(['title', 'content', 'images', 'category']));
        return response()->json(['success' => true, 'data' => $post->fresh()]);
    }

    public function destroy(Request $request, AcCommunityPost $post)
    {
        if ($post->user_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $post->delete();
        return response()->json(['success' => true, 'message' => 'Post supprimé.']);
    }

    // ===== COMMENTS =====

    public function commentStore(Request $request, AcCommunityPost $post)
    {
        $validated = $request->validate(['content' => 'required|string|max:2000']);

        $comment = AcComment::create([
            'post_id' => $post->id,
            'user_id' => $request->user()->id,
            'content' => $validated['content'],
        ]);

        $post->increment('comments_count');

        return response()->json(['success' => true, 'data' => $comment->load('user:id,name')], 201);
    }

    public function commentDestroy(Request $request, AcComment $comment)
    {
        if ($comment->user_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $comment->post->decrement('comments_count');
        $comment->delete();
        return response()->json(['success' => true, 'message' => 'Commentaire supprimé.']);
    }

    // ===== LIKES =====

    public function toggleLike(Request $request, AcCommunityPost $post)
    {
        $existing = AcLike::where('post_id', $post->id)
            ->where('user_id', $request->user()->id)
            ->first();

        if ($existing) {
            $existing->delete();
            $post->decrement('likes_count');
            return response()->json(['success' => true, 'liked' => false, 'likes_count' => $post->fresh()->likes_count]);
        }

        AcLike::create(['post_id' => $post->id, 'user_id' => $request->user()->id]);
        $post->increment('likes_count');

        return response()->json(['success' => true, 'liked' => true, 'likes_count' => $post->fresh()->likes_count]);
    }
}
