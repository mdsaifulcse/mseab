<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\ResetPasswordResource;
use App\Http\Resources\UserResource;
use App\User;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponseTrait;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper,Carbon\Carbon,Auth;
class ResetPasswordApiController extends Controller
{
    use ApiResponseTrait;


    public function resetUserPassword(Request $request)
    {

        $validateFields=[
            //'current_password' => ['required'],
            'new_password' => 'required|min:6',
            'new_confirm_password' => 'same:new_password',
        ];

        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try{


           $userData=User::where(['phone'=>$request->phone])->first();

            if (empty($userData))
            {
                return $this->respondWithError('No user data found ! ',[],Response::HTTP_NOT_FOUND);
            }

//            $validDate=$userData->otp_validity;
//            $validDate=New Carbon($validDate);
//
//            if ($userData->otp_status==User::NOT_VERIFIED || !$validDate->gt(Carbon::now()))
//            {
//                return $this->respondWithError('You have entered invalid Otp','',Response::HTTP_CONFLICT);
//            }


//            if (Hash::check($request->current_password, auth()->user()->password)==false)
//            {
//                return $this->respondWithError('Current password does not match','',Response::HTTP_CONFLICT);
//            }


            $userData->update(['password'=> Hash::make($request->new_password)]);

            return $this->respondWithSuccess('Reset Password','Your Password Successfully Change',Response::HTTP_OK,'');

        }catch (\Exception $e)
        {
            $bug=$e->errorInfo[1];
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }



    public function verifyResetPasswordOtp(Request $request)
    {

        $validateFields=[
            'phone'=> "required|max:11|min:11|regex:/(01)[0-9]{9}/",
            'password_reset_otp'=> "required",
        ];

        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,422);
        }



        try{

            //date_default_timezone_set('Asia/Dhaka');

            $userOtpData=User::with('userInfo')->where(['phone'=>$request->phone,'password_reset_otp'=>$request->password_reset_otp])->first();

            if (empty($userOtpData))
            {
                return $this->respondWithError('Your given otp does not match !','',Response::HTTP_UNPROCESSABLE_ENTITY);
            }



            $validDate=$userOtpData->otp_validity;
            $validDate=New Carbon($validDate);
            //return date('d-M-Y h:i:s',strtotime(Carbon::now()));

            if ( $validDate->lt(Carbon::now()))
            {
                return $this->respondWithError('Your given otp has been expired','',Response::HTTP_UNAUTHORIZED);

            }else{

                $userOtpData->update(['password_reset_otp'=>'','otp_status'=>User::VERIFIED]);

                return $this->respondWithSuccess('Given Reset Password Otp Verified',New ResetPasswordResource($userOtpData),Response::HTTP_OK,'');
            }

            $bug=0;

        }catch (\Exception $e)
        {
            $bug=$e->errorInfo[1];
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    public function getResetPasswordOptOnPhoneNumber(Request $request)
    {

        $validateFields=[
            'phone'=> "required|max:11|min:11|regex:/(01)[0-9]{9}/",
        ];

        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,422);
        }



        try{


            $userData=User::with('userInfo')->where('phone',$request->phone)->first();

            if (empty($userData))
            {
                return $this->respondWithError('No User Data Found !','',Response::HTTP_NOT_FOUND);
                //$userOtp['validity']=date('',strtotime($userOtpData->validity));

            }
            else
            {

            $digits = 4;
            $newOtp = rand(pow(10, $digits-1), pow(10, $digits)-1);

            $userOtp['password_reset_otp'] = $newOtp;
            $userOtp['phone'] = $request->phone;
            $otpValidity=Carbon::now()->addMinutes(10);

            $userData->update([
                    'password_reset_otp'=>$newOtp,
                    'otp_validity'=>$otpValidity,
                    'otp_status'=>User::NOT_VERIFIED
                ]);

                $userData['otp_validity']=date('m-d-Y h:i a',strtotime($otpValidity));
            }

            return $this->respondWithSuccess('New Otp',New ResetPasswordResource($userData),Response::HTTP_CREATED,'');

        }catch (\Exception $e)
        {

            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
