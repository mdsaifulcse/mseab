<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PostReact extends Model
{
    use SoftDeletes;
    const PUBLISHED='Published';
    const UNPUBLISHED='Unpublished';

    const LIKE='Like';
    const DISLIKE='Dislike';
    const UNLIKE='Unlike';

    const REPORT='Report';

    protected $table = 'post_reacts';
    protected $fillable = ['user_id','post_id','react','status'];
}
