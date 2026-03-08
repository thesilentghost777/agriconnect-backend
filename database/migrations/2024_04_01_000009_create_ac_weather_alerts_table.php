<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_weather_alerts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('zone_id')->constrained('ac_weather_zones')->cascadeOnDelete();
            $table->enum('type', ['weather', 'pest', 'drought', 'flood', 'storm']);
            $table->string('severity')->default('medium'); // low, medium, high, critical
            $table->string('title');
            $table->text('description');
            $table->json('metadata')->nullable();
            $table->timestamp('starts_at');
            $table->timestamp('ends_at')->nullable();
            $table->timestamps();

            $table->index(['zone_id', 'type']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_weather_alerts');
    }
};
