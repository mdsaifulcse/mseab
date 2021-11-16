<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Notification extends Model
{
    use SoftDeletes;
    const SHOP='Shop';
    const FEE='Fees';
    const NOTICE='Notice';
    const COMMUNITY='Community';

    const READ='Read';
    const UNREAD='Unread';

    protected $table = 'notifications';
    protected $fillable = ['user_id','title','description','type','read_status','photo'];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
}
