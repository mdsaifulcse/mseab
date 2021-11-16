<?php

namespace App\Http\Controllers\Api\V1;

use App\BlogCategory;
use App\Http\Controllers\Controller;
use App\Http\Resources\NoticeResourceCollection;
use App\Http\Traits\ApiResponseTrait;
use App\Language;
use App\Notification;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class NotificationApiController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */



    public function index()
    {

        $adminNotices=Notification::where(['type'=>Notification::NOTICE])->orderBy('id','DESC')->paginate(8)->take(24);

        return view('api-webview.admin-notification',compact('adminNotices'));

        //return $this->respondWithSuccess('Admin Notice List',NoticeResourceCollection::make($adminNotices),Response::HTTP_OK);

    }


    public function getShopNotification()
    {

        $shopNotifications=Notification::where(['type'=>Notification::SHOP,'user_id'=>auth()->user()->id])->orderBy('id','DESC')->paginate(8)->take(32);

        return view('api-webview.shop-notification',compact('shopNotifications'));

    }



    public function getFeeNotification()
    {

        $feeNotifications=Notification::where(['type'=>Notification::FEE,'user_id'=>auth()->user()->id])->orderBy('id','DESC')->paginate(8)->take(32);

        return view('api-webview.fee-notification',compact('feeNotifications'));

    }


    public function getCommunityNotification()
    {

        $communityNotifications=Notification::where(['type'=>Notification::COMMUNITY,'user_id'=>auth()->user()->id])->orderBy('id','DESC')->paginate(8)->take(32);

        return view('api-webview.community-notification',compact('communityNotifications'));

    }



}
