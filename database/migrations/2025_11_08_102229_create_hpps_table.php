<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('hpps', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['Pembelian', 'Penjualan'])->index();
            $table->string('description')->nullable();
            $table->date('date')->index();
            $table->integer('qty'); 
            $table->decimal('price', 15, 4)->nullable(); 
            $table->decimal('cost', 15, 4)->nullable(); 
            $table->decimal('total_cost', 18, 4)->nullable();
            $table->bigInteger('qty_balance')->nullable();
            $table->decimal('value_balance', 18, 4)->nullable();
            $table->decimal('hpp', 15, 6)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('hpps');
    }
};
