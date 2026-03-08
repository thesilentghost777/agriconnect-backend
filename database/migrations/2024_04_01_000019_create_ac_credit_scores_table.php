<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_credit_scores', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->integer('score'); // 0-100
            $table->integer('anciennete_points')->default(0);
            $table->integer('transactions_points')->default(0);
            $table->integer('connexions_points')->default(0);
            $table->integer('plan_points')->default(0);
            $table->json('breakdown')->nullable();
            $table->timestamps();

            $table->index(['user_id', 'created_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_credit_scores');
    }
};
