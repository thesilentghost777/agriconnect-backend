<?php

namespace App\Http\Controllers\AgriConnect\Api;

use App\Http\Controllers\Controller;
use App\Models\AgriConnect\AcMarketplaceProduct;
use App\Models\AgriConnect\AcOrder;
use App\Models\AgriConnect\AcTransaction;
use App\Models\AgriConnect\AcReview;
use App\Models\AgriConnect\AcNotification;
use App\Models\AgriConnect\AcMarketPrice;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class MarketplaceController extends Controller
{
    // ===== PRODUITS =====

    public function productIndex(Request $request)
    {
        $query = AcMarketplaceProduct::with(['seller:id,name,region,phone', 'crop:id,name'])
            ->where('status', 'active');

        if ($request->crop_id) $query->where('crop_id', $request->crop_id);
        if ($request->region) $query->where('region', $request->region);
        if ($request->min_price) $query->where('price', '>=', $request->min_price);
        if ($request->max_price) $query->where('price', '<=', $request->max_price);
        if ($request->search) {
            $query->where(function ($q) use ($request) {
                $q->where('title', 'like', "%{$request->search}%")
                  ->orWhere('description', 'like', "%{$request->search}%");
            });
        }

        return response()->json([
            'success' => true,
            'data' => $query->latest()->paginate($request->per_page ?? 20),
        ]);
    }

    public function productStore(Request $request)
{
    $validated = $request->validate([
        'crop_id'            => 'nullable|exists:ac_crops,id',
        'title'              => 'required|string|max:255',
        'description'        => 'nullable|string|max:2000',
        'price'              => 'required|numeric|min:0',
        'currency'           => 'nullable|string|max:5',
        'unit'               => 'nullable|string|max:20',
        'quantity_available' => 'required|numeric|min:0',
        'region'             => 'required|string|max:100',
        'country'            => 'required|string|max:100',
        'images'             => 'nullable|array',
        'images.*' => 'nullable|file|mimes:jpg,jpeg,png,webp|max:4096',
    ]);

    // ── Upload des images ──────────────────────────────────────────
    $imageNames = [];
    if ($request->hasFile('images')) {
        foreach ($request->file('images') as $file) {
            $name = uniqid('product_', true) . '.' . $file->getClientOriginalExtension();
            $file->storeAs('products', $name, 'public');
            $imageNames[] = $name;
        }
    }
    $validated['images'] = $imageNames; // stocke ["abc.jpg","def.jpg"]
    $validated['user_id'] = $request->user()->id;

    DB::transaction(function () use ($validated, &$product) {
        $product = AcMarketplaceProduct::create($validated);

        if (!empty($validated['crop_id'])) {
            AcMarketPrice::create([
                'crop_id'     => $validated['crop_id'],
                'region'      => $validated['region'],
                'country'     => $validated['country'],
                'market_name' => $product->title,
                'price'       => $validated['price'],
                'currency'    => $validated['currency'] ?? 'XAF',
                'unit'        => $validated['unit']     ?? 'kg',
                'recorded_at' => now()->toDateString(),
                'source'      => 'marketplace',
            ]);
        }
    });

    return response()->json([
        'success' => true,
        'data'    => $product->load(['seller:id,name,region,phone', 'crop']),
    ], 201);
}

    public function productShow(AcMarketplaceProduct $product)
    {
        return response()->json([
            'success' => true,
            'data' => $product->load(['seller:id,name,region,phone', 'crop']),
        ]);
    }

    public function productUpdate(Request $request, AcMarketplaceProduct $product)
    {
        if ($product->user_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $product->update($request->only([
            'title', 'description', 'price', 'unit', 'quantity_available', 'images', 'status',
        ]));

        return response()->json(['success' => true, 'data' => $product->fresh()]);
    }

    public function productDestroy(Request $request, AcMarketplaceProduct $product)
    {
        if ($product->user_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $product->delete();
        return response()->json(['success' => true, 'message' => 'Annonce supprimée.']);
    }

    /**
     * Contacter le vendeur (retourne phone + lien WhatsApp).
     */
    public function contactSeller(AcMarketplaceProduct $product)
    {
        $seller = $product->seller;
        $whatsappLink = $seller->phone
            ? 'https://wa.me/' . preg_replace('/[^0-9]/', '', $seller->phone) . '?text=' . urlencode("Bonjour, je suis intéressé par votre annonce \"{$product->title}\" sur AgriConnect.")
            : null;

        return response()->json([
            'success' => true,
            'data' => [
                'seller_name' => $seller->name,
                'phone' => $seller->phone,
                'whatsapp_link' => $whatsappLink,
            ],
        ]);
    }

    // ===== COMMANDES =====

    public function orderStore(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:ac_marketplace_products,id',
            'quantity' => 'required|numeric|min:0.01',
            'notes' => 'nullable|string|max:1000',
        ]);

        $product = AcMarketplaceProduct::findOrFail($validated['product_id']);

        if ($product->user_id === $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Vous ne pouvez pas acheter votre propre produit.'], 422);
        }

        if ($validated['quantity'] > $product->quantity_available) {
            return response()->json(['success' => false, 'message' => 'Quantité insuffisante.'], 422);
        }

        $total = round($product->price * $validated['quantity'], 2);
        $commission = AcOrder::calculateCommission($total);

        $order = AcOrder::create([
            'reference' => AcOrder::generateReference(),
            'buyer_id' => $request->user()->id,
            'seller_id' => $product->user_id,
            'product_id' => $product->id,
            'quantity' => $validated['quantity'],
            'unit_price' => $product->price,
            'total_amount' => $total,
            'commission_rate' => $commission['rate'],
            'commission_amount' => $commission['amount'],
            'currency' => $product->currency,
            'notes' => $validated['notes'] ?? null,
        ]);

        // Notifier le vendeur
        AcNotification::create([
            'user_id' => $product->user_id,
            'type' => 'order',
            'title' => 'Nouvelle commande !',
            'message' => "Commande #{$order->reference} de {$request->user()->name} pour {$validated['quantity']} {$product->unit} de {$product->title}",
            'data' => ['order_id' => $order->id],
        ]);

        return response()->json(['success' => true, 'data' => $order->load('product')], 201);
    }

    public function orderIndex(Request $request)
    {
        $orders = AcOrder::where('buyer_id', $request->user()->id)
            ->orWhere('seller_id', $request->user()->id)
            ->with(['product:id,title', 'buyer:id,name', 'seller:id,name'])
            ->latest()
            ->paginate(15);

        return response()->json(['success' => true, 'data' => $orders]);
    }

    public function orderShow(AcOrder $order, Request $request)
    {
        if ($order->buyer_id !== $request->user()->id && $order->seller_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        return response()->json([
            'success' => true,
            'data' => $order->load(['product', 'buyer:id,name', 'seller:id,name', 'review']),
        ]);
    }

    /**
     * Confirmer une commande (vendeur). Génère la transaction de commission.
     */
    public function orderConfirm(AcOrder $order, Request $request)
    {
        if ($order->seller_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        if ($order->status !== 'pending') {
            return response()->json(['success' => false, 'message' => 'Commande déjà traitée.'], 422);
        }

        $order->update(['status' => 'confirmed']);

        // Créer transaction commission
        AcTransaction::create([
            'reference' => AcTransaction::generateReference(),
            'user_id' => $order->seller_id,
            'order_id' => $order->id,
            'type' => 'commission',
            'amount' => $order->commission_amount,
            'currency' => $order->currency,
            'description' => "Commission {$order->commission_rate}% sur commande #{$order->reference}",
        ]);

        // Réduire stock
        $product = $order->product;
        $product->decrement('quantity_available', $order->quantity);
        if ($product->quantity_available <= 0) {
            $product->update(['status' => 'sold']);
        }

        // Notifier l'acheteur
        AcNotification::create([
            'user_id' => $order->buyer_id,
            'type' => 'order',
            'title' => 'Commande confirmée',
            'message' => "Votre commande #{$order->reference} a été confirmée par le vendeur.",
            'data' => ['order_id' => $order->id],
        ]);

        return response()->json(['success' => true, 'data' => $order->fresh()]);
    }

    public function orderUpdateStatus(AcOrder $order, Request $request)
    {
        $request->validate(['status' => 'required|in:shipped,delivered,cancelled']);

        if ($order->seller_id !== $request->user()->id && !$request->user()->is_admin) {
            return response()->json(['success' => false, 'message' => 'Non autorisé.'], 403);
        }

        $order->update(['status' => $request->status]);

        AcNotification::create([
            'user_id' => $order->buyer_id,
            'type' => 'order',
            'title' => "Commande {$request->status}",
            'message' => "Votre commande #{$order->reference} est maintenant : {$request->status}",
            'data' => ['order_id' => $order->id],
        ]);

        return response()->json(['success' => true, 'data' => $order->fresh()]);
    }

    // ===== AVIS =====

    public function reviewStore(Request $request, AcOrder $order)
    {
        if ($order->buyer_id !== $request->user()->id) {
            return response()->json(['success' => false, 'message' => 'Seul l\'acheteur peut laisser un avis.'], 403);
        }

        if ($order->status !== 'delivered') {
            return response()->json(['success' => false, 'message' => 'Commande non livrée.'], 422);
        }

        $validated = $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string|max:1000',
        ]);

        $review = AcReview::updateOrCreate(
            ['user_id' => $request->user()->id, 'order_id' => $order->id],
            array_merge($validated, ['seller_id' => $order->seller_id])
        );

        return response()->json(['success' => true, 'data' => $review], 201);
    }

    public function sellerReviews(int $sellerId)
    {
        $reviews = AcReview::where('seller_id', $sellerId)
            ->with('user:id,name')
            ->latest()
            ->paginate(10);

        $avg = AcReview::where('seller_id', $sellerId)->avg('rating');

        return response()->json([
            'success' => true,
            'data' => ['reviews' => $reviews, 'average_rating' => round($avg, 1)],
        ]);
    }
}
