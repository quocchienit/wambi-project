<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Wambi is a transformative SaaS platform that provides a mutually beneficial solution for patients and their families, caregivers, and administrative users.">
    <meta name="author" content="Coderthemes">
    <meta name="csrf-token" content="{{ csrf_token() }}"/>

    <link rel="shortcut icon" href="{{url("assets/images/favicon_1.ico")}}">

    <title>Wambi</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <!-- Animation css -->
    <link href="{{url("assets/plugins/animate/animate.min.css") }}" rel="stylesheet" type="text/css"/>
    <!-- Sweet Alert -->
    <link href="{{url("assets/plugins/sweetalert/dist/sweetalert.css") }}" rel="stylesheet" type="text/css">
    <link href="{{url("assets/css/bootstrap.min.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/core.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/components.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/plugins.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/icons.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/pages.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/responsive.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/survey.css")}}" rel="stylesheet" type="text/css"/>
    <link href="{{url("assets/css/ddstylefr.css")}}" rel="stylesheet" type="text/css"/>
   	<link href="{{url('assets/plugins/select2/css/select2.min.css')}}" rel="stylesheet"/>
    <!-- Sweet Alert -->
    <link href="{{url("assets/plugins/switchery/dist/switchery.min.css")}}" rel="stylesheet">        
    <style type="text/css" media="screen">
        body {
            font-family: 'Roboto', sans-serif;
            max-width: 1300px;
            margin: 0 auto;
            overflow-x: hidden;
        }
        html{
            background: none;
        }
        .mix {
            display: none;
        }
        @yield('style')
    </style>
    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script src="{{url("assets/js/modernizr.min.js")}}"></script>

</head>
<body class="wambi-survey @if(Session::has('patient')) logged-in @endif">
<div class="">
<div class="wambi-backgroud"></div>
@if(Session::has('patient'))
    <!--
       	 <div class="container">
                <div class="pull-right" style="margin-top:3px;">
                    <a href="/survey/logout" class="btn btn-info" style="font-size:12pt;">
                        <span class="icon-close" ></span> EXIT
                    </a>
                </div>
                <div class="clearfix"></div>
            </div>
        -->
    <div class="containers" id="patient-panel" style="{{ isset($page) && $page === 'comment'?'display: none;':'display: block;' }}">
        
         <div class="pull-right" >            
            <a href="/survey/logout" >
                <button id="logout" classs="btn btn-danger btn-custom btn-rounded waves-effect waves-light" type="button">X</button>
            </a>
        </div>
        <div class="pull-right" >
            <a href ="javascript:void(0);" data-animation="fadein" data-plugin="custommodal"
                                     data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                                     data-target="#accordion-modal-help" >
                <button id="help" classs="btn btn-info btn-custom btn-rounded waves-effect waves-light"><span class ="ti-help-alt" style ="margin-top:2px;"></span></button>
                
             </a>
             <!--Help modal-->
             <div id="accordion-modal-help" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; z-index:999999;">
                                <div class="modal-dialog">
                                    <div class="modal-content p-0">
                                        <div class="panel-group panel-group-joined" id="accordion-test">
                                            @foreach($qa as $item)
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion-test" href="#{{$item->qaid}}" class="collapsed">
                                                                @if (App::isLocale('en')) 
                                                                    {{strip_tags($item->question)}}
                                                                @elseif(!isset($item->q_es) || trim($item->q_es)=='')                                                                     
                                                                    {{strip_tags($item->question)}}
                                                                @else
                                                                    {{strip_tags($item->q_es)}}
                                                                @endif
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="{{$item->qaid}}" class="panel-collapse collapse in">
                                                        <div class="panel-body">
                                                            @if (App::isLocale('en')) 
                                                                    {{strip_tags($item->anwser)}}
                                                            @elseif(!isset($item->a_es) || trim($item->a_es)=='')
                                                                {{strip_tags($item->anwser)}}
                                                            @else 
                                                                {{strip_tags($item->a_es)}}
                                                            @endif
                                                        </div>
                                                    </div>
                                                </div>
                                                @endforeach
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                        <!--Help modal-->
         </div>
        <div class="clearfix"></div>
    </div>
@endif
@yield('content')
</div>
<script>
    var resizefunc = [];
</script>

<!-- jQuery  -->
<script src="{{url("assets/plugins/switchery/dist/switchery.min.js")}}"></script>
<script src="{{url("assets/js/jquery.min.js")}}"></script>
<script src="{{url("assets/js/bootstrap.min.js")}}"></script>
<script src="{{url("assets/js/detect.js")}}"></script>
<script src="{{url("assets/js/fastclick.js")}}"></script>
<script src="{{url("assets/js/jquery.slimscroll.js")}}"></script>
<script src="{{url("assets/js/jquery.blockUI.js")}}"></script>
<script src="{{url("assets/js/waves.js")}}"></script>
<script src="{{url("assets/js/wow.min.js")}}"></script>
<script src="{{url("assets/js/jquery.nicescroll.js")}}"></script>
<script src="{{url("assets/js/jquery.scrollTo.min.js")}}"></script>
<script src="{{url("assets/plugins/select2/js/select2.full.js")}}"></script>
<script src="{{url('assets/js/match-height.js')}}"></script>
<!-- Sweet-Alert  -->
<script src="{{ url("assets/plugins/sweetalert/dist/sweetalert.min.js") }}"></script>
<script src="{{url('assets/plugins/canvas/html2canvas.js')}}"></script>
<script src="{{url('assets/plugins/canvas/canvas2image.js')}}"></script>
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" type="text/javascript" charset="utf-8"></script> --}}
<script src="{{url("assets/plugins/jquery-mixitup/jquery.mixitup.min.js")}}"></script>
<script src="{{url("assets/js/jquery.core.js")}}"></script>
<script src="{{url("assets/js/jquery.app.js")}}"></script>
<script src="{{url("assets/js/ddJs.js")}}"></script>
<script>
    jQuery(document).ready(function ($) {
        $('.select2').select2();

        function abso() {
            if($(window).width()<1025){
                var height = parseInt($('#contentLetter').width())*381/532-24;
            }else if($(window).width()>753){
                var height = parseInt($('#contentLetter').width())*381/532-73;
            }else{
                var height = parseInt($('#contentLetter').width())*381/532-37;
            }
            $('#caregiver_content').css('height',height);
            $('textarea[name=comment]').css('height',height+88);
        }
        $(window).resize(function() {
            abso();
        });
        abso();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        @yield('page-script')
    });
    // buton submit
    @yield('submit')
</script>
</body>
</html>