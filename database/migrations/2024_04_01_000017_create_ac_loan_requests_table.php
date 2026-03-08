<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_loan_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('ac_users')->cascadeOnDelete();
            $table->decimal('amount', 14, 2);
            $table->string('currency', 5)->default('XAF');
            $table->string('purpose');
            $table->text('description')->nullable();
            $table->integer('duration_months')->default(12);
            $table->enum('status', ['pending', 'approved', 'rejected', 'disbursed', 'repaid'])->default('pending');
            $table->text('rejection_reason')->nullable();
            $table->integer('credit_score_at_request')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_loan_requests');
    }
};
