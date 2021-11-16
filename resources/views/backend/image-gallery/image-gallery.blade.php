@extends('backend.admin-master')
@section('site-title')
    {{__('Image Gallery')}}
@endsection
@section('style')
    <link rel="stylesheet" href="{{asset('assets/backend/css/dropzone.css')}}">
    <link rel="stylesheet" href="{{asset('assets/backend/css/media-uploader.css')}}">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
    <style>
        .dataTables_wrapper .dataTables_paginate .paginate_button{
            padding: 0 !important;
        }
        div.dataTables_wrapper div.dataTables_length select {
            width: 60px;
            display: inline-block;
        }
    </style>
@endsection
@section('content')
    <div class="col-lg-12 col-ml-12 padding-bottom-30">
        <div class="row">
            <!-- basic form start -->
            <div class="col-lg-12">
                <div class="margin-top-40"></div>
                @include('backend.partials.message')
                @if($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach($errors->all() as $error)
                                <li>{{$error}}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
            </div>

            <div class="col-lg-6 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">{{__('Image Gallery')}}</h4>
                        <div class="bulk-delete-wrapper">
                            <div class="select-box-wrap">
                                <select name="bulk_option" id="bulk_option">
                                    <option value="">{{{__('Bulk Action')}}}</option>
                                    <option value="delete">{{{__('Delete')}}}</option>
                                </select>
                                <button class="btn btn-primary btn-sm" id="bulk_delete_btn">{{__('Apply')}}</button>
                            </div>
                        </div>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            @php $a=0; @endphp
                            @foreach($all_gallery_images as $key => $image)
                                <li class="nav-item">
                                    <a class="nav-link @if($a == 0) active @endif"  data-toggle="tab" href="#slider_tab_{{$key}}" role="tab" aria-controls="home" aria-selected="true">{{get_language_by_slug($key)}}</a>
                                </li>
                                @php $a++; @endphp
                            @endforeach
                        </ul>
                        <div class="tab-content margin-top-40" >
                            @php $b=0; @endphp
                            @foreach($all_gallery_images as $key => $galleries)
                                <div class="tab-pane fade @if($b == 0) show active @endif" id="slider_tab_{{$key}}" role="tabpanel" >
                                    <div class="table-wrap table-responsive">
                                        <table class="table table-default" id="all_blog_table">
                                            <thead>
                                            <th class="no-sort">
                                                <div class="mark-all-checkbox">
                                                    <input type="checkbox" class="all-checkbox">
                                                </div>
                                            </th>
                                            <th>{{__('ID')}}</th>
                                            <th>{{__('Title')}}</th>
                                            <th>{{__('Image')}}</th>
                                            <th>{{__('Category')}}</th>
                                            <th>{{__('Action')}}</th>
                                            </thead>
                                            <tbody>
                                            @foreach($galleries as $data)
                                                <tr>
                                                    <td>
                                                        <div class="bulk-checkbox-wrapper">
                                                            <input type="checkbox" class="bulk-checkbox" name="bulk_delete[]" value="{{$data->id}}">
                                                        </div>
                                                    </td>
                                                    <td>{{$data->id}}</td>
                                                    <td>{{$data->title}}</td>
                                                    <td> @php
                                                            $testimonial_img = get_attachment_image_by_id($data->image,null,true);
                                                        @endphp
                                                        @if (!empty($testimonial_img))
                                                            <div class="attachment-preview">
                                                                <div class="thumbnail">
                                                                    <div class="centered">
                                                                        <img class="avatar user-thumb" src="{{$testimonial_img['img_url']}}" alt="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            @php  $img_url = $testimonial_img['img_url']; @endphp
                                                        @endif
                                                    </td>
                                                    <td>{{get_image_category_name_by_id($data->cat_id)}}</td>
                                                    <td>
                                                        <a tabindex="0" class="btn btn-danger btn-xs mb-3 mr-1"
                                                           role="button"
                                                           data-toggle="popover"
                                                           data-trigger="focus"
                                                           data-html="true"
                                                           title=""
                                                           data-content="
                                                           <h6>{{__('Are you sure to delete this Image?')}}</h6>
                                                           <form method='post' action='{{route('admin.gallery.delete',$data->id)}}'>
                                                           <input type='hidden' name='_token' value='{{csrf_token()}}'>
                                                           <br>
                                                            <input type='submit' class='btn btn-danger btn-sm' value='{{__('Yes,Please')}}'>
                                                            </form>
                                                            ">
                                                            <i class="ti-trash"></i>
                                                        </a>
                                                        <a href="#"
                                                           data-toggle="modal"
                                                           data-target="#testimonial_item_edit_modal"
                                                           class="btn btn-lg btn-primary btn-xs mb-3 mr-1 testimonial_edit_btn"
                                                           data-id="{{$data->id}}"
                                                           data-title="{{$data->title}}"
                                                           data-imageid="{{$data->image}}"
                                                           data-image="{{$img_url}}"
                                                           data-lang="{{$data->lang}}"
                                                           data-catid="{{$data->cat_id}}"
                                                        >
                                                            <i class="ti-pencil"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                @php $b++; @endphp
                            @endforeach
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-6 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title">{{__('Add New Image')}}</h4>
                        <form action="{{route('admin.gallery.new')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group">
                                <label for="lang">{{__('Languages')}}</label>
                                <select name="lang" class="form-control">
                                    @foreach($all_languages as $lang)
                                        <option value="{{$lang->slug}}" @if($lang->slug == get_default_language()) selected @endif>{{$lang->name}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="title">{{__('Title')}}</label>
                                <input type="text" name="title" id="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="cat_id">{{__('Category')}}</label>
                                <select name="cat_id" class="form-control">
                                    @foreach($all_categories as $cat)
                                        <option value="{{$cat->id}}" >{{$cat->title}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="image">{{__('Image')}}</label>
                                <div class="media-upload-btn-wrapper">
                                    <div class="img-wrap"></div>
                                    <input type="hidden" name="image">
                                    <button type="button" class="btn btn-info media_upload_form_btn" data-btntitle="Select Image" data-modaltitle="Upload Image" data-toggle="modal" data-target="#media_upload_modal">
                                        {{__('Upload Image')}}
                                    </button>
                                </div>
                                <small>{{__('1000x1000 px image recommended')}}</small>
                            </div>
                            <button type="submit" class="btn btn-primary mt-4 pr-4 pl-4">{{__('Add New Image')}}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="testimonial_item_edit_modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('Edit Testimonial Item')}}</h5>
                    <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                </div>
                <form action="{{route('admin.gallery.update')}}" id="testimonial_edit_modal_form"  method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        @csrf
                        <input type="hidden" name="id" id="gallery_id" value="">
                        <div class="form-group">
                            <label for="lang">{{__('Languages')}}</label>
                            <select name="lang" class="form-control">
                                @foreach($all_languages as $lang)
                                    <option value="{{$lang->slug}}" >{{$lang->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">{{__('Title')}}</label>
                            <input type="text" name="title" id="edit_title" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="cat_id">{{__('Category')}}</label>
                            <select name="cat_id" class="form-control">
                                @foreach($all_categories as $cat)
                                    <option value="{{$cat->id}}" >{{$cat->title}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="image">{{__('Image')}}</label>
                            <div class="media-upload-btn-wrapper">
                                <div class="img-wrap"></div>
                                <input type="hidden" id="edit_image" name="image" value="">
                                <button type="button" class="btn btn-info media_upload_form_btn" data-btntitle="Select Image" data-modaltitle="Upload Image" data-toggle="modal" data-target="#media_upload_modal">
                                    {{__('Upload Image')}}
                                </button>
                            </div>
                            <small>{{__('1000x1000 px image recommended')}}</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Close')}}</button>
                        <button type="submit" class="btn btn-primary">{{__('Save Changes')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @include('backend.partials.media-upload.media-upload-markup')
@endsection
@section('script')

    <script>
        $(document).ready(function () {

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
                        'url' : "{{route('admin.gallery.bulk.action')}}",
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

            $(document).on('click','.testimonial_edit_btn',function(){
                var el = $(this);
                var id = el.data('id');
                var image = el.data('image');
                var imageid = el.data('imageid');
                var catid = el.data('catid');
                var lang = el.data('lang');

                var form = $('#testimonial_edit_modal_form');
                form.find('#gallery_id').val(id);
                form.find('#edit_title').val(el.data('title'));
                form.find('select[name="lang"] option[value="'+lang+'"]').attr('selected',true);
                $.ajax({
                    url : "{{route('admin.gallery.category.by.lang')}}",
                    type: "POST",
                    data: {
                        _token : "{{csrf_token()}}",
                        lang: lang
                    },
                    success:function (data) {
                        form.find('select[name="cat_id"]').html('');
                        $.each(data,function (index,value) {
                            var selected = value.id == catid ? 'selected' : '';
                            form.find('select[name="cat_id"]').append('<option '+selected+' value="'+value.id+'">'+value.title+'</option>');
                        })
                    }
                });
                form.find('select[name="lang"] option[value="'+lang+'"]').attr('selected',false);

                if(imageid != ''){
                    form.find('.media-upload-btn-wrapper .img-wrap').html('<div class="attachment-preview"><div class="thumbnail"><div class="centered"><img class="avatar user-thumb" src="'+image+'" > </div></div></div>');
                    form.find('.media-upload-btn-wrapper input').val(imageid);
                    form.find('.media-upload-btn-wrapper .media_upload_form_btn').text('Change Image');
                }
            });
            $(document).on('change','select[name="lang"]',function (e) {
                e.preventDefault();
                var el = $(this);
                var selectedLang = $(this).val();
                $.ajax({
                    url : "{{route('admin.gallery.category.by.lang')}}",
                    type: "POST",
                    data: {
                        _token : "{{csrf_token()}}",
                        lang: selectedLang
                    },
                    success:function (data) {
                        var galCat = $('select[name="cat_id"]');
                        galCat.html('');
                        $.each(data,function (index,value) {
                            galCat.append('<option value="'+value.id+'">'+value.title+'</option>');
                        })
                    }
                });
            });
        });
    </script>
    <!-- Start datatable js -->
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="//cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="//cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.table-wrap > table').DataTable( {
                "order": [[ 1, "desc" ]],
                'columnDefs' : [{
                    'targets' : 'no-sort',
                    'orderable' : false
                }]
            } );
        } );
    </script>
    <script src="{{asset('assets/backend/js/dropzone.js')}}"></script>
    @include('backend.partials.media-upload.media-js')
@endsection
