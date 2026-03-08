<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ac_crops', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('name_local')->nullable();
            $table->string('category')->nullable(); // cereale, fruit, legume, tubercule, oleagineux
            $table->string('icon')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ac_crops');
    }
};
