
<style>
    .list-group-item{
        margin:0 8px;
        margin-bottom: 15px;
        border-color: red;
    }
    .list-group-item p{
        font-size: 28px;
    }
    .pull-right{
        float: right;
    }
    .badge{
        font-size: 25px;
    }

</style>

<ul class="list-group">
    <?php $__empty_1 = true; $__currentLoopData = $notifications; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$notification): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <li class="list-group-item list-group-item-success0">

            <div class="">
                <div class="badge pull-right"><i class="fa fa-clock"></i> <?php echo e(date('d-M-Y h:i A',strtotime($notification->created_at))); ?> </div>

                <h1 class="list-group-item-heading"><?php echo e($notification->title); ?></h1>
                <p class="list-group-item-text"><?php echo e($notification->description); ?></p>
            </div>

        </li>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>

        <li class="list-group-item text-center"><?php echo e($else); ?></li>

    <?php endif; ?>
</ul><?php /**PATH D:\laragon\www\mseab\@core\resources\views/api-webview/partial-notification.blade.php ENDPATH**/ ?>