<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PostComment extends Model
{
    use SoftDeletes;
    const PUBLISHED='Published';
    const UNPUBLISHED='Unpublished';

    protected $table = 'post_comments';
    protected $fillable = ['user_id','post_id','comments','status'];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function commentReact()
    {
        return $this->hasMany(PostCommentReact::class,'comment_id','id')->whereIn('react',[PostCommentReact::LIKE,PostCommentReact::DISLIKE]);
    }
}
