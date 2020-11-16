<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>@yield('title')</title>
        <link rel="icon" href="{{URL::asset('/image/2.png')}}" type="image/x-icon">
        <link rel="stylesheet" href="{{ URL::asset('materialize/css/materialize.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('fontawesome/css/all.css') }}" />
        <script src="{{ URL::asset('jquery.min.js') }}"></script>
        <link rel="stylesheet" href="{{ URL::asset('admin.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('w3.css') }}" />
        <link rel="stylesheet" href="{{ URL::asset('toaster.css') }}" />
         <style>
            .active-link{
                background-color: #ccc !important;
            }
        </style>
        @yield('style')
    </head>
    <body>
        <nav class="">
            <div class="nav-wrapper orange">
                  <img src="{{ URL::asset('asset/logo/newLogo.png') }}" width="120" height="100" class="right logo-icon" id="dropbtn" style="margin-right:-24px !important;">
                  <h6 class="right hide-on-med-and-down w3-small w3-padding" style="margin-top:0px">Hi, <b style="text-transform: uppercase">{{  Auth::user()->full_name}}</b></h6>
              <ul id="nav-mobile" class="hide-on-med-and-down" style="margin-left: 120px">
                <li><a href="{{ route('admin.home') }}" class="name">Ohipopo Comprehensive Bilingual High School</a></li>
              </ul>

              <ul id="nav-mobile small" class="hide-on-med-and-up">
                <li style="margin-left: 20px; margin-top: 16px; position: absolute;"><label class="name white-text w3-medium">Ohipopo Comprehensive Bilingual High School</label></li>
              </ul>
            </div>
        </nav>
        <div class="w3-border w3-padding dropdownc dropbtn right"  id="myDropdown">
            <ul class="mydwn">
                <hr class="hide-on-med-and-up coc">
                <a href="#">
                    <span class="mdi-action-account-circle" id="span-in">&nbsp;{{ __('profile') }}
                    </span>
                </a><hr class="coc">
                <a href="#">
                    <span class="mdi-content-create" id="span-in">&nbsp;{{ __('change password') }}
                    </span>
                </a><hr class="coc">
                <a href="#">
                    <span class="mdi-action-supervisor-account" id="span-in">&nbsp;{{ __('users account') }}
                    </span>
                </a><hr class="coc">
            </ul>
            <hr class="coc" style="margin-top:-20px">
            <a href="{{ route('admin.logout') }}">
                <strong id="dropdown-logout"><i class="fa fa-power-off"></i>&nbsp;{{ __('logout') }} <?php $name = explode('_', trim(auth()->user()->full_name)); echo $name[0] ?></strong>
            </a>
         </div>

  <a href="#" data-target="slide-out" class="sidenav-trigger white-text w3-xlarge w3-padding" style="width:40px; margin-top: -60px; position: relative; z-index:10"><i class="fa fa-th"></i></a>

  <ul id="slide-out" class="sidenav" style="transform: translateX(-105%); overflow-y: scroll;">
    <li>
        <div class="">
          <div class="w3-margin-bottom">
              <img src="{{ URL::asset('asset/logo/splash.jpg') }}" alt="Avatar" width="100%" height="200px">
              <h6 class="blue-text center">{{auth()->user()->email}}</h6>
            </div>
        </div>
      </li><hr style="margin-top: 20px !important; border-top:1px solid #dabc5c">
        <ul class="collapsible w3-ul navbar-fixed" style="margin-top:-15px">
            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="classes()" @if(Request::is('admin/create/class')) style="background-color: #ade7d9" @endif><i class="fa fa-asterisk teal-text w3-small"></i> Manage Subjects &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-chevron-down right w3-small" id="class"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #ece7d4">
                        <li><a class="orange-text"  @if( Request::is('admin/create'))  style="background-color: #e5e9e8" @endif  onclick="load()">Add Topics</a></li>
                        <li><a href="" class="orange-text"  @if( Request::is('admin/create/subclass'))  style="background-color: #e9e8e5" @endif  onclick="load()">Add Videos</a></li>
                    </ul>
                </div>
            </li>

            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="subjects()" @if(Request::is('admin/subject', 'admin/subject/all')) style="background-color: #e7d9ad" @endif> &nbsp;<i class="fa fa-graduation-cap teal-text w3-small"></i> Manage Students &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-chevron-down right w3-small" id="subject"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #ece7d4">
                        <li><a href="" class="orange-text w3-small" @if(Request::is('admin/subject')) style="background-color: #e9e8e5" @endif  onclick="load()"> Enroll Students</a></li>
                        <li><a href="" class="orange-text"  @if(Request::is('admin/subject/all')) style="background-color: #e9e8e5" @endif  onclick="load()">Check student status</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="subjects()" @if(Request::is('admin/subject', 'admin/subject/all')) style="background-color: #e7d9ad" @endif> &nbsp;<i class="fa fa-user teal-text w3-small"></i> Manage Teacher &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-chevron-down right w3-small" id="class"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #ece7d4">
                        <li><a href="" class="orange-text w3-small" @if(Request::is('admin/subject')) style="background-color: #e9e8e5" @endif  onclick="load()"> Add Students</a></li>
                        <li><a href="" class="orange-text"  @if(Request::is('admin/subject/all')) style="background-color: #e9e8e5" @endif  onclick="load()">Teacher Subject</a></li>
                    </ul>
                </div>
            </li>


             <li><a href="{{ route('admin.logout') }}"  class="waves-effect waves-light red-text"  onclick="load()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="fa fa-power-off"></span> logout</a></li>
        </ul>
  </ul>

    <div class="cal">
        @include('error')
        @yield('content')
    </div>
        <div id="menu" class="orange" style="height: 800px !important; width: 100% !important; position: fixed !important; top:0px; bottom: 0px; left: 0px; right: 0px; z-index: 1000; opacity:.5 !important">
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

        <div class="footer_one">
            <center>
                <p id="dateField" style="color: white;">&nbsp;</p>
                <p style="text-align: center; color: #fff">&copy;Powered by
                    <a  target="_blank" href ="#" style="color:#00ccff"> Bimeri. Ltd</a>
                </p>
            </center>
        </div>
    <script src="{{ URL::asset('toaster.js') }}"></script>
    <script src="{{ URL::asset('materialize/js/materialize.min.js') }}"></script>
    <script src="{{ URL::asset('myjs.js') }}"></script>
    <script src="{{ URL::asset('sweat_alert.js') }}"></script>
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
                    "timeOut": "9000",
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
