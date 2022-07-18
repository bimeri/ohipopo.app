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
            i.i{
                margin-left: 80%;
                position: absolute;
            }
        </style>
        @yield('style')
    </head>
    <body>
        <nav class="">
            <div class="nav-wrapper orange">
                  <img src="{{ URL::asset('asset/logo/newLogo.png') }}" width="120" height="100" class="right logo-icon" id="dropbtn" style="margin-right:-24px !important;">
                  <h6 class="right hide-on-med-and-down w3-small w3-padding" style="margin-top:0px">Hi, <b style="text-transform: uppercase">{{ Auth::user()->full_name }}</b></h6>
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

  <ul id="slide-out" class="sidenav" style="transform: translateX(-105%); overflow-y: auto;">
    <li>
        <div class="">
          <div class="w3-margin-bottom">
              <img src="{{ URL::asset('asset/logo/splash.jpg') }}" alt="Avatar" width="100%" height="200px">
              <h6 class="blue-text center">{{auth()->user()->email}}</h6>
            </div>
        </div>
      </li><hr style="margin-top: 16px !important; border-top:1px solid #dabc5c">
        <ul class="collapsible w3-ul navbar-fixed" style="margin-top:-20px">
            <li><a class="orange-text center" href="{{ route('admin.home') }}" @if( Request::is('admin/home', 'admin/addSubject'))  style="background-color: #e5e9e8" @endif  onclick="load()">Home <i class="fa fa-home"></i></a></li>
            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="classes()" @if(Request::is('admin/addTopic', 'admin/add/topic', 'admin/video', 'admin/video/add')) style="background-color: #ade7d9" @endif><i class="fa fa-asterisk teal-text w3-small"></i> Manage Subjects <i class="fa fa-chevron-down i w3-small" id="class"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #f8f8f8">
                        <li><a class="orange-text" href="{{ route('topic.add') }}"  @if( Request::is('admin/addTopic', 'admin/add/topic'))  style="background-color: #e5e9e8" @endif  onclick="load()">Add Topics</a></li>
                        <li><a href="{{ route('admin.addVideos') }}" class="orange-text"  @if( Request::is('admin/video', 'admin/video/add'))  style="background-color: #e9e8e5" @endif  onclick="load()">Add Videos</a></li>
                    </ul>
                </div>
            </li>

            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="subjects()" @if(Request::is('admin/subject', 'admin/subject/all')) style="background-color: #e7d9ad" @endif><i class="fa fa-graduation-cap teal-text w3-small"></i> Manage Students <i class="fa fa-chevron-down i w3-small" id="subject"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #f8f8f8">
                        <li><a href="" class="orange-text w3-small" @if(Request::is('admin/subject')) style="background-color: #e9e8e5" @endif  onclick="load()"> Enroll Students</a></li>
                        <li><a href="" class="orange-text"  @if(Request::is('admin/subject/all')) style="background-color: #e9e8e5" @endif  onclick="load()">Check student status</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="collapsible-header waves-effect waves-orange" onclick="teachers()" @if(Request::is('admin/subject', 'admin/subject/all')) style="background-color: #e7d9ad" @endif><i class="fa fa-user teal-text w3-small"></i> Manage Teacher <i class="fa fa-chevron-down i w3-small" id="teacher"></i></div>
                <div class="collapsible-body">
                    <ul class="w3-border w3-padding" style="background-color: #f8f8f8">
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

        <div class="footer_one center">
                <p id="dateField" style="color: white;">&nbsp;</p>
                <p style="text-align: center; color: #fff">&copy;Powered by
                    <a  target="_blank" href ="#" style="color:#000"> Bimeri. Ltd</a>
                </p>
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
          <script>
            $('#hides').hide();
           function getSubjects(){
               $('#hides').hide();
               $('#menu').show();
               $('#subj').empty();
               $('#message').empty();
               var levelId = document.getElementById('level').value;
               $.ajax({
                   type: "post",
                   url: "{{ route('class.get.subject') }}",
                   dataType: 'json',
                   data: {
                       '_token': '{{ csrf_token() }}',
                       info: levelId
                   },
                   success: function(res){
                       console.log('the response is', res);
                       if(res.length > 0) {
                       $('#subj').append(res);
                       } else {
                           $('#message').append('<h5 class="red-text center">The selected class has no registered subject, please go to home page and add more subjects to the class. <a href="{{ route("admin.home") }}" class="blue-text">click here..</a></h5>')
                       $('#subj').append("<option value=''>Class has no subjects</option>");
                       }
                        $('#menu').hide();
                   },
                   error: function(error){
                        $('#menu').hide();
                       console.log("some error occur", error);
                   }
               });
           }
           function showInput(){
               $('#hides').show();
           }

           function selectTopics(){
              $('#menu').show();
               $('#topics').empty();
               $('#message').empty();
               var subjectId = document.getElementById('subj').value;
               $.ajax({
                   type: "post",
                   url: "{{ route('subject.getTopic') }}",
                   dataType: 'json',
                   data: {
                       '_token': '{{ csrf_token() }}',
                       info: subjectId
                   },
                   success: function(res){
                       console.log('the response is', res);
                       if(res.length > 0) {
                       $('#topics').append(res);
                       } else {
                           $('#message').append('<h5 class="red-text center">The selected subject has no registered topic, add topic(s) first</h5>')
                       $('#topics').empty();
                       $('#topics').append("<option value=''>Subject has no topic</option>");
                       }
                        $('#menu').hide();
                   },
                   error: function(error){
                        $('#menu').hide();
                       console.log("some error occur", error);
                   }
               });
           }
       </script>
    </body>
</html>
