<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_marketplace_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('crop_id')->nullable()->constrained('ac_crops')->nullOnDelete();
            $table->string('title');
            $table->text('description')->nullable();
            $table->decimal('price', 12, 2);
            $table->string('currency', 5)->default('XAF');
            $table->string('unit')->default('kg');
            $table->decimal('quantity_available', 12, 2);
            $table->string('region');
            $table->string('country');
            $table->json('images')->nullable();
            $table->enum('status', ['active', 'sold', 'expired', 'draft'])->default('active');
            $table->timestamps();

            $table->index(['status', 'region']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_marketplace_products');
    }
};
