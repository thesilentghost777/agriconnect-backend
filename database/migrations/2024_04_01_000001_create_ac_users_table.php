<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password')->nullable();
            $table->string('google_id')->nullable()->unique();
            $table->string('avatar')->nullable();
            $table->string('phone')->nullable();
            $table->string('region')->nullable();
            $table->string('country')->nullable();
            $table->decimal('superficie', 10, 2)->nullable();
            $table->json('cultures_principales')->nullable();
            $table->string('langue_preferee', 10)->default('fr');
            $table->boolean('is_admin')->default(false);
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_users');
    }
};
