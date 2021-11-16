<?php

namespace App\Http\Controllers\Api\V1;

use App\FeeCollection;
use App\Notification;
use App\Order;
use App\ProductOrder;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SslApiController extends Controller
{
    public function ssl(Request $request)
    {
        $feeCollection = FeeCollection::findOrFail($request->id);
        if ($feeCollection->fee_amount <= 0) {
            return redirect('/api/v1/ssl-pay/fail');
        }


        if(config('app.sslcz_mode') == 0){
            $ssl_mode = "sandbox";
        }
        else{
            $ssl_mode = "securepay";
        }

        $ssl_store_id = config('app.sslcz_store_id');
        $ssl_store_pass = config('app.sslcz_store_passwd');
        $ssl_url =  "https://" . $ssl_mode . ".sslcommerz.com/gwprocess/v3/api.php";
        $ssl_currency = "BDT";

        $post_data = array();
        $post_data['store_id'] = $ssl_store_id;
        $post_data['store_passwd'] = $ssl_store_pass;
        $post_data['total_amount'] = $feeCollection->fee_amount;
        $post_data['currency'] = $ssl_currency;
        $post_data['tran_id'] = substr(md5($request->id), 0, 10);
        $post_data['success_url'] = url('api/v1/ssl-pay/success');
        $post_data['fail_url'] = url('/api/v1/ssl-pay/fail');
        $post_data['cancel_url'] = url('/api/v1/ssl-pay/fail');
        # $post_data['multi_card_name'] = "mastercard,visacard,amexcard";  # DISABLE TO DISPLAY ALL AVAILABLE

        # EMI INFO
        $post_data['emi_option'] = "0";
        $post_data['emi_max_inst_option'] = "9";
        $post_data['emi_selected_inst'] = "9";

        $userData=User::findOrFail($feeCollection->user_id);

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $userData->name;
        $post_data['cus_email'] = $userData->email;
        $post_data['cus_add1grand_total'] = $feeCollection->fee_amount;
        $post_data['cus_add2'] = "Dhaka";
        $post_data['cus_city'] = "Dhaka";
        $post_data['cus_state'] = "Dhaka";
        $post_data['cus_postcode'] = "1000";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = $userData->phone;
        $post_data['cus_fax'] = "01711111111";

        # SHIPMENT INFORMATION
        // $post_data['ship_name'] = "Wallet Recharge";
        // $post_data['ship_add1 '] = "Dhaka";
        // $post_data['ship_add2'] = "Dhaka";
        // $post_data['ship_city'] = "Dhaka";
        // $post_data['ship_state'] = "Dhaka";
        // $post_data['ship_postcode'] = "1000";
        // $post_data['ship_country'] = "Bangladesh";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = $request->id;
        // $post_data['value_b '] = $user_type;
        // $post_data['value_c'] = $user_type;
        // $post_data['value_d'] = "ref004";

        # CART PARAMETERS
        $post_data['cart'] = json_encode(array(
            array("product" => "DHK TO BRS AC A1", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A2", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A3", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A4", "amount" => "200.00"),
        ));
        $post_data['product_amount'] = "100";
        $post_data['vat'] = "5";
        $post_data['discount_amount'] = "5";
        $post_data['convenience_fee'] = "3";

        # REQUEST SEND TO SSLCOMMERZ
        $direct_api_url = $ssl_url;

        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $direct_api_url);
        curl_setopt($handle, CURLOPT_TIMEOUT, 30);
        curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($handle, CURLOPT_POST, 1);
        curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC

        $content = curl_exec($handle);
        // dd($content);
        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if ($code == 200 && !(curl_errno($handle))) {
            curl_close($handle);
            $sslcommerzResponse = $content;
        } else {
            curl_close($handle);
            echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
            exit;
        }

        # PARSE THE JSON RESPONSE
        $sslcz = json_decode($sslcommerzResponse, true);

        if ($sslcz['status']=="FAILED")
        {
            return $sslcz['failedreason'];
        }


        if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] != "") {
            # THERE ARE MANY WAYS TO REDIRECT - Javascript, Meta Tag or Php Header Redirect or Other
            echo "<script>window.location.href = '". $sslcz['GatewayPageURL'] ."';</script>";
            #echo "<meta http-equiv='refresh' content='0;url=" . $sslcz['GatewayPageURL'] . "'>";
            # header("Location: ". $sslcz['GatewayPageURL']);
            exit;
        } else {
            echo "JSON Data parsing error!";
        }
    }

    public function success(Request $request){

        if ($request->has('value_a') && !empty($request->value_a))
        {
            $feeCollection = FeeCollection::find($request->value_a);

            $feeCollection->update([
                'status'=>FeeCollection::COMPLETE,
                'transaction_id'=>$request->tran_id,
                'payment_gateway'=>$request->card_type,
                'payment_details1'=>json_encode($request->all()),
            ]);

            Notification::create([
                'user_id' => $feeCollection->user_id,
                'title' =>  'Fee Payment Successful',
                'description' =>  'Fee Amount :'.$feeCollection->fee_amount.', with payment gateway: '.$feeCollection->payment_gateway,
                'type' =>  Notification::FEE,
            ]);

        }

        if ($request->has('value_b') && !empty($request->value_b))
        {
            $orderDetails = ProductOrder::find($request->value_b);
            $orderDetails->update([
                'payment_status'=>"complete",
                'transaction_id'=>$request->tran_id,
                'payment_gateway'=>$request->card_type,
                'payment_date'=>Carbon::now(),
            ]);

            Notification::create([
                'user_id' => $orderDetails->user_id,
                'title' =>  'Shop Payment Successful',
                'description' =>  'Payment Amount :'.$orderDetails->total.', with payment gateway: '.$orderDetails->payment_gateway,
                'type' =>  Notification::SHOP,
            ]);

        }

        return 'Payment Successful';
    }

    public function fail(){
        return 'Payment Failed';
    }



    public function shopSsl(Request $request)
    {
        $orderDetails = ProductOrder::find($request->order_id);

        if (empty($orderDetails)) {
            return redirect('/api/v1/shop-ssl-pay/fail');
        }


        if(config('app.sslcz_mode') == 0){
            $ssl_mode = "sandbox";
        }
        else{
            $ssl_mode = "securepay";
        }

        $ssl_store_id = config('app.sslcz_store_id');
        $ssl_store_pass = config('app.sslcz_store_passwd');
        $ssl_url =  "https://" . $ssl_mode . ".sslcommerz.com/gwprocess/v3/api.php";
        $ssl_currency = "BDT";

        $post_data = array();
        $post_data['store_id'] = $ssl_store_id;
        $post_data['store_passwd'] = $ssl_store_pass;
        $post_data['total_amount'] = $orderDetails->total;
        $post_data['currency'] = $ssl_currency;
        $post_data['tran_id'] = substr(md5($request->order_id), 0, 10);
        $post_data['success_url'] = url('api/v1/ssl-pay/success');
        $post_data['fail_url'] = url('/api/v1/ssl-pay/fail');
        $post_data['cancel_url'] = url('/api/v1/ssl-pay/fail');
        # $post_data['multi_card_name'] = "mastercard,visacard,amexcard";  # DISABLE TO DISPLAY ALL AVAILABLE

        # EMI INFO
        $post_data['emi_option'] = "0";
        $post_data['emi_max_inst_option'] = "9";
        $post_data['emi_selected_inst'] = "9";

        $userData=User::findOrFail($orderDetails->user_id);

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $userData->name;
        $post_data['cus_email'] = $userData->email;
        $post_data['cus_add1grand_total'] = $orderDetails->total;
        $post_data['cus_add2'] = "Dhaka";
        $post_data['cus_city'] = "Dhaka";
        $post_data['cus_state'] = "Dhaka";
        $post_data['cus_postcode'] = "1000";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = $userData->phone;
        $post_data['cus_fax'] = "01711111111";

        # SHIPMENT INFORMATION
        // $post_data['ship_name'] = "Wallet Recharge";
        // $post_data['ship_add1 '] = "Dhaka";
        // $post_data['ship_add2'] = "Dhaka";
        // $post_data['ship_city'] = "Dhaka";
        // $post_data['ship_state'] = "Dhaka";
        // $post_data['ship_postcode'] = "1000";
        // $post_data['ship_country'] = "Bangladesh";

        # OPTIONAL PARAMETERS
        $post_data['value_b'] = $request->order_id;
        // $post_data['value_b '] = $user_type;
        // $post_data['value_c'] = $user_type;
        // $post_data['value_d'] = "ref004";

        # CART PARAMETERS
        $post_data['cart'] = json_encode(array(
            array("product" => "DHK TO BRS AC A1", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A2", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A3", "amount" => "200.00"),
            array("product" => "DHK TO BRS AC A4", "amount" => "200.00"),
        ));
        $post_data['product_amount'] = "100";
        $post_data['vat'] = "5";
        $post_data['discount_amount'] = "5";
        $post_data['convenience_fee'] = "3";

        # REQUEST SEND TO SSLCOMMERZ
        $direct_api_url = $ssl_url;

        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $direct_api_url);
        curl_setopt($handle, CURLOPT_TIMEOUT, 30);
        curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($handle, CURLOPT_POST, 1);
        curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC

        $content = curl_exec($handle);
        // dd($content);
        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if ($code == 200 && !(curl_errno($handle))) {
            curl_close($handle);
            $sslcommerzResponse = $content;
        } else {
            curl_close($handle);
            echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
            exit;
        }

        # PARSE THE JSON RESPONSE
        $sslcz = json_decode($sslcommerzResponse, true);

        if ($sslcz['status']=="FAILED")
        {
            return $sslcz['failedreason'];
        }


        if (isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL'] != "") {
            # THERE ARE MANY WAYS TO REDIRECT - Javascript, Meta Tag or Php Header Redirect or Other
            echo "<script>window.location.href = '". $sslcz['GatewayPageURL'] ."';</script>";
            #echo "<meta http-equiv='refresh' content='0;url=" . $sslcz['GatewayPageURL'] . "'>";
            # header("Location: ". $sslcz['GatewayPageURL']);
            exit;
        } else {
            echo "JSON Data parsing error!";
        }
    }

    public function shopSuccess(Request $request){

        $orderDetails = ProductOrder::find($request->value_a);
        $orderDetails->payment_status = "complete";
        $orderDetails->transaction_id = $request->tran_id;
        $orderDetails->payment_gateway = $request->card_type;
        //$orderDetails->payment_details = json_encode($request->all());
        $orderDetails->save();

        return 'Payment Successful';
    }

    public function shopFail(){
        return 'Payment Failed';
    }

}
