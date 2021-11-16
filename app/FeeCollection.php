<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FeeCollection extends Model
{
    use SoftDeletes;

    const PENDING='Pending';
    const COMPLETE='Complete';

    const REGULAR='Regular';
    const ADVANCE='Advance';
    const DUE='Due';

    protected $table = 'fee_collections';
    protected $fillable = ['user_id','fee_amount','transaction_id','payment_gateway','track','payment_date_from','payment_date_to','payment_date','payment_type','week_number','status','currency'];

    public function feeUser()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

}
