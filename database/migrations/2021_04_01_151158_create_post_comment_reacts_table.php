<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostCommentReactsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('post_comment_reacts', function (Blueprint $table) {
            $table->id();


            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('comment_id')->nullable();
            $table->string('react')->default(\App\PostCommentReact::LIKE);
            $table->string('status')->default(\App\PostCommentReact::PUBLISHED);

            $table->softDeletes();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('comment_id')->references('id')->on('post_comments')->onDelete('cascade');

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
        Schema::table('post_comment_reacts',function (Blueprint $table){
            $table->dropForeign(['user_id']);
            $table->dropForeign(['comment_id']);
        });

        Schema::dropIfExists('post_comment_reacts');
    }
}
