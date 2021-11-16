<html>

<head>
    <link rel="stylesheet" href="<?php echo e(asset('assets/common/css/bootstrap.min.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/frontend/css/fontawesome.min.css')); ?>">

</head>

<body>
    <div class="view-quote-details-info" id="view-quote-details-info">
    <h1 class="title text-center">Shop Notification</h1>
    <div class="view-quote-top-wrap">
    </div>
    <div class="table-responsive">

        <?php echo $__env->make('api-webview.partial-notification',['notifications'=>$shopNotifications,'else'=>'No Shop Notification'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    </div>
</div>

    <script src="<?php echo e(asset('assets/common/vendor/jquery-2.2.4.min.js')); ?>"></script>
</body>

</html><?php /**PATH D:\laragon\www\mseab\@core\resources\views/api-webview/shop-notification.blade.php ENDPATH**/ ?>