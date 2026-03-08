<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_subscription_plans', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique(); // free, premium, business
            $table->string('name');
            $table->decimal('price', 10, 2)->default(0);
            $table->string('currency', 5)->default('EUR');
            $table->json('features')->nullable();
            $table->integer('max_posts_per_week')->default(3);
            $table->boolean('marketplace_access')->default(true);
            $table->boolean('weather_alerts')->default(false);
            $table->boolean('advanced_analytics')->default(false);
            $table->boolean('priority_support')->default(false);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_subscription_plans');
    }
};
