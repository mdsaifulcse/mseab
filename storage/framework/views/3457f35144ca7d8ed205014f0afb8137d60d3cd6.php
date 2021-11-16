<?php $__env->startSection('style'); ?>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0 !important;
        }

        div.dataTables_wrapper div.dataTables_length select {
            width: 60px;
            display: inline-block;
        }

        .table tr td {
            border: none !important
        }
    </style>
    <link rel="stylesheet" href="<?php echo e(asset('assets/backend/css/dropzone.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(asset('assets/backend/css/media-uploader.css')); ?>">
<?php $__env->stopSection(); ?>
<?php $__env->startSection('site-title'); ?>
    <?php echo e(__('Fee-Collection')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="card">
                    <div class="card-body">
                        <div class="col-12 mt-5">
                            <div class="card">
                                <div class="card-body">
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
                                    <h4 class="header-title"><?php echo e(__('All Fee-Collection')); ?></h4>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card bg-light">
                                                <div class="card-header">
                                                    <h3>Total Amount</h3>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-text"><span style="font-size: 30px;" class="text-success"><?php echo e(number_format($feeCollections->sum('fee_amount'),2)); ?></span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <table class="table table-borderless">
                                                <thead>
                                                <tr>
                                                    <td><h4>Payment Status</h4></td>
                                                    <td><h4>Date Filter</h4></td>
                                                    <td></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <select class="form-control-sm payment">
                                                            <option value="">Select an option</option>
                                                            <option value="due" <?php if(request()->get('payment') == 'due'): ?><?php echo e('selected'); ?><?php endif; ?>>Due Payment</option>
                                                            <option value="advance" <?php if(request()->get('payment') == 'advance'): ?><?php echo e('selected'); ?><?php endif; ?>>Advance Payment</option>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <select class="form-control-sm date">
                                                            <option value="">Select an option</option>
                                                            <option value="daily" <?php if(request()->get('date') == 'daily'): ?><?php echo e('selected'); ?><?php endif; ?>>Daily</option>
                                                            <option value="weekly" <?php if(request()->get('date') == 'weekly'): ?><?php echo e('selected'); ?><?php endif; ?>>Weekly</option>
                                                            <option value="monthly" <?php if(request()->get('date') == 'monthly'): ?><?php echo e('selected'); ?><?php endif; ?>>Monthly</option>
                                                            <option value="yearly" <?php if(request()->get('date') == 'yearly'): ?><?php echo e('selected'); ?><?php endif; ?>>Yearly</option>
                                                        </select>
                                                    </td>
                                                    <td><button style="width: 100px;" type="button" class="btn btn-primary form-control-sm filter-button">Go</button></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="data-tables datatable-primary">
                                        <table id="all_user_table" class="text-center">
                                            <thead class="text-capitalize">
                                            <tr>
                                                <th><?php echo e(__('Serial')); ?></th>
                                                <th><?php echo e(__('Name')); ?></th>
                                                <th><?php echo e(__('TrxId')); ?></th>
                                                <th><?php echo e(__('Payment Method')); ?></th>
                                                <th><?php echo e(__('Payment Date')); ?></th>
                                                <th><?php echo e(__('Amount')); ?></th>
                                                <th><?php echo e(__('Status')); ?></th>
                                                <th><?php echo e(__('Action')); ?></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php $__currentLoopData = $feeCollections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $feeCollection): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td><?php echo e(++$key); ?></td>
                                                    <td><?php echo e($feeCollection->feeUser->name); ?></td>
                                                    <td><?php echo e($feeCollection->transaction_id); ?></td>
                                                    <td><?php echo e($feeCollection->payment_gateway); ?></td>
                                                    <td><?php echo e(date('d-M-Y',strtotime($feeCollection->payment_date))); ?></td>
                                                    <td style="text-align: right"><?php echo e(number_format($feeCollection->fee_amount,2)); ?></td>
                                                    <td><?php echo e($feeCollection->status); ?>

                                                        <?php if($feeCollection->status==\App\FeeCollection::COMPLETE): ?> <i class="fas fa-check-circle text-success"></i><?php else: ?>
                                                            <i class="fas fa-waning text-success"></i>
                                                        <?php endif; ?></td>
                                                    <td>

                                                        <?php if($feeCollection->status==\App\FeeCollection::PENDING): ?>
                                                            <a tabindex="0" class="btn btn-danger btn-sm mb-3 mr-1" role="button" data-toggle="popover" data-trigger="focus" data-html="true" title="" data-content="
                                                       <h6><?php echo e(__('Are you sure to delete this user?  Payment info will also  be delete of this user')); ?></h6>
                                                       <form method='post' action='<?php echo e(route('admin.frontend.delete.user',$feeCollection->id)); ?>'>
                                                       <input type='hidden' name='_token' value='<?php echo e(csrf_token()); ?>'>
                                                       <br>
                                                        <input type='submit' class='btn btn-danger btn-sm' value='<?php echo e(__('Yes,Please')); ?>'>
                                                        </form>
                                                        " data-original-title="">
                                                                <i class="ti-trash"></i>
                                                            </a>

                                                        <?php endif; ?>


                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Primary table end -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="user_edit_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><?php echo e(__('User Details Edit')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                </div>
                <form action="<?php echo e(route('admin.frontend.user.update')); ?>" id="user_edit_modal_form" method="post" enctype="multipart/form-data">
                    <?php echo e(csrf_field()); ?>

                    <div class="modal-body">
                        <input type="hidden" name="user_id" id="user_id">

                        <div class="form-group">
                            <label for="name"><?php echo e(__('Name')); ?></label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="<?php echo e(__('Enter name')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="email"><?php echo e(__('Email')); ?></label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="<?php echo e(__('Email')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="phone"><?php echo e(__('Phone')); ?></label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="<?php echo e(__('Phone')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="country"><?php echo e(__('Country')); ?></label>
                            <?php echo get_country_field('country','country','form-control'); ?>

                        </div>
                        <div class="form-group">
                            <label for="state"><?php echo e(__('State')); ?></label>
                            <input type="text" class="form-control" id="state" name="state" placeholder="<?php echo e(__('State')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="city"><?php echo e(__('City')); ?></label>
                            <input type="text" class="form-control" id="city" name="city" placeholder="<?php echo e(__('City')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="zipcode"><?php echo e(__('Zipcode')); ?></label>
                            <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="<?php echo e(__('Zipcode')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="address"><?php echo e(__('Address')); ?></label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="<?php echo e(__('Address')); ?>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>
                        <button type="submit" class="btn btn-primary"><?php echo e(__('Save changes')); ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="user_change_password_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><?php echo e(__('Change Admin Password')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                </div>
                <?php if($errors->any()): ?>
                    <div class="alert alert-danger">
                        <ul>
                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li><?php echo e($error); ?></li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    </div>
                <?php endif; ?>
                <form action="<?php echo e(route('admin.frontend.user.password.change')); ?>" id="user_password_change_modal_form" method="post" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <div class="modal-body">
                        <input type="hidden" name="ch_user_id" id="ch_user_id">
                        <div class="form-group">
                            <label for="password"><?php echo e(__('Password')); ?></label>
                            <input type="password" class="form-control" name="password" placeholder="<?php echo e(__('Enter Password')); ?>">
                        </div>
                        <div class="form-group">
                            <label for="password_confirmation"><?php echo e(__('Confirm Password')); ?></label>
                            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="<?php echo e(__('Confirm Password')); ?>">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>
                        <button type="submit" class="btn btn-primary"><?php echo e(__('Change Password')); ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php echo $__env->make('backend.partials.media-upload.media-upload-markup', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document).on('click','.filter-button',function (e){
                e.preventDefault();
                let payment = $('.payment').val();
                let date = $('.date').val();
                getQuery(payment,date);
            });
            function getQuery(payment,date){
                let url = "<?php echo e(Request::url()); ?>";
                if(payment !== '' && date !== ''){
                    window.location.href = url + '?payment=' + payment + '&date=' + date
                }
                if(payment !== '' && date === ''){
                    window.location.href = url + '?payment=' + payment
                }
                if (payment === '' && date !== ''){
                    window.location.href = url + '?date=' + date
                }
                if (payment === '' && date === ''){
                    window.location.href = url
                }
            }
            $(document).on('click', '.user_change_password_btn', function (e) {
                e.preventDefault();
                var el = $(this);
                var form = $('#user_password_change_modal_form');
                form.find('#ch_user_id').val(el.data('id'));
            });
            $('#all_user_table').DataTable({
                'columnDefs': [{
                    'targets': 'no-sort',
                    'orderable': false
                }]
            });

            $(document).on('click', '.user_edit_btn', function (e) {
                e.preventDefault();
                var form = $('#user_edit_modal_form');
                var el = $(this);

                form.find('#user_id').val(el.data('id'));
                form.find('#name').val(el.data('name'));
                form.find('#username').val(el.data('username'));
                form.find('#email').val(el.data('email'));
                form.find('#phone').val(el.data('phone'));
                form.find('#state').val(el.data('state'));
                form.find('#city').val(el.data('city'));
                form.find('#zipcode').val(el.data('zipcode'));
                form.find('#address').val(el.data('address'));
                form.find('#country option[value="' + el.data('country') + '"]').attr('selected', true);

            });

            $(document).on('click', '#bulk_delete_btn', function (e) {
                e.preventDefault();

                var bulkOption = $('#bulk_option').val();
                var allCheckbox = $('.bulk-checkbox:checked');
                var allIds = [];
                allCheckbox.each(function (index, value) {
                    allIds.push($(this).val());
                });
                if (allIds != '' && bulkOption == 'delete') {
                    $(this).text('<?php echo e(__('Deleting...')); ?>');
                    $.ajax({
                        'type': "POST",
                        'url': "<?php echo e(route('admin.all.frontend.user.bulk.action')); ?>",
                        'data': {
                            _token: "<?php echo e(csrf_token()); ?>",
                            ids: allIds
                        },
                        success: function (data) {
                            location.reload();
                        }
                    });
                }

            });

            $('.all-checkbox').on('change', function (e) {
                e.preventDefault();
                var value = $('.all-checkbox').is(':checked');
                var allChek = $(this).parent().parent().parent().parent().parent().find('.bulk-checkbox');
                //have write code here fr
                if (value == true) {
                    allChek.prop('checked', true);
                } else {
                    allChek.prop('checked', false);
                }
            });


        });
    </script>
    <script src="<?php echo e(asset('assets/backend/js/dropzone.js')); ?>"></script>
    <?php echo $__env->make('backend.partials.media-upload.media-js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.admin-master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/aapbd/public_html/dohs/resources/views/backend/fee-collection/all-fee-collection.blade.php ENDPATH**/ ?>