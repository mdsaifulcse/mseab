<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserInfo extends Model
{
    const BLOOD_GROUP='O-,O+,A-,A+,B-,B+,AB-,AB+';
    protected $table = 'user_info';
    protected $softDelete = true;

    protected $fillable =['user_id',
       // 'first_name','last_name',
        'photo','nid','blood_group','father_name','mother_name','number_of_child','present_address','permanent_address','business_name','business_address','nominee_name','nominee_photo','nominee_phone','nominee_nid','relation_with_nominee','nominee_address'];

}
