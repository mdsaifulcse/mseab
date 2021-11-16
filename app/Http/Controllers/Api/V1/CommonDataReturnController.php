<?php

namespace App\Http\Controllers\Api\V1;

use App\HeaderSlider;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserCollection;
use App\Http\Resources\UserResource;

use App\Language;
use App\User;
use App\UserInfo;
use App\UserOtp;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponseTrait;
//use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class CommonDataReturnController extends Controller
{
        use ApiResponseTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        //$this->middleware('auth:api');
        //$this->middleware('auth:api' ,['except' => ['store','getBloodGroupList']]);
    }


    protected function getUserProfileByPhone(Request $request)
    {
        try{

            $validateFields=[
                'phone'  => "required|max:11|min:11|regex:/(01)[0-9]{9}/",
            ];

            $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

            if ($validateResponse!='pass')
            {
                return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
            }

           $userData= User::with('userInfo')->where(['phone'=>$request->phone])->first();

            if (empty($userData))
            {
                return $this->respondWithError('No User Data Found !',[],Response::HTTP_NOT_FOUND);
            }

            $useProfile=[
                'id'=>$userData->id,
                'name'=>$userData->name,
                'phone'=>$userData->phone,
                'photo'=>$userData->userInfo?url('/'.$userData->userInfo->photo):'',
            ];

            return $this->respondWithSuccess('User Profile Data ',$useProfile,Response::HTTP_OK);

        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    protected function checkUniqueUserByPhone(Request $request)
    {
        try{

            $validateFields=[
                'phone'  => "required|unique:users|max:11|min:11|regex:/(01)[0-9]{9}/",
            ];

            $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

            if ($validateResponse!='pass')
            {
                return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
            }


            return $this->respondWithSuccess('Phone is unique ',[],Response::HTTP_OK);

        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    protected function checkUniqueUserByEmail(Request $request)
    {
        try{

            $validateFields=[
                'email'  => "required|unique:users|email|max:100",
            ];

            $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

            if ($validateResponse!='pass')
            {
                return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
            }


            return $this->respondWithSuccess('Email is unique ',[],Response::HTTP_OK);

        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    protected function checkUniqueUserByNid(Request $request)
    {
        try{

            $validateFields=[
                'nid'  => "required|unique:user_info|max:25",
            ];

            $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

            if ($validateResponse!='pass')
            {
                return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
            }


            return $this->respondWithSuccess('Nid is unique ',[],Response::HTTP_OK);

        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    public function getBloodGroupList()
    {
         $bloodGroups=explode(',',UserInfo::BLOOD_GROUP);

        return $this->respondWithSuccess('Blood Group List',$bloodGroups,Response::HTTP_OK);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function verifyRegisterOtp(Request $request)
    {

        try{

            $validateFields=[
                'phone'=> "required|max:11|min:11|regex:/(01)[0-9]{9}/",
                'otp'=> "required",
            ];

            $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

            if ($validateResponse!='pass')
            {
                return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
            }



            //date_default_timezone_set('Asia/Dhaka');

            $userOtpData=UserOtp::where(['phone'=>$request->phone,'otp'=>$request->otp])->first();

            if (empty($userOtpData))
            {
                return $this->respondWithError('Your given otp does not match !',[],Response::HTTP_NO_CONTENT);
            }


            $validData=$userOtpData->validity;
            $validData=New Carbon($validData);
            //return date('d-M-Y h:i:s',strtotime(Carbon::now()));

            if ($userOtpData->status==UserOtp::NOT_VERIFIED && $validData->gt(Carbon::now()))
            {
                $userOtpData->update(['otp'=>'','status'=>UserOtp::VERIFIED]);

                return $this->respondWithSuccess('Given Otp Verified','Phone: '.$userOtpData->phone,Response::HTTP_OK,'');

            }else{
                return $this->respondWithError('Your given otp has been expired',[],Response::HTTP_UNAUTHORIZED);
            }


        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    public function getRegisterOtpOnPhoneNumber(Request $request)
    {

        $validateFields=[
            'phone'=> "required|max:11|min:11|regex:/(01)[0-9]{9}/",
        ];

        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }



        DB::beginTransaction();
        try{
            
            $digits = 4;
            $newOtp = rand(pow(10, $digits-1), pow(10, $digits)-1);

            $userOtp['otp'] = $newOtp;
            $userOtp['phone'] = $request->phone;

            $userOtpData=UserOtp::where(['phone'=>$request->phone])->first();

            $otpValidity=Carbon::now()->addMinutes(10);


            $userData=User::with('userInfo')->where('phone',$request->phone)->first();
            if(!empty($userData))
            {
                return $this->alreadyExists('You have already registered',$userData,Response::HTTP_CONFLICT);
            }

            if (empty($userOtpData))
            {
                $userOtpData=UserOtp::create([
                    'phone'=>$request->phone,
                    'otp'=>$newOtp,
                    'validity'=>$otpValidity,
                    'status'=> UserOtp::NOT_VERIFIED,
                ]);
                $userOtp['validity']=date('d-M-Y h:i a',strtotime($userOtpData->validity));

            }elseif($userOtpData->status==UserOtp::NOT_VERIFIED)
            {
                $userOtpData->update([
                    'otp'=>$newOtp,
                    'validity'=>$otpValidity,
                    'status'=> UserOtp::NOT_VERIFIED,
                ]);

                $userOtp['validity']=date('d-M-Y h:i a',strtotime($userOtpData->validity));
            }

            DB::commit();

            return $this->respondWithSuccess('New Otp',$userOtp,Response::HTTP_CREATED,'');

        }catch (Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    public function getSliderList()
    {

        try{
            $homePage= get_static_option('home_page_variant');

            $default_lang = Language::where('default', 1)->first();
            $lang = !empty(session()->get('lang')) ? session()->get('lang') : $default_lang->slug;

            if ($homePage=='01')
            {

                $all_header_slider = HeaderSlider::select('id','title','subtitle','description','btn_01_text','lang','image')->where('lang', $lang)->get();


                if (count($all_header_slider)>0)
                {
                    foreach ($all_header_slider as $key=>$slider)
                    {
                        $image=get_attachment_image_by_id($slider->image);
                        $all_header_slider[$key]['image_url']=$image['img_url'];
                    }
                }else{
                    return $this->respondWithSuccess('Slider data list',[],Response::HTTP_OK);
                }

            }else
            {
                $all_bg_image_fields =  get_static_option('home_page_'.$homePage.'_header_section_bg_image');
                $all_bg_image_fields = !empty($all_bg_image_fields) ? unserialize($all_bg_image_fields) : [''];


                $all_description_fields = get_static_option('home_page_'.$homePage.'_'.$lang.'_header_section_description');
                $all_description_fields = !empty($all_description_fields) ? unserialize($all_description_fields) : [''];


                $all_title_fields = get_static_option('home_page_'.$homePage.'_'.$lang.'_header_section_title');
                $all_title_fields = !empty($all_title_fields) ? unserialize($all_title_fields) : ['world best industry service here'];

                $all_header_slider=[];


                if (count($all_bg_image_fields)>0)
                {
                    foreach ($all_bg_image_fields as $key=>$image_field)
                    {
                        $image=get_attachment_image_by_id($image_field);
                        $all_header_slider[$key]['image_url']=$image['img_url'];

                        $all_header_slider[$key]['title']= isset($all_title_fields[$key]) ? $all_title_fields[$key] : '';
                        $all_header_slider[$key]['description']= isset($all_description_fields[$key]) ? $all_description_fields[$key] : '';

                    }
                }else{
                    return $this->respondWithSuccess('Slider data list',[],Response::HTTP_OK);
                }
            }



            return $this->respondWithSuccess('Slider data list',$all_header_slider,Response::HTTP_OK);

        }catch (\Exception $e)
        {
            $bug=$e->errorInfo[1];
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


    protected function uniqueUserValidation(Request $request,$userID=null)
    {

        $userData='';
        if (strpos($request->field_name, '@') !== false) {

            if ($userID!=''){
                $userData=User::where(['email'=>$request->field_name])->where('id','!=',$userID)->first();
            }else{
                $userData=User::where(['email'=>$request->field_name])->first();
            }

        }else{
            if ($userID!='') {
                $userData = User::where(['mobile' => $request->field_name])->where('id', '!=', $userID)->first();
            }else {
                $userData = User::where(['mobile' => $request->field_name])->first();
            }
        }

        return Response::json(['userData'=>$userData,]);
    }


}
