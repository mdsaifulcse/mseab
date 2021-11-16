<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_info', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
//            $table->string('first_name');
//            $table->string('last_name');
            $table->string('photo',255)->nullable();
            $table->string('nid')->nullable();
            $table->string('blood_group')->nullable();

            $table->string('father_name')->nullable();
            $table->string('mother_name')->nullable();
            $table->integer('number_of_child',false,10)->nullable();
            $table->string('present_address',255)->nullable();
            $table->string('permanent_address',255)->nullable();
            $table->string('business_name',255)->nullable();
            $table->string('business_address',255)->nullable();

            $table->string('nominee_name')->nullable();
            $table->string('nominee_photo',255)->nullable();
            $table->string('nominee_phone')->nullable();
            $table->string('nominee_nid')->nullable();
            $table->string('relation_with_nominee')->nullable();
            $table->string('nominee_address',255)->nullable();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->softDeletes();
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
        Schema::dropIfExists('user_infos');
    }
}
