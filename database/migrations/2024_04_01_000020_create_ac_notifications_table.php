<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_notifications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->enum('type', ['alert', 'price', 'weather', 'community', 'order', 'system']);
            $table->string('title');
            $table->text('message');
            $table->json('data')->nullable();
            $table->boolean('is_read')->default(false);
            $table->boolean('email_sent')->default(false);
            $table->timestamps();

            $table->index(['user_id', 'is_read']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_notifications');
    }
};
