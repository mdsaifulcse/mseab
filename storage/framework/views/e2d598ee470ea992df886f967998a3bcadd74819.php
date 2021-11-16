
<?php $__env->startSection('style'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/backend/css/dropzone.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/backend/css/media-uploader.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/backend/css/summernote-bs4.css')); ?>">
<?php $__env->stopSection(); ?>
<?php $__env->startSection('site-title'); ?>
    <?php echo e(__('Header Area')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <div class="col-lg-12">
                <div class="margin-top-40"></div>
                <?php echo $__env->make('backend/partials/message', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php if($errors->any()): ?>
                    <div class="alert alert-danger">
                        <ul>
                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li><?php echo e($error); ?></li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    </div>
                <?php endif; ?>
            </div>
            <div class="col-lg-12 mt-t">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title"><?php echo e(__('Header Area Settings')); ?></h4>

                        <form action="<?php echo e(route('admin.home06.header')); ?>" method="post" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <?php
                                   $all_bg_image_fields =  get_static_option('home_page_06_header_section_bg_image');
                                   $all_bg_image_fields = !empty($all_bg_image_fields) ? unserialize($all_bg_image_fields) : [''];
                                   $all_button_one_url_fields =  get_static_option('home_page_06_header_section_button_one_url');
                                   $all_button_one_url_fields = !empty($all_button_one_url_fields) ? unserialize($all_button_one_url_fields) : [];
                                   $all_button_two_url_fields =  get_static_option('home_page_06_header_section_button_two_url');
                                   $all_button_two_url_fields = !empty($all_button_two_url_fields) ? unserialize($all_button_two_url_fields) : [''];
                            ?>
                            <?php $__currentLoopData = $all_bg_image_fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $image_field): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="iconbox-repeater-wrapper">
                                    <div class="all-field-wrap">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <?php $__currentLoopData = $all_languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <li class="nav-item">
                                                    <a class="nav-link <?php if($key == 0): ?> active <?php endif; ?>" data-toggle="tab" href="#tab_<?php echo e($lang->slug); ?>_<?php echo e($key + $index); ?>" role="tab"  aria-selected="true"><?php echo e($lang->name); ?></a>
                                                </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                        <div class="tab-content margin-top-30" id="myTabContent">
                                            <?php $__currentLoopData = $all_languages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php
                                                    $all_description_fields = get_static_option('home_page_06_'.$lang->slug.'_header_section_description');
                                                    $all_description_fields = !empty($all_description_fields) ? unserialize($all_description_fields) : [''];
                                                    $all_btn_one_text_fields = get_static_option('home_page_06_'.$lang->slug.'_header_section_button_one_text');
                                                    $all_btn_one_text_fields = !empty($all_btn_one_text_fields) ? unserialize($all_btn_one_text_fields) : ['Request Quote'];
                                                    $all_btn_two_text_fields = get_static_option('home_page_06_'.$lang->slug.'_header_section_button_two_text');
                                                    $all_btn_two_text_fields = !empty($all_btn_two_text_fields) ? unserialize($all_btn_two_text_fields) : ['About'];
                                                    $all_title_fields = get_static_option('home_page_06_'.$lang->slug.'_header_section_title');
                                                    $all_title_fields = !empty($all_title_fields) ? unserialize($all_title_fields) : ['world best industry service here'];
                                                ?>

                                                <div class="tab-pane fade <?php if($key == 0): ?> show active <?php endif; ?>" id="tab_<?php echo e($lang->slug); ?>_<?php echo e($key + $index); ?>" role="tabpanel" >
                                                    <div class="form-group">
                                                        <label for="home_page_06_<?php echo e($lang->slug); ?>_header_section_title"><?php echo e(__('Title')); ?></label>
                                                        <input type="text" name="home_page_06_<?php echo e($lang->slug); ?>_header_section_title[]" class="form-control" value="<?php echo e(isset($all_title_fields[$index]) ? $all_title_fields[$index] : ''); ?>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="home_page_06_<?php echo e($lang->slug); ?>_header_section_description"><?php echo e(__('Description')); ?></label>
                                                        <textarea  name="home_page_06_<?php echo e($lang->slug); ?>_header_section_description[]" class="form-control" > <?php echo e(isset($all_description_fields[$index]) ? $all_description_fields[$index] : ''); ?></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="home_page_06_<?php echo e($lang->slug); ?>_header_section_button_one_text"><?php echo e(__('Button One Title')); ?></label>
                                                        <input type="text" name="home_page_06_<?php echo e($lang->slug); ?>_header_section_button_one_text[]" class="form-control" value="<?php echo e(isset($all_btn_one_text_fields[$index]) ? $all_btn_one_text_fields[$index] : ''); ?>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="home_page_06_<?php echo e($lang->slug); ?>_header_section_button_two_text"><?php echo e(__('Button Two Title')); ?></label>
                                                        <input type="text" name="home_page_06_<?php echo e($lang->slug); ?>_header_section_button_two_text[]" class="form-control" value="<?php echo e(isset($all_btn_two_text_fields[$index]) ? $all_btn_two_text_fields[$index] : ''); ?>">
                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <div class="form-group">
                                                <label for="home_page_06_header_section_button_one_url" class="d-block"><?php echo e(__('Button One Url')); ?></label>
                                                <input type="text" class="form-control" value="<?php echo e(isset($all_button_one_url_fields[$index]) ? $all_button_one_url_fields[$index] : ''); ?>" name="home_page_06_header_section_button_one_url[]">
                                            </div>
                                            <div class="form-group">
                                                <label for="home_page_06_header_section_button_two_url" class="d-block"><?php echo e(__('Button Two Url')); ?></label>
                                                <input type="text" class="form-control" value="<?php echo e(isset($all_button_two_url_fields[$index]) ? $all_button_two_url_fields[$index] : ''); ?>" name="home_page_06_header_section_button_two_url[]">
                                            </div>
                                            <div class="form-group">
                                                <label for="home_page_06_header_section_bg_image"><?php echo e(__('Background Image')); ?></label>
                                                <?php $signature_image_upload_btn_label = 'Upload Image'; ?>
                                                <div class="media-upload-btn-wrapper">
                                                    <div class="img-wrap">
                                                        <?php
                                                            $signature_img = get_attachment_image_by_id($image_field,null,false);
                                                        ?>
                                                        <?php if(!empty($signature_img)): ?>
                                                            <div class="attachment-preview">
                                                                <div class="thumbnail">
                                                                    <div class="centered">
                                                                        <img class="avatar user-thumb" src="<?php echo e($signature_img['img_url']); ?>" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <?php $signature_image_upload_btn_label = 'Change Image'; ?>
                                                        <?php endif; ?>
                                                    </div>
                                                    <input type="hidden" name="home_page_06_header_section_bg_image[]" value="<?php echo e($image_field); ?>">
                                                    <button type="button" class="btn btn-info media_upload_form_btn" data-btntitle="<?php echo e(__('Select Image')); ?>" data-modaltitle="<?php echo e(__('Upload Image')); ?>" data-imgid="<?php echo e($image_field); ?>" data-toggle="modal" data-target="#media_upload_modal">
                                                        <?php echo e(__($signature_image_upload_btn_label)); ?>

                                                    </button>
                                                </div>
                                                <small><?php echo e(__('recommended image size is 1920x1050 pixel')); ?></small>
                                            </div>
                                        </div>
                                        <div class="action-wrap">
                                            <span class="add"><i class="ti-plus"></i></span>
                                            <span class="remove"><i class="ti-trash"></i></span>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4"><?php echo e(__('Update Settings')); ?></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('backend.partials.media-upload.media-upload-markup', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <script src="<?php echo e(asset('assets/backend/js/dropzone.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/backend/js/summernote-bs4.js')); ?>"></script>
    <?php echo $__env->make('backend.partials.media-upload.media-js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <script>
        $(document).ready(function () {

            $('.summernote').summernote({
                height: 400,   //set editable area's height
                codemirror: { // codemirror options
                    theme: 'monokai'
                },
                callbacks: {
                    onChange: function(contents, $editable) {
                        $(this).prev('input').val(contents);
                    }
                }
            });

            if($('.summernote').length > 0){
                $('.summernote').each(function(index,value){
                    $(this).summernote('code', $(this).data('content'));
                });
            }

            $('.icp-dd').iconpicker();
            $('body').on('iconpickerSelected','.icp-dd', function (e) {
                var selectedIcon = e.iconpickerValue;
                $(this).parent().parent().children('input').val(selectedIcon);
                $('body .dropdown-menu.iconpicker-container').removeClass('show');
            });

            $(document).on('click','.all-field-wrap .action-wrap .add',function (e){
                e.preventDefault();

                var el = $(this);
                var parent = el.parent().parent();
                var container = $('.all-field-wrap');
                var clonedData = parent.clone();
                var containerLength = container.length;
                clonedData.find('#myTab').attr('id','mytab_'+containerLength);
                clonedData.find('#myTabContent').attr('id','myTabContent_'+containerLength);
                var allTab =  clonedData.find('.tab-pane');
                allTab.each(function (index,value){
                    var el = $(this);
                    var oldId = el.attr('id');
                    el.attr('id',oldId+containerLength);
                });
                var allTabNav =  clonedData.find('.nav-link');
                allTabNav.each(function (index,value){
                    var el = $(this);
                    var oldId = el.attr('href');
                    el.attr('href',oldId+containerLength);
                });

                parent.parent().append(clonedData);

                if (containerLength > 0){
                    parent.parent().find('.remove').show(300);
                }
                parent.parent().find('.iconpicker-popover').remove();
                parent.parent().find('.icp-dd').iconpicker();

            });

            $(document).on('click','.all-field-wrap .action-wrap .remove',function (e){
                e.preventDefault();
                var el = $(this);
                var parent = el.parent().parent();
                var container = $('.all-field-wrap');

                if (container.length > 1){
                    el.show(300);
                    parent.hide(300);
                    parent.remove();
                }else{
                    el.hide(300);
                }
            });

        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin-master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\mseab\@core\resources\views/backend/pages/home/logistics-home/header-area.blade.php ENDPATH**/ ?>