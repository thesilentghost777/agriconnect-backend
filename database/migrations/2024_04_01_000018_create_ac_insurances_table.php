<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_insurances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->string('type'); // crop, livestock, equipment
            $table->decimal('coverage_amount', 14, 2);
            $table->decimal('premium', 12, 2);
            $table->string('currency', 5)->default('XAF');
            $table->enum('status', ['active', 'expired', 'claimed', 'cancelled'])->default('active');
            $table->date('starts_at');
            $table->date('expires_at');
            $table->text('details')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_insurances');
    }
};
