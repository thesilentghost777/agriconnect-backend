<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_market_prices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('crop_id')->constrained('ac_crops')->cascadeOnDelete();
            $table->string('region');
            $table->string('country');
            $table->string('market_name')->nullable();
            $table->decimal('price', 12, 2);
            $table->string('currency', 5)->default('XAF');
            $table->string('unit')->default('kg'); // kg, tonne, sac
            $table->date('recorded_at');
            $table->string('source')->nullable();
            $table->timestamps();

            $table->index(['crop_id', 'region', 'recorded_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_market_prices');
    }
};
