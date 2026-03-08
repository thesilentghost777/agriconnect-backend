<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_payments', function (Blueprint $table) {
            $table->id();
            $table->string('external_id')->unique(); // UUID interne
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('subscription_id')->nullable()->constrained('ac_subscriptions')->nullOnDelete();
            $table->enum('provider', ['stripe', 'freemopay']);
            $table->string('provider_reference')->nullable(); // ref Stripe ou Freemopay
            $table->decimal('amount', 14, 2);
            $table->string('currency', 5)->default('XAF');
            $table->enum('status', ['pending', 'paid', 'failed', 'refunded'])->default('pending');
            $table->string('payer_phone')->nullable();
            $table->text('description')->nullable();
            $table->json('metadata')->nullable();
            $table->timestamps();

            $table->index(['user_id', 'status']);
            $table->index('provider_reference');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_payments');
    }
};
