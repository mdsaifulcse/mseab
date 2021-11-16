@extends('backend.admin-master')
@section('style')
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button{
            padding: 0 !important;
        }
        div.dataTables_wrapper div.dataTables_length select {
            width: 60px;
            display: inline-block;
        }
    </style>
    <link rel="stylesheet" href="{{asset('assets/backend/css/dropzone.css')}}">
    <link rel="stylesheet" href="{{asset('assets/backend/css/media-uploader.css')}}">
@endsection
@section('site-title')
    {{__('Community All Post')}}
@endsection
@section('content')
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="card">
                    <div class="card-body">
                        <div class="col-12 mt-5">
                            <div class="card">
                                <div class="card-body">
                                    @include('backend/partials/message')
                                    @if($errors->any())
                                        <div class="alert alert-danger">
                                            <ul>
                                                @foreach($errors->all() as $error)
                                                    <li>{{$error}}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif
                                    <h4 class="header-title">{{__('Community All Post')}}</h4>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card bg-light">
                                                <div class="card-header">
                                                    <h3>Total Posts</h3>
                                                </div>
                                                <div class="card-body">
                                                    <p class="card-text text-center"><span style="font-size: 30px;" class="text-success">{{ $allPosts->count() }}</span></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <table class="table table-borderless">
                                                <thead>
                                                <tr>
                                                    <td><h4>Time Filter</h4></td>
                                                    <td></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <select class="form-control-sm time">
                                                            <option value="">Select an option</option>
                                                            <option value="last_five_minutes" @if(request()->get('time') == 'last_five_minutes'){{ 'selected' }}@endif>Last Five Minutes</option>
                                                            <option value="last_ten_minutes" @if(request()->get('time') == 'last_ten_minutes'){{ 'selected' }}@endif>Last Ten Minutes</option>
                                                            <option value="last_thirty_minutes" @if(request()->get('time') == 'last_thirty_minutes'){{ 'selected' }}@endif>Last Thirty Minutes</option>
                                                            <option value="last_hour" @if(request()->get('time') == 'last_hour'){{ 'selected' }}@endif>Last Hour</option>
                                                            <option value="last_five_hours" @if(request()->get('time') == 'last_five_hours'){{ 'selected' }}@endif>Last 5 Hours</option>
                                                            <option value="last_twelve_hours" @if(request()->get('time') == 'last_twelve_hours'){{ 'selected' }}@endif>Last 12 Hours</option>
                                                            <option value="last_twenty_four_hours" @if(request()->get('time') == 'last_twenty_four_hours'){{ 'selected' }}@endif>Last 24 Hours</option>
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
                                                <th>{{__('Serial')}}</th>
                                                <th>{{__('Title')}}</th>
                                                <th>{{__('Description')}}</th>
                                                <th>{{__('Image')}}</th>
                                                <th>{{__('Total Like')}}</th>
                                                <th>{{__('Total Comment')}}</th>
                                                <th>{{__('Status')}}</th>
                                                <th>{{__('Author')}}</th>
                                                <th>{{__('Posted At')}}</th>
                                                <th>{{__('Action')}}</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($allPosts as $key => $post)
                                                <tr>
                                                    <td>{{ ++$key }}</td>
                                                    <td>{{ $post->title }}</td>
                                                    <td>{{ $post->description }}</td>
                                                    <td>
                                                        @if(!empty($post->photo))
                                                        <img src="{{asset($post->photo)}}" width="50">
                                                            @else
                                                            <span>No Image</span>
                                                        @endif
                                                    </td>
                                                    <td>{{$post->reacts->count()}}</td>
                                                    <td>{{$post->comments->count()}}</td>
                                                    {{--<td>{{date('d-M-Y',strtotime($post->payment_date))}}</td>--}}
                                                    <td>{{$post->status}}</td>
                                                    <td>{{$post->user->name}}</td>
                                                    <td>{{ date('d-m-Y h:i A',strtotime($post->created_at)) }}</td>
                                                    <td>

                                                            <a tabindex="0" class="btn btn-danger btn-sm mb-3 mr-1" role="button" data-toggle="popover" data-trigger="focus" data-html="true" title="" data-content="
                                                       <h6>{{__('Are you sure to delete this post? ')}}</h6>
                                                       <form method='post' action='{{route('admin-home.community.all-post.delete',$post->id)}}'>
                                                       <input type='hidden' name='_token' value='{{csrf_token()}}'>
                                                       <input type='hidden' name='id' value='{{$post->id}}'>
                                                       <br>
                                                        <input type='submit' class='btn btn-danger btn-sm' value='{{__('Yes,Please')}}'>
                                                        </form>
                                                        " data-original-title="">
                                                                <i class="ti-trash"></i>
                                                            </a>



                                                    </td>
                                                </tr>
                                            @endforeach
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
                    <h5 class="modal-title">{{__('User Details Edit')}}</h5>
                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                </div>
                <form action="{{route('admin.frontend.user.update')}}" id="user_edit_modal_form" method="post" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <input type="hidden" name="user_id" id="user_id">

                        <div class="form-group">
                            <label for="name">{{__('Name')}}</label>
                            <input type="text" class="form-control"  id="name" name="name" placeholder="{{__('Enter name')}}">
                        </div>
                        <div class="form-group">
                            <label for="email">{{__('Email')}}</label>
                            <input type="text" class="form-control"  id="email" name="email" placeholder="{{__('Email')}}">
                        </div>
                        <div class="form-group">
                            <label for="phone">{{__('Phone')}}</label>
                            <input type="text" class="form-control"  id="phone" name="phone" placeholder="{{__('Phone')}}">
                        </div>
                        <div class="form-group">
                            <label for="country">{{__('Country')}}</label>
                            {!! get_country_field('country','country','form-control') !!}
                        </div>
                        <div class="form-group">
                            <label for="state">{{__('State')}}</label>
                            <input type="text" class="form-control"  id="state" name="state" placeholder="{{__('State')}}">
                        </div>
                        <div class="form-group">
                            <label for="city">{{__('City')}}</label>
                            <input type="text" class="form-control"  id="city" name="city" placeholder="{{__('City')}}">
                        </div>
                        <div class="form-group">
                            <label for="zipcode">{{__('Zipcode')}}</label>
                            <input type="text" class="form-control"  id="zipcode" name="zipcode" placeholder="{{__('Zipcode')}}">
                        </div>
                        <div class="form-group">
                            <label for="address">{{__('Address')}}</label>
                            <input type="text" class="form-control"  id="address" name="address" placeholder="{{__('Address')}}">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Close')}}</button>
                        <button type="submit" class="btn btn-primary">{{__('Save changes')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="user_change_password_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('Change Admin Password')}}</h5>
                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                </div>
                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach($errors->all() as $error)
                                <li>{{$error}}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <form action="{{route('admin.frontend.user.password.change')}}" id="user_password_change_modal_form" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <input type="hidden" name="ch_user_id" id="ch_user_id">
                        <div class="form-group">
                            <label for="password">{{__('Password')}}</label>
                            <input type="password" class="form-control" name="password" placeholder="{{__('Enter Password')}}">
                        </div>
                        <div class="form-group">
                            <label for="password_confirmation">{{__('Confirm Password')}}</label>
                            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="{{__('Confirm Password')}}">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Close')}}</button>
                        <button type="submit" class="btn btn-primary">{{__('Change Password')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @include('backend.partials.media-upload.media-upload-markup')
@endsection

@section('script')
    <!-- Start datatable js -->
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {

            $(document).on('click','.user_change_password_btn',function(e){
                e.preventDefault();
                var el = $(this);
                var form = $('#user_password_change_modal_form');
                form.find('#ch_user_id').val(el.data('id'));
            });
            $('#all_user_table').DataTable( {
                'columnDefs' : [{
                    'targets' : 'no-sort',
                    'orderable' : false
                }]
            } );

            $(document).on('click','.user_edit_btn',function(e){
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
                form.find('#country option[value="'+el.data('country')+'"]').attr('selected',true);

            });

            $(document).on('click','#bulk_delete_btn',function (e) {
                e.preventDefault();

                var bulkOption = $('#bulk_option').val();
                var allCheckbox =  $('.bulk-checkbox:checked');
                var allIds = [];
                allCheckbox.each(function(index,value){
                    allIds.push($(this).val());
                });
                if(allIds != '' && bulkOption == 'delete'){
                    $(this).text('{{__('Deleting...')}}');
                    $.ajax({
                        'type' : "POST",
                        'url' : "{{route('admin.all.frontend.user.bulk.action')}}",
                        'data' : {
                            _token: "{{csrf_token()}}",
                            ids: allIds
                        },
                        success:function (data) {
                            location.reload();
                        }
                    });
                }

            });

            $('.all-checkbox').on('change',function (e) {
                e.preventDefault();
                var value = $('.all-checkbox').is(':checked');
                var allChek = $(this).parent().parent().parent().parent().parent().find('.bulk-checkbox');
                //have write code here fr
                if( value == true){
                    allChek.prop('checked',true);
                }else{
                    allChek.prop('checked',false);
                }
            });


        } );
        $(document).on('click','.filter-button',function (e){
            e.preventDefault();
            let time = $('.time').val();
            let url = "{{ Request::url() }}";
            if(time !== ''){
                window.location.href = url + '?time=' + time;
            }else{
                window.location.href = url;
            }
        });
    </script>
    <script src="{{asset('assets/backend/js/dropzone.js')}}"></script>
    @include('backend.partials.media-upload.media-js')
@endsection