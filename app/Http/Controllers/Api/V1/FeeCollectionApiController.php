<?php

namespace App\Http\Controllers\Api\V1;

use App\FeeCollection;
use App\Http\Controllers\Controller;
use App\Http\Resources\FeeCollectionResource;
use App\Http\Traits\ApiResponseTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use League\Flysystem\Config;
use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper;

class FeeCollectionApiController extends Controller
{
    use ApiResponseTrait;

    protected $dailyFeeAmount=0;
    protected $collectionPeriodDay=0;
    protected $paymentStatus=FeeCollection::PENDING;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->dailyFeeAmount=config('app.fee');
        $this->collectionPeriodDay=config('app.collection_period');
    }

    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeRegularPayment(Request $request)
    {

        $minPayableAmount=$this->dailyFeeAmount*$this->collectionPeriodDay;
        $validateFields=[
            'fee_amount'  => "required|numeric|max:999999|min:$minPayableAmount",
            //'transaction_id'  => "required|unique:fee_collections|max:255",
            //'payment_gateway'  => "required|max:100",
            //'track' => 'required|max:255',
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }



        DB::beginTransaction();
        try{

            $userLastCompletePayment=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->orderBy('id','DESC')->first();


            if (empty($userLastCompletePayment))
            {
                $paymentDateFrom=Carbon::now()->startOfWeek();
                $paymentDateTo=Carbon::now()->endOfWeek();

            }else{
                $lastPaymentDateTo= New Carbon($userLastCompletePayment->payment_date_to);
                $paymentDateFrom=$lastPaymentDateTo->addDay(1)->startOfWeek();

                $paymentDateTo=Carbon::now()->endOfWeek();
            }


            $feeCollection= FeeCollection::create([
                'user_id'=>auth()->user()->id,
                'fee_amount'=>$request->fee_amount,
                //'transaction_id'=>$request->transaction_id,
                //'payment_gateway'=>$request->payment_gateway,
                //'track'=>$request->track,
                'payment_date'=>Carbon::now(),
                'payment_date_from'=>$paymentDateFrom,
                'payment_date_to'=>$paymentDateTo,
                'payment_type'=>FeeCollection::REGULAR,
                'week_number'=>Carbon::now()->weekOfYear,
                'status'=>$this->paymentStatus
            ]);

            DB::commit();

            return $this->respondWithSuccess('Data Successfully Saved',New FeeCollectionResource($feeCollection),Response::HTTP_CREATED);

        }catch (\Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    public function storeAdvancePayment(Request $request)
    {

        $minPayableAmount=$this->dailyFeeAmount*$this->collectionPeriodDay;
        $validateFields=[
                            'fee_amount'  => "required|numeric|max:999999|min:$minPayableAmount",
//                            'transaction_id'  => "required|unique:fee_collections|max:255",
//                            'payment_gateway'  => "required|max:100",
                            'number_of_week' => 'required|numeric|max:52',
                        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $payAmount=$minPayableAmount*$request->number_of_week;

        if ($payAmount!=$request->fee_amount)
        {
            return $this->respondWithError('Amount mismatch',['fee_amount'=>'Amount must be '.$payAmount],Response::HTTP_UNPROCESSABLE_ENTITY);
        }


        DB::beginTransaction();
        try{
            $userLastCompletePayment=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->orderBy('id','DESC')->first();


            if (empty($userLastCompletePayment))
            {
                $paymentDateFrom=Carbon::now()->startOfWeek();
                $advancePaymentDateTo=Carbon::now()->endOfWeek();
                //$advancePaymentDateTo=Carbon::now()->addDay($this->collectionPeriodDay*$request->number_of_week)->endOfWeek();

                $paymentType=FeeCollection::REGULAR;

            }else{
                $lastPaymentDateTo= New Carbon($userLastCompletePayment->payment_date_to);
                $paymentDateFrom=$lastPaymentDateTo->addDay(1)->startOfWeek();

                $lastPaymentDateTo=New Carbon($userLastCompletePayment->payment_date_to);
                $advancePaymentDateTo=$lastPaymentDateTo->addDay($this->collectionPeriodDay*$request->number_of_week)->endOfWeek();

                $lastPaymentDateTo= New Carbon($userLastCompletePayment->payment_date_to);
                if ($advancePaymentDateTo->gt($lastPaymentDateTo))
                {
                    $paymentType=FeeCollection::ADVANCE;
                }
            }



            $feeCollection= FeeCollection::create([
                'user_id'=>auth()->user()->id,
                'fee_amount'=>$request->fee_amount,
//                'transaction_id'=>$request->transaction_id,
//                'payment_gateway'=>$request->payment_gateway,
//                'track'=>$request->track,
                'payment_date'=>Carbon::now(),
                'payment_date_from'=>$paymentDateFrom,
                'payment_date_to'=>$advancePaymentDateTo,
                'payment_type'=>$paymentType,
                'week_number'=>Carbon::now()->weekOfYear+$request->number_of_week,
                'status'=>$this->paymentStatus//FeeCollection::PENDING,
            ]);


            DB::commit();

            return $this->respondWithSuccess('Data Successfully Saved',New FeeCollectionResource($feeCollection),Response::HTTP_CREATED);

        }catch (\Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }


    }



    /**
     * Display the specified resource.
     *
     * @param  \App\FeeCollection  $feeCollection
     * @return \Illuminate\Http\Response
     */
    public function calculateCurrentPayAmount()
    {
        try{


            $userLastCompletePayment=FeeCollection::where(['user_id'=>auth()->user()->id,'status'=>FeeCollection::COMPLETE])->orderBy('id','DESC')->first();

            $nowPayableAmount=$this->dailyFeeAmount*$this->collectionPeriodDay;

            if (empty($userLastCompletePayment))
            {
                return $this->respondWithSuccess('Your now payable amount info',
                    [
                        'payable_amount'=>$nowPayableAmount,
                        'payment_period'=>'1 Week',
                        'payment_type'=>FeeCollection::REGULAR
                    ],
                    Response::HTTP_OK);
            }

            if ($this->isAdvancePayment($userLastCompletePayment))
            {
                return $this->respondWithSuccess('Your now payable amount info',
                    [
                        'payable_amount'=>0,
                        'payment_period'=>0,
                        'payment_type'=>FeeCollection::ADVANCE
                    ],
                    Response::HTTP_CONFLICT
                );

            }elseif($this->isDuePayment($userLastCompletePayment)){

                $dueWeeks=Carbon::parse($userLastCompletePayment->payment_date_to)->diffInWeeks(Carbon::now()->endOfWeek());;
                $nowPayableAmount=$dueWeeks*($this->dailyFeeAmount*$this->collectionPeriodDay);

                return $this->respondWithSuccess('Your now payable amount info',
                    [
                        'payable_amount'=>$nowPayableAmount,
                        'payment_period'=>$dueWeeks.' Week (s)',
                        'payment_type'=>FeeCollection::DUE
                    ],
                    Response::HTTP_OK);
            }else{
                return $this->respondWithSuccess('Your now payable amount info',
                    [
                        'payable_amount'=>$nowPayableAmount,
                        'payment_period'=>'1 Week',
                        'payment_type'=>FeeCollection::REGULAR
                    ],
                    Response::HTTP_CONFLICT);
            }


        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    public function isDuePayment($userLastCompletePayment)
    {
        $lastPaymentDateTo=New Carbon($userLastCompletePayment->payment_date_to);

        if ($userLastCompletePayment->status==FeeCollection::COMPLETE && Carbon::now()->gte($lastPaymentDateTo))
        {
            return true;
        }else{
            return false;
        }
    }

    public function isAdvancePayment($userLastCompletePayment)
    {
        $lastPaymentDate=New Carbon($userLastCompletePayment->payment_date_to);

        if ($userLastCompletePayment->status==FeeCollection::COMPLETE && $lastPaymentDate->gt(Carbon::now()->endOfWeek()))
        {
            return true;
        }else{
            return false;
        }
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\FeeCollection  $feeCollection
     * @return \Illuminate\Http\Response
     */
    public function edit(FeeCollection $feeCollection)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\FeeCollection  $feeCollection
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FeeCollection $feeCollection)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\FeeCollection  $feeCollection
     * @return \Illuminate\Http\Response
     */
    public function destroy(FeeCollection $feeCollection)
    {
        //
    }
}
