<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserOtp extends Model
{
    const VERIFIED='Verified';
    const NOT_VERIFIED='Not Verified';

    protected $table = 'user_otps';
    protected $softDelete = true;

    protected $fillable =['phone','otp','validity','status'];
}
