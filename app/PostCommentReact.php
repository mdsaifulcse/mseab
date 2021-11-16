<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PostCommentReact extends Model
{

    use SoftDeletes;
    const PUBLISHED='Published';
    const UNPUBLISHED='Unpublished';

    const LIKE='Like';
    const DISLIKE='Dislike';
    const UNLIKE='Unlike';

    const REPORT='Report';

    protected $table = 'post_comment_reacts';
    protected $fillable = ['user_id','comment_id','react','status'];
}
