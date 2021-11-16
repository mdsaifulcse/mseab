<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\SupportAndReport;
use Illuminate\Http\Request;
use App\Http\Traits\ApiResponseTrait;
use Symfony\Component\HttpFoundation\Response;
use DB,MyHelper;

class SupportAndReportController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
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
    public function store(Request $request)
    {

        $validateFields=[
            'title'  => "required|max:120",
            'description'  => "required|max:500",
            'support_type'  => "max:50",
            'photo' => 'nullable|image|mimes:jpg,jpeg,bmp,png,webp,gif|max:3050',

        ];


        $validateResponse=$this->respondWithValidation($request->all(),$validateFields);

        if ($validateResponse!='pass')
        {
            return $this->respondWithError('Validation Fail',$validateResponse,Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try{


            $photo='';
            if ($request->hasFile('photo')) { $photo=\MyHelper::photoUpload($request->file('photo'),'images/support-report',400);}

            $requestFrom=SupportAndReport::REPORT_ISSUE;

            if ((isset($request->support_type) && !empty($request->support_type)))
            {
                $requestFrom=SupportAndReport::CONTACT_SUPPORT;
            }

            $supportReport= SupportAndReport::create([
                'user_id'=>auth()->user()->id,
                'title'=>$request->title,
                'description'=>$request->description,
                'email'=>$request->email,
                'support_type'=>$request->support_type,
                'photo'=>$photo,
                'request_from'=>$requestFrom,
            ]);

            return $this->respondWithSuccess('Your Request Successfully Send',$supportReport,Response::HTTP_CREATED);
        }catch (\Exception $e)
        {
            return $this->respondWithError('Something Went Wrong !',$e->getMessage(),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SupportAndReport  $supportAndReport
     * @return \Illuminate\Http\Response
     */
    public function show(SupportAndReport $supportAndReport)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SupportAndReport  $supportAndReport
     * @return \Illuminate\Http\Response
     */
    public function edit(SupportAndReport $supportAndReport)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SupportAndReport  $supportAndReport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SupportAndReport $supportAndReport)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SupportAndReport  $supportAndReport
     * @return \Illuminate\Http\Response
     */
    public function destroy(SupportAndReport $supportAndReport)
    {
        //
    }
}
