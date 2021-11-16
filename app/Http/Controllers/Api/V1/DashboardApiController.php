<?php

namespace App\Http\Controllers\Api\V1;

use App\FeeCollection;
use App\Http\Controllers\Controller;
use App\Http\Resources\MyPaymentHistoryCollection;
use App\Http\Traits\ApiResponseTrait;
use Carbon\Carbon;
use Dompdf\Exception;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper;

class DashboardApiController extends Controller
{
    use ApiResponseTrait;

    protected $dailyFeeAmount=0;
    protected $collectionPeriodDay=0;

    public function __construct()
    {
        $this->middleware('auth:api');

        $this->dailyFeeAmount=config('app.fee');
        $this->collectionPeriodDay=config('app.collection_period');
    }


    public function getPaymentDataForDashboard()
    {

        try{
            $userTotalPaidAmount=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->sum('fee_amount');

            $userTotalDueAmount=0;
            $nextDueDate=date('d M Y');

            $userLastCompletePayment=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->orderBy('id','DESC')->first();

            if (!empty($userLastCompletePayment))
            {

                $lastPaymentDateTo=New Carbon($userLastCompletePayment->payment_date_to);

                if (Carbon::now()->gt($lastPaymentDateTo))
                {

                    $dueWeeks=Carbon::parse($userLastCompletePayment->payment_date_to)->diffInWeeks(Carbon::now()->endOfWeek());;
                    $userTotalDueAmount=$dueWeeks*($this->dailyFeeAmount*$this->collectionPeriodDay);
                }
                $nextDueDate=Carbon::parse($userLastCompletePayment->payment_date_to)->addDay(1)->startOfWeek();
            }


            $myPaymentInfo['total_paid']=$userTotalPaidAmount;
            $myPaymentInfo['total_due']=$userTotalDueAmount;
            $myPaymentInfo['next_due_date']=date('d M Y',strtotime($nextDueDate));

            return $this->respondWithSuccess('My Payment Info',$myPaymentInfo,Response::HTTP_OK);
        }catch (\Exception $e)
        {

            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }


    }

    public function getMyAllPaymentData()
    {
        try{

            $userAllPayments=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->orderBy('id','DESC')->paginate(15);

            return $this->respondWithSuccess('My payment history',MyPaymentHistoryCollection::collection($userAllPayments) ,Response::HTTP_OK);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


}
