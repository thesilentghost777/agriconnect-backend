<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_weather_subscriptions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('zone_id')->constrained('ac_weather_zones')->cascadeOnDelete();
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->unique(['user_id', 'zone_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_weather_subscriptions');
    }
};
