<section class="breadcrumb-area breadcrumb-bg "
    <?php echo render_background_image_markup_by_attachment_id(get_static_option('site_breadcrumb_bg')); ?>

>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-inner">
                    <h1 class="page-title"><?php echo $__env->yieldContent('page-title'); ?></h1>
                    <ul class="page-list">
                        <li><a href="<?php echo e(url('/')); ?>"><?php echo e(__('Home')); ?></a></li>
                        <?php if(request()->is(get_static_option('blog_page_slug').'/*') || request()->is(get_static_option('blog_page_slug').'-category'.'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('blog_page_slug')); ?>"><?php echo e(get_static_option('blog_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('work_page_slug').'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('work_page_slug')); ?>"><?php echo e(get_static_option('work_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('service_page_slug').'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('service_page_slug')); ?>"><?php echo e(get_static_option('service_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('product_page_slug').'/*') || request()->is(get_static_option('product_page_slug').'-cart') || request()->is(get_static_option('product_page_slug').'-category'.'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('product_page_slug')); ?>"><?php echo e(get_static_option('product_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('career_with_us_page_slug').'/*') || request()->is(get_static_option('career_with_us_page_slug').'-category'.'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('career_with_us_page_slug')); ?>"><?php echo e(get_static_option('career_with_us_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('events_page_slug').'/*') || request()->is(get_static_option('events_page_slug').'-category'.'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('events_page_slug')); ?>"><?php echo e(get_static_option('events_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('knowledgebase_page_slug').'/*') || request()->is(get_static_option('knowledgebase_page_slug').'-category'.'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('knowledgebase_page_slug')); ?>"><?php echo e(get_static_option('knowledgebase_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php elseif(request()->is(get_static_option('donation_page_slug').'/*')): ?>
                            <li><a href="<?php echo e(url('/').'/'.get_static_option('donation_page_slug')); ?>"><?php echo e(get_static_option('donation_page_' . $user_select_lang_slug . '_name')); ?></a></li>
                        <?php endif; ?>
                        <li><?php echo $__env->yieldContent('page-title'); ?></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<?php /**PATH /home/aapbd/public_html/dohs/resources/views/frontend/partials/breadcrumb.blade.php ENDPATH**/ ?>