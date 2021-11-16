<html>

<head>
    <link rel="stylesheet" href="{{asset('assets/common/css/bootstrap.min.css')}}">
    <style>
        .fname,.fvalue{
            padding: 5px;
            font-size: 33px;
        }
    </style>
</head>

<body>
    <div class="view-quote-details-info" id="view-quote-details-info">
    <h1 class="title text-center">View Order Details Information</h1>
    <div class="view-quote-top-wrap">
        <div class="status-wrap">
            Order Status: <span class="">{{$orderDetail->status}}</span>
        </div>
        <div class="data-wrap">
            Date: <span class="quote-date-span">{{date('M-d-Y',strtotime($orderDetail->created_at))}}</span>
        </div>
    </div>
    <div class="table-responsive">

        <table class="quote-all-custom-fields table-striped table-bordered" width="100%">
            <tbody>
            <tr>
                <td class="fname"> payment status </td>
                <td class="fvalue"> {{$orderDetail->payment_status}} </td>
            </tr>
            <tr>
                <td class="fname"> transaction Id </td>
                <td class="fvalue"> {{$orderDetail->transaction_id}} </td>
            </tr>
            <tr>
                <td class="fname">payment gateway</td>
                <td class="fvalue">{{$orderDetail->payment_gateway}}</td>
            </tr>
            <tr>
                <td class="fname">subtotal</td>
                <td class="fvalue">৳{{$orderDetail->subtotal}}</td>
            </tr>
            <tr>
                <td class="fname">total</td>
                <td class="fvalue">৳{{$orderDetail->total}}</td>
            </tr>

            <tr>
                <td class="fname">Billing Address</td>
                <td class="fvalue">{{$orderDetail->billing_street_address}}</td>
            </tr>

            <tr>
                <td class="fname">Shipping Address</td>
                <td class="fvalue">{{$orderDetail->shipping_street_address}}</td>
            </tr>
            @forelse($products as $key=>$product)
            <tr>
                <td class="fname">Product name</td>
                <td class="fvalue">{{$product['title']}}</td>
            </tr>
            <tr>
                <td class="fname">Quantity</td>
                <td class="fvalue">{{$product['quantity']}}</td>
            </tr>
            <tr>
                <td class="fname">Price</td>
                <td class="fvalue">{{$product['price']}}</td>
            </tr>
                @empty

            @endforelse
            </tbody>
        </table>

    </div>
</div>

    <script src="{{asset('assets/common/vendor/jquery-2.2.4.min.js')}}"></script>
</body>

</html>