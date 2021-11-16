<html>

<head>
    <link rel="stylesheet" href="{{asset('assets/common/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/frontend/css/fontawesome.min.css')}}">
</head>

<body>
    <div class="view-quote-details-info" id="view-quote-details-info">
    <h1 class="title text-center">Notification From Admin</h1>
    <div class="view-quote-top-wrap">
    </div>
    <div class="table-responsive">
        @include('api-webview.partial-notification',['notifications'=>$adminNotices,'else'=>'No Admin Notification'])

    </div>
</div>

    <script src="{{asset('assets/common/vendor/jquery-2.2.4.min.js')}}"></script>
</body>

</html>