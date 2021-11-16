<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
    use SoftDeletes;
    const PUBLISHED='Published';
    const UNPUBLISHED='Unpublished';

    protected $table = 'posts';
    protected $fillable = ['user_id','title','description','status','photo'];

 public function user()
 {
    return $this->belongsTo(User::class,'user_id','id');
 }

 public function reacts()
 {
     return $this->hasMany(PostReact::class,'post_id','id')->whereIn('react',[PostReact::LIKE,PostReact::DISLIKE]);
 }

 public function comments()
 {
     return $this->hasMany(PostComment::class,'post_id','id');
 }

}
