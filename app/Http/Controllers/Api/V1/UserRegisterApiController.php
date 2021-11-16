<?php

namespace App\Http\Controllers\Api\V1;

use App\FeeCollection;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserCollection;
use App\Http\Resources\UserFullProfileResource;
use App\Http\Resources\UserResource;

use App\User;
use App\UserInfo;
use App\UserOtp;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponseTrait;
use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper;

class UserRegisterApiController extends Controller
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
        $this->middleware('auth:api' ,['except' => ['store','destroy']]);
    }


    public function index()
    {
         $users=User::with('userProfile')->orderBy('id','DESC')->paginate(50);

        return $this->respondWithSuccess('User Data Retried',UserCollection::collection($users),Response::HTTP_OK);

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
    public function store(Request $request)
    {


//        $userOtpData=UserOtp::where(['phone'=>$request->phone])->first();
//
//        if (empty($userOtpData))
//        {
//            return $this->noDataFoundException('First Verify Your Phone Number  !');
//        }
//
//
//
//        $validData=$userOtpData->validity;
//        $validData=New Carbon($validData);
//
//        if ($userOtpData->status==UserOtp::NOT_VERIFIED || !$validData->gt(Carbon::now()))
//        {
//            return $this->respondWithError('Your given otp has been expired Or Not verified','',Response::HTTP_UNAUTHORIZED);
//        }



        $validateFields=[
            'email'  => "required|unique:users|email|max:100",
            'phone'  => "required|unique:users|max:11|min:11|regex:/(01)[0-9]{9}/",
            'nid'  => "required|unique:user_info|max:25",
            'photo' => 'required|image|mimes:jpg,jpeg,bmp,png,webp,gif|max:5120',
            'blood_group' => 'required|in:'.UserInfo::BLOOD_GROUP,

            'father_name' => 'required|max:50',
            'mother_name' => 'required|max:50',
            'number_of_child' => 'nullable|max:50',
            'present_address' => 'nullable|max:220',
            'permanent_address' => 'required|max:200',
            'business_name' => 'required|max:255',
            'business_address' => 'required|max:255',

            'nominee_name' => 'required|max:100',
            'nominee_photo' => 'required|image|mimes:jpg,jpeg,bmp,png,webp,gif|max:5120',
            'nominee_phone' => 'required|max:11|min:11|regex:/(01)[0-9]{9}/',
            'nominee_nid' => 'required|max:25',
            'relation_with_nominee' => 'required|max:100',
            'nominee_address' => 'required|max:200',
            'password' => 'required|min:6|confirmed',
        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }


        DB::beginTransaction();
        try{

            $user= User::create([
                'name'=>$request->name,
                'username'=>$request->phone,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'password'=>bcrypt($request->password),
            ]);

            $this->storeUseInfo($request,$user->id);

            $token=$this->login();
            $user=$user->with('userInfo')->where('id',$user->id)->first();

            DB::commit();

            return $this->respondWithSuccess('Data Successfully Saved',new UserResource($user),Response::HTTP_CREATED,$token);
        }catch (\Exception $e)
        {
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }



    public function storeUseInfo($request,$userId)
    {
        $photo='';
        $nomineePhoto='';

        if ($request->hasFile('photo')) { $photo=\MyHelper::photoUpload($request->file('photo'),'images/user-images',300);}

        if ($request->hasFile('nominee_photo')) { $nomineePhoto=\MyHelper::photoUpload($request->file('nominee_photo'),'images/nominee-images',300);}

        $userInfoInput=$request->all();
        $userInfoInput['user_id']=$userId;
        $userInfoInput['photo']=$photo;
        $userInfoInput['nominee_photo']=$nomineePhoto;
        UserInfo::create($userInfoInput);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user=User::with('userProfile')->where('users.id',$id)->first();
        if (empty($user)){
            return $this->noDataFoundException('NO User data found !');
        }

        return $this->respondWithSuccess('Show User Data',new UserResource($user),Response::HTTP_OK);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        $user=User::findOrFail(auth()->user()->id);

        if (empty($user))
        {
            return $this->respondWithError('NO User data found !',[],Response::HTTP_NOT_FOUND);
        }

        $validateFields=[
            'email'  => "required|max:100|unique:users,email,".auth()->user()->id,
            'present_address' => 'nullable|max:220',
            'photo' => 'image|mimes:jpg,jpeg,bmp,png,webp,gif|max:5120',
        ];

        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,422);
        }

        DB::beginTransaction();
        try{

            $input=$request->all();
            $user->update(['email'=>$request->email]);

            if (isset($request->present_address) ||  isset($request->photo)){
                $this->updateUseProfile($request,auth()->user()->id);
            }

            DB::commit();

            return $this->respondWithSuccess('Data Successfully Update',new UserResource($user),Response::HTTP_OK);

        }catch (\Exception $e){
            DB::rollback();
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    public function updateUseProfile($request,$userId){
        $userProfile=UserInfo::where('user_id',$userId)->first();
        $photoPath='';

        if ($request->hasFile('photo'))
        {
              $photoPath=\MyHelper::photoUpload($request->file('photo'),'images/user-images',300);

            if (!empty($userProfile) && file_exists($userProfile->photo)){
                unlink($userProfile->photo);
            }
        }

        $profileInput=$request->all();
        $profileInput['user_id']=$userId;

        if ($photoPath!='')
        {
            $profileInput['photo']=$photoPath;
        }
        if (empty($userProfile))
        {
            UserInfo::create($profileInput);
        }else {
            $userProfile->update($profileInput);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

         $user=User::find($id);
        if (empty($user)){
            return $this->noDataFoundException('NO User data found !');
        }

        DB::beginTransaction();
        try{

            $userInfo=UserInfo::where('user_id',$id)->first();

            if (!empty($userInfo) && file_exists($userInfo->photo)){
                unlink($userInfo->photo);
            }

            if (!empty($userInfo) && file_exists($userInfo->nominee_photo)){
                unlink($userInfo->nominee_photo);
            }

            if (!empty($userInfo)){
                $userInfo->delete();
            }

            FeeCollection::where('user_id',$id)->delete();


            $user->delete();

            DB::commit();
            return $this->respondWithSuccess('User delete successfully',[],Response::HTTP_OK);
        }catch (\Exception $e){
            DB::rollback();

            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }



    public function getMyProfileData(){

        try{
            $user=User::with('userInfo')->findOrFail(auth()->user()->id);

            return $this->respondWithSuccess('My Profile Data',new UserResource($user),Response::HTTP_OK);
        }catch (\Exception $e){

            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }



    }

    public function getMyFullProfileData(){

        try{
            $user=User::with('userInfo')->findOrFail(auth()->user()->id);

            return $this->respondWithSuccess('My Full Profile Data',new UserFullProfileResource($user),Response::HTTP_OK);
        }catch (\Exception $e){

            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }


}
