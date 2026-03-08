<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_orders', function (Blueprint $table) {
            $table->id();
            $table->string('reference')->unique();
            $table->foreignId('buyer_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('seller_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('product_id')->constrained('ac_marketplace_products')->cascadeOnDelete();
            $table->decimal('quantity', 12, 2);
            $table->decimal('unit_price', 12, 2);
            $table->decimal('total_amount', 14, 2);
            $table->decimal('commission_rate', 5, 2)->default(0);
            $table->decimal('commission_amount', 12, 2)->default(0);
            $table->string('currency', 5)->default('XAF');
            $table->enum('status', ['pending', 'confirmed', 'shipped', 'delivered', 'cancelled', 'disputed'])->default('pending');
            $table->text('notes')->nullable();
            $table->timestamps();

            $table->index(['buyer_id', 'status']);
            $table->index(['seller_id', 'status']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_orders');
    }
};
