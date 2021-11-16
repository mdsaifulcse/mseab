<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
 
Route::group([

    'middleware' => 'api',
    'namespace' => 'Api\V1',
    //'prefix' => 'v1', 'as'=>'api.'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});


Route::group(['namespace'=>'Api\V1'],function (){


    Route::post('get-use-profile-phone','CommonDataReturnController@getUserProfileByPhone');

    Route::post('check-nid','CommonDataReturnController@checkUniqueUserByNid');
    Route::post('check-email','CommonDataReturnController@checkUniqueUserByEmail');
    Route::post('check-phone','CommonDataReturnController@checkUniqueUserByPhone');

    Route::get('get-slider-data','CommonDataReturnController@getSliderList');

    Route::post('change-password','ResetPasswordApiController@resetUserPassword');
    Route::post('verify-reset-password-opt','ResetPasswordApiController@verifyResetPasswordOtp');

    Route::post('get-reset-password-opt','ResetPasswordApiController@getResetPasswordOptOnPhoneNumber');

    Route::post('verify-register-otp','CommonDataReturnController@verifyRegisterOtp');
    Route::post('get-register-otp','CommonDataReturnController@getRegisterOtpOnPhoneNumber');

    Route::get('get-blood-group-list','CommonDataReturnController@getBloodGroupList');
    Route::apiResource('user-register','UserRegisterApiController');

    // social login -----
    Route::post('facebook-login','SocialLoginController@facebookApiLogin');
    Route::post('mail-login','SocialLoginController@mailApiLogin');

    Route::get('ssl-pay','SslApiController@ssl');
    // --- SSL Payment
    Route::any('ssl-pay/success','SslApiController@success');
    Route::any('ssl-pay/fail','SslApiController@fail');
    Route::any('ssl-pay/fail','SslApiController@fail');

    // ---Shopping SSL Payment --------

    Route::get('shop-ssl-pay','SslApiController@shopSsl');
    Route::any('shop-ssl-pay/success','SslApiController@shopSuccess');
    Route::any('shop-ssl-pay/fail','SslApiController@shopFail');
    Route::any('shop-ssl-pay/fail','SslApiController@shopFail');

});

// shop Module
//Route::group(['middleware' => ['auth:api']],function () {

    Route::post('/products-checkout', 'ProductOrderController@api_product_checkout')->middleware('auth:api');
    Route::get('/my-product-orders', 'ProductOrderController@myOrdersApi')->middleware('auth:api');
    Route::get('/my-product-orders/{orderId}', 'ProductOrderController@myOrdersDetailApi')->middleware('auth:api');

    Route::post('/products-item/ajax/cart-update', 'ProductCartController@ajax_cart_update');
    Route::post('/products-cart/remove', 'ProductCartController@remove_cart_item');
    Route::get('/products-cart', 'FrontendController@products_cart');
    Route::post('/products-item/add-to-cart', 'ProductCartController@add_to_cart');
    Route::get('/products/{slug}', 'FrontendController@product_single');
    Route::get('/products-gallery/{slug}', 'FrontendController@product_single_gallery');
    Route::get('/products', 'FrontendController@products');
    Route::get('/categories', 'FrontendController@categories');
//});


Route::group(['namespace'=>'Api\V1','middleware' => ['auth:api']],function (){

    Route::get('/my-dashboard','DashboardApiController@getPaymentDataForDashboard');
    Route::get('/my-payment-history','DashboardApiController@getMyAllPaymentData');

    Route::get('my-profile','UserRegisterApiController@getMyProfileData');
    Route::get('my-full-profile','UserRegisterApiController@getMyFullProfileData');

    Route::put('my-profile-update','UserRegisterApiController@update');


    Route::post('/pay-now','FeeCollectionApiController@storeRegularPayment');
    Route::post('/advance-pay','FeeCollectionApiController@storeAdvancePayment');
    Route::get('/get-payable-amount','FeeCollectionApiController@calculateCurrentPayAmount');

    Route::post('support-report','SupportAndReportController@store');
    Route::get('notification/admin-notice','NotificationApiController@index');
    Route::get('notification/shop','NotificationApiController@getShopNotification');
    Route::get('notification/fee','NotificationApiController@getFeeNotification');
    Route::get('notification/community','NotificationApiController@getCommunityNotification');

});
Route::group(['namespace'=>'Api\V1\Community','middleware' => ['auth:api']],function (){

    Route::post('/comment/react','PostCommentApiController@create');
    Route::apiResource('/comment','PostCommentApiController');

    Route::post('/post/react','PostApiController@create');
    Route::get('/post/news-feed','PostApiController@newsFeed');
    Route::apiResource('/post','PostApiController');

});

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});
