<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_chatbot_logs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->text('message');
            $table->text('response')->nullable();
            $table->string('langue', 10)->default('fr');
            $table->integer('response_time_ms')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_chatbot_logs');
    }
};
