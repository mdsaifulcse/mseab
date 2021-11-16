<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SupportAndReport extends Model
{
    use SoftDeletes;
    const CONTACT_SUPPORT='Contact_Support_Form';

    const REPORT_ISSUE='Report_an_ISSUE_Form';

    protected $table='support_and_reports';
    protected $fillable=['user_id','title','description','support_type','photo','request_from'];
}
