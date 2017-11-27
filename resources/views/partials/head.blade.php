<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="Wambi is a transformative SaaS platform that provides a mutually beneficial solution for patients and their families, Care Provider, and administrative users.">
    <meta name="author" content="Wambi">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <link rel="shortcut icon" href="{{ URL('')}}/assets/images/favicon_1.ico">
    
    @yield('meta')
   @if(config("customerindex.santaanita") == \Cache::get('current_index'))
		<title>Santa Anita @yield('title')</title>
	@else
    	<title>Wambi @yield('title')</title>
	@endif
    
    <link href="{{ URL('')}}/assets/plugins/cropper/cropper.css" rel="stylesheet" type="text/css">
    <!-- Sweet Alert -->
    <link href="{{ URL('')}}/assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css">
    <link href="{{ URL('')}}/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css">
    @if((isset($survey) && $survey == 1) || (isset($config) && $config == 1) || (isset($dd_config) && $dd_config == 1))
    <link href="{{ URL('')}}/assets/plugins/sweetalert/dist/sweetalert2.css" rel="stylesheet" type="text/css">
    @endif
    <link href="{{ URL('')}}/assets/plugins/nvd3/build/nv.d3.min.css" rel="stylesheet" type="text/css">
    <link href="{{ URL('')}}/assets/plugins/multiselect/css/multi-select.css"  rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" />
    <link href="{{ URL('')}}/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- DataTables -->
    <link href="{{ URL('')}}/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="{{ URL('')}}/assets/plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <!-- Summernote css -->
    <link href="{{ URL('')}}/assets/plugins/summernote/summernote.css" rel="stylesheet" />

    <!--Color picker-->
    <link href="{{ URL('')}}/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">

    <!-- TouchSpin -->
    <link href ="{{URL('')}}/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel ="stylesheet"/>
    <!-- Sweet Alert -->
    <link href="{{url("assets/plugins/switchery/dist/switchery.min.css")}}" rel="stylesheet">        
    
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="{{ URL('')}}/assets/plugins/morris/morris.css">
    <!--Chartist Chart CSS -->
    <link rel="stylesheet" href="{{ URL('')}}/assets/plugins/chartist/dist/chartist.min.css">

    <link href="{{ URL('')}}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/css/custom.css?ver=1.0.0" rel="stylesheet" type="text/css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
    <link href="{{ URL('')}}/assets/css/ddstyle.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/plugins/password-meter/strengthify.css" rel="stylesheet" type="text/css" />
    <link href="{{ URL('')}}/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="{{ URL('')}}/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="{{ URL('')}}/assets/plugins/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">
    <link href="{{ URL('')}}/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->    
    <script src="{{ URL('')}}/assets/js/modernizr.min.js"></script>    
    <script src="{{ URL('')}}/assets/plugins/d3/d3.min.js"></script>
    <script src="{{ URL('')}}/assets/plugins/nvd3/build/nv.d3.min.js"></script>   
    <script src="{{ URL('')}}/assets/plugins/cropper/cropper.js"></script>

    <!--Script color picker-->
    <script src="{{ URL('')}}/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>  
   	<!--Customize Amada, with Colorado Unit-->  
	@if(\Session::get('current_unit') == 3  && \Cache::get('function_amada') == 1 && 
		(Auth::user()->type() =='super-admin' || Auth::user()->type() =='super-executive'  || Auth::user()->type() =='admin'))
	<link href="{{ URL('')}}/assets/css/colorado.css" rel="stylesheet">
	@endif
	
</head>
