<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_price_alerts', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('crop_id')->constrained('ac_crops')->cascadeOnDelete();
            $table->string('region');
            $table->enum('condition', ['above', 'below']);
            $table->decimal('threshold', 12, 2);
            $table->string('currency', 5)->default('XAF');
            $table->boolean('is_active')->default(true);
            $table->timestamp('last_triggered_at')->nullable();
            $table->timestamps();

            $table->index(['crop_id', 'region', 'is_active']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_price_alerts');
    }
};
