<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Faq extends Model
{
    protected $table = 'faqs';
    protected $fillable = ['title','lang','status','is_open','description'];
}
