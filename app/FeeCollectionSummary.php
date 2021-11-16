<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FeeCollectionSummary extends Model
{

    use SoftDeletes;

    protected $table = 'faqs';
    protected $fillable = ['user_id','total_fee'];
}
