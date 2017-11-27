
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Wambi is a transformative SaaS platform that provides a mutually beneficial solution for patients and their families, Care Provider, and administrative users.">
    <meta name="author" content="Coderthemes">

    <link rel="shortcut icon" href="{{url('')}}/assets/images/favicon_1.ico">
	@if(config("customerindex.santaanita") == \Cache::get('current_index'))
		<title>Santa Anita</title>
	@else
    	<title>Wambi</title>
	@endif
    

    <link href="{{url('')}}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="{{url('')}}/assets/css/custom.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="{{url('')}}/assets/js/modernizr.min.js"></script>
        
    </head>
    <body>

        <div class="account-pages"></div>
        <div class="clearfix"></div>
        <div class="wrapper-page">
        	<div class=" card-box">
                <div class="panel-heading"> 
                    <img src="{{ url('') }}/assets/images/logo.png" alt="Wambi" class="img-responsive"/>
                </div> 

                <div class="panel-body">
                    @yield('content')
                </div>   
            </div>                              
        </div>       

        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="{{url('')}}/assets/js/jquery.min.js"></script>
        <script src="{{url('')}}/assets/js/bootstrap.min.js"></script>
        <script src="{{url('')}}/assets/js/detect.js"></script>
        <script src="{{url('')}}/assets/js/fastclick.js"></script>
        <script src="{{url('')}}/assets/js/jquery.slimscroll.js"></script>
        <script src="{{url('')}}/assets/js/jquery.blockUI.js"></script>
        <script src="{{url('')}}/assets/js/waves.js"></script>
        <script src="{{url('')}}/assets/js/wow.min.js"></script>
        <script src="{{url('')}}/assets/js/jquery.nicescroll.js"></script>
        <script src="{{url('')}}/assets/js/jquery.scrollTo.min.js"></script>


        <script src="{{url('')}}/assets/js/jquery.core.js"></script>
        <script src="{{url('')}}/assets/js/jquery.app.js"></script>
        <!-- Parsly js -->
        <script type="text/javascript" src="{{url('')}}/assets/plugins/parsleyjs/parsley.min.js"></script>
        <script>
            jQuery(document).ready(function($) {
                @yield('script')
            });            
        </script>
        <!-- Switch divs on click-->    	
    </body>
    </html>