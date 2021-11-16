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
    <h1 class="title text-center">Community Notification</h1>
    <div class="view-quote-top-wrap">
    </div>
    <div class="table-responsive">
        @include('api-webview.partial-notification',['notifications'=>$communityNotifications,'else'=>'No Community Notification'])
    </div>
</div>

    <script src="{{asset('assets/common/vendor/jquery-2.2.4.min.js')}}"></script>
</body>

</html>