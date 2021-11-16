@extends('layouts.login-screens')

@section('content')
    <div class="login-area">
        <div class="container">
            <div class="login-box ptb--100">

                <form method="POST" action="{{ route('admin.login') }}">
                    {{csrf_field()}}
                    <div class="login-form-head">
                        <div class="logo-wrapper" style="margin-bottom: 40px;">
                            {!! render_image_markup_by_attachment_id(get_static_option('site_white_logo')) !!}
                        </div>
                        <h4>{{__('Admin Login')}}</h4>
                        <p>{{__('Hello there, Sign in and start managing your website')}}</p>
                    </div>
                    @include('backend.partials.message')
                    <div class="error-message"></div>
                    @if($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach($errors->all() as $error)
                                    <li>{{$error}}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <div class="login-form-body">
                        <div class="form-gp">
                            <label for="username">{{__('Username')}}</label>
                            <input type="text" id="username" name="username">
                            <i class="ti-email"></i>
                        </div>

                        <div class="form-gp">
                            <label for="password">{{__('Password')}}</label>
                            <input type="password" id="password" name="password" >
                            <i class="ti-lock"></i>
                        </div>
                        <div class="row mb-4 rmber-area">
                            <div class="col-6">
                                <div class="custom-control custom-checkbox mr-sm-2">
                                    <input type="checkbox" name="remember" class="custom-control-input" id="remember">
                                    <label class="custom-control-label" for="remember">{{__('Remember Me')}}</label>
                                </div>
                            </div>
                            <div class="col-6 text-right">
                                <a href="{{route('admin.forget.password')}}">{{__('Forgot Password?')}}</a>
                            </div>
                        </div>
                        <div class="submit-btn-area">
                            <button id="login_form_submit" type="submit">{{__('Login')}} <i class="ti-arrow-right"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection


@section('scripts')
    <script>
        $(document).ready(function ($){
            $(document).on('click','#login_form_submit',function (e){
                e.preventDefault();
                var el = $(this);
                var erContainer = $(".error-message");
                erContainer.html('');
                el.text('Please Wait..');
                $.ajax({
                    url: "{{route('admin.login')}}",
                    type: "POST",
                    data: {
                        _token : "{{csrf_token()}}",
                        username : $('#username').val(),
                        password : $('#password').val(),
                        remember : $('#remember').val(),
                    },
                    error:function(data){
                        var errors = data.responseJSON;
                        erContainer.html('<div class="alert alert-danger"></div>');
                        $.each(errors.errors, function(index,value){
                            erContainer.find('.alert.alert-danger').append('<p>'+value+'</p>');
                        });
                        el.text('Login');
                    },
                    success:function (data){
                        $('.alert.alert-danger').remove();
                        if (data.status == 'ok'){
                            el.text('Redirecting..');
                            erContainer.html('<div class="alert alert-'+data.type+'">'+data.msg+'</div>');
                            location.reload();
                        }else{
                            erContainer.html('<div class="alert alert-'+data.type+'">'+data.msg+'</div>');
                            el.text('Login');
                        }
                    }
                });
            });
        });
    </script>
@endsection

