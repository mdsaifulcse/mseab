<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFeeCollectionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fee_collections', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->float('fee_amount')->default(0);
            $table->string('transaction_id',255)->nullable();
            $table->string('payment_gateway',255)->nullable();
            $table->string('track',255)->nullable();
            $table->timestamp('payment_date_from');
            $table->timestamp('payment_date_to');
            $table->timestamp('payment_date')->nullable();
            $table->string('payment_type',255)->default(\App\FeeCollection::REGULAR);
            $table->tinyInteger('week_number',false,3)->nullable();
            $table->string('status')->default(\App\FeeCollection::PENDING);
            $table->string('currency')->nullable();

            $table->softDeletes();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ask_requests',function (Blueprint $table){
            $table->dropForeign(['user_id']);
        });

        Schema::dropIfExists('fee_collections');
    }
}
