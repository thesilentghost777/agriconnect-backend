<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_subscriptions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('plan_id')->constrained('ac_subscription_plans')->cascadeOnDelete();
            $table->enum('status', ['active', 'expired', 'cancelled'])->default('active');
            $table->timestamp('starts_at');
            $table->timestamp('expires_at')->nullable();
            $table->string('payment_id')->nullable();
            $table->timestamps();

            $table->index(['user_id', 'status']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_subscriptions');
    }
};
