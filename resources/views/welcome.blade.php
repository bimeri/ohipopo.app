<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ __('Ohipopo.org') }}</title>
        <!-- Fonts -->
        <link rel="icon" href="{{URL::asset('/asset/logo/newLogo.png')}}" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <link rel="stylesheet" href="{{ URL::asset('materialize/css/materialize.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('fontawesome/css/all.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('mycss.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('w3.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('toaster.css') }}" />
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    </head>
    <body>
        @if(Auth::guard('admin')->check())
        <script>
          window.location="/admin/home";
        </script>
        @endif
        @if(Auth::guard('teacher')->check())
        <script>
          window.location="/teacher/home";
        </script>
        @endif
            <div class="cont col s12 m4 offset-m4" style="border-radius: 10px !important">
                <div class="moda">
                    <form method="get" action="{{ route('user.login') }}">
                        {{ csrf_field() }}
                        <div class="card-action orange lighten-1 white-text" style="height: 150px">
                            <center>
                                <img src="{{ URL::asset('asset/logo/newLogo.png') }}" class="w3-center" alt="logo" height="140" width="200">
                            </center>
                            <h6 class="center" style="margin-top: -20px">Enter your credentials to login</h6>
                        </div>
                        @if(count($errors) > 0)
                        <center>
                            <div class="w3-container red-text w3-card-8 w3-margin-top materialize-red lighten-4" style="display: block; position: relative; z-index: 30">
                                <span onclick="this.parentElement.style.display='none'" class="close right w3-padding-16 w3-margin-top" style="cursor: pointer">x</span>
                                <ul id="error" class="w3-margin w3-padding">
                                    @foreach($errors->all() as $error)
                                        <li style="text-align: center;">{{ $error }} </li>
                                    @endforeach  <center><i class="mdi-action-thumb-down" style="font-size: 25px;"></i></center>
                                </ul>
                            </div>
                        </center>
                        @endif

                        <div class="card-content w3-padding">
                            <div class="form-field input-field">
                                <i class="fa fa-pen prefix small orange-text"></i>
                                <input type="text" name="user_name" class="validate" id="username" value="{{ old('user_name') }}">
                                <label for="username">Enter your user name</label>
                            </div>
                            <div class="form-field input-field">
                                <i class="fa fa-lock prefix small orange-text"></i>
                                <input type="password" name="password" class="validate" id="password" value="">
                                <label for="password">Password</label>
                            </div><br>
                            <div class="form-field">
                                <p class="left">
                                    <label>
                                    <input type="checkbox" name="remember" id="remember" value="{{ old('rememberMe') }}"/>
                                    <span>Remember me</span>
                                    <label style="color: transparent">dvbrstvf rgbwsr gtghber hte therg ergsr h3egerg h</label>
                                    </label>
                                </p>
                                <p class="right">
                                    <label class="w3-large"><a class="teal-text w3-medium">forgot password</a>&nbsp;&nbsp; <i class="fa fa-unlock-alt"></i></label>
                                </p>
                            </div><br>
                        </div>
                            <div class="form-field">
                                <button class="btn orange waves-effect waves-blues" onclick="load()" style="width: 100%">Login</button>
                            </div>
                        </div>
                    </form>
              </div>

              {{-- <form action="post" method="{{ route('try.me') }}">
                {{ csrf_field() }}
                <input type="text" name="name">
                <button type="submit" class="btn btn-primary">try me</button>
            </form> --}}

            <div id="menu" class="orange" style="height: 800px !important; width: 100% !important; position: fixed !important; top:0px; bottom: 0px; left: 0px; right: 0px; z-index: 1000; opacity:0.5 !important">
                <div class="w3-margin-top">
                    <center>
                        <div class="preloader-wrapper big active spinner-white" style="margin-top: 220px !important;">
                            <div class="spinner-layer spinner-white-only">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div>
                                <div class="gap-patch">
                                    <div class="circle"></div>
                                </div>
                                <div class="circle-clipper right">
                                    <div class="circle"></div>
                                </div>
                            </div>
                        </div>
                    </center>
                </div>
            </div>

        <div class="footer_one center">
            <p id="dateField" style="color: white;">&nbsp;</p>
            <p style="text-align: center; color: #fff">&copy;Powered by
                <a target="_blank" href ="#" style="color:#000"> Bimeri. Ltd</a>
            </p>
        </div>
         <script src="{{ URL::asset('toaster.js') }}"></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="{{ URL::asset('materialize/js/materialize.min.js') }}"></script>
    <script src="{{ URL::asset('myjs.js') }}"></script>

    <script>
        @if(Session::has('message'))
          var type = "{{ Session::get('alert-type', 'info') }}";
          toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": true,
                "progressBar": false,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
                }
          switch(type){
              case 'info':
                  toastr.info("{{ Session::get('message') }}");
                  break;

              case 'warning':
                  toastr.warning("{{ Session::get('message') }}");
                  break;

              case 'success':
                  Command: toastr["success"]("{{ Session::get('message') }}")
                  break;

              case 'error':
                  toastr.error("{{ Session::get('message') }}");
                  break;
          }
        @endif
      </script>
    </body>
</html>
