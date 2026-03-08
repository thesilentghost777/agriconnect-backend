<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_transactions', function (Blueprint $table) {
            $table->id();
            $table->string('reference')->unique();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->foreignId('order_id')->nullable()->constrained('ac_orders')->nullOnDelete();
            $table->enum('type', ['commission', 'payment', 'refund', 'subscription']);
            $table->decimal('amount', 14, 2);
            $table->string('currency', 5)->default('XAF');
            $table->text('description')->nullable();
            $table->json('metadata')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_transactions');
    }
};
