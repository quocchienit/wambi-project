@section('page-script')
var page = 1;
var notification_wrap = $(".notification-list").slimScroll();
var slimscroll = function(e, pos){
    if(pos=='bottom'){
        notification_wrap.unbind();
        $.ajax({
            {{-- @if (Auth::user()->etid == 2) --}}
            url: '{{route("employee::notifications")}}',
            {{-- @endif --}}
            type: 'post',
            dataType: 'json',
            data: {page:page},
        })
        .done(function(data) {
            if(data.total>0){
                notification_wrap.append(data.html);
                notification_wrap.bind('slimscroll', slimscroll);
            }
        })
        page++;
    }
};
notification_wrap.bind('slimscroll', slimscroll);

$("#notifications").on("click",'.notifications',function(){
    var _ = $(this);
    $.ajax({
        url: '{{route("notifications::mark_read")}}',
        type: 'post',
        dataType: 'json',
    })
    .done(function() {
        $('.notification_count').text('');
        _.removeClass('notifications');
    })
});
$(".mark_all_as_read").on("click",function(){
    $.ajax({
        url: '{{route("notifications::mark_read")}}',
        type: 'post',
        dataType: 'json',
        data:{'read':true}
    })
    .done(function() {
        $('.notification_count').text('');
        $(".notification-list a").remove();
        $(this).removeClass("mark_all_as_read");
    })
});
$(".notification-list").on("click","a",function(e){
    {{-- e.stopPropagation(); --}}
    var _ = $(this);
    if(_.data('id')!='undefined')
        $.ajax({
            url: '{{route("notifications::mark_read")}}',
            type: 'post',
            dataType: 'json',
            data: _.data(),
        })
    .done(function() {
        _.removeClass('NOT_SEEN').removeClass('SEEN_BUT_UNREAD');
    })
});
$(document).ready(function(){
  $('.dropdown-submenu a.menu-superadmin').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});

@append
<!-- Navigation Bar-->
<header id="topnav">
    <div class="topbar-main">
        <div class="container">
            <!-- Logo container-->
            <div class="logo">
                <img src="{{ url('') }}/assets/images/logo-admin-top.png" alt="Wambi"
                                              class="img-responsive"/>
            </div>
            <!-- End Logo container-->            
            <div class="menu-extras">
                <ul class="nav navbar-nav navbar-right pull-right">
                    <li class="navbar-c-items dropdown">
                        <a href="#" data-toggle="dropdown"><i class="icon-home"></i></a>
                        <ul class="dropdown-menu dropdown-menu-lg home-ul">
                            @if(Auth::user()->etid == 2)
                            <li><a href="/employee/">Home</a></li>
                            @else
                            <li><a href="/admin/">Home</a></li>
                            @endif
                        </ul>
                    </li>
                    <li class="dropdown navbar-c-items" id="notifications">
                        <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light notifications"
                           data-toggle="dropdown" aria-expanded="true">
                            <i class="icon-bell"></i>
                            <span class="badge badge-xs badge-danger notification_count">{{ @$total_notifications?$total_notifications:'' }}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg">
                            <li class="notifi-title">Notification</li>
                            <li class="list-group  slimscroll-noti notification-list">
                                <!-- list item-->
                                @include('employee.notifications.item')
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="list-group-item text-right mark_all_as_read">
                                    <small class="font-600">Mark all as read</small>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown navbar-c-items">
                        <a href="#" class="dropdown-toggle waves-effect waves-light profile" data-toggle="dropdown"
                           aria-expanded="true">
                            <img src="{{ Auth::user()->photo() }}" alt="user-img" class="img-circle"/>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/employee/settings" tabindex="-1"><i class="icon-user m-r-5"></i> {{ Auth::user()->name() }}</a></li>                                                        
                            @if (Auth::user()->type() =='super-admin' || Auth::user()->type() =='super-executive')                
                            <li class="dropdown-submenu" style="position:relative;">
                                <a class="menu-superadmin" href="#" tabindex="-1"><i class="fa fa-gear m-r-5"></i> Settings </a>
                                <ul class="dropdown-menu" style="top:0; right:100%;margin-top:-1;">
                                    @if(Auth::user()->type() =='super-executive' && \Cache::get('function_amada') != 1)
                                        <li><a href="/admin/list"><i class="fa fa-list m-r-5"></i>List Facilities/Units</a></li>
                                	@endif
                                   
                                    <li><a href="/admin/listdiscipline"><i class="fa fa-list m-r-5"></i>List Disciplines/Job Title</a></li>
                                    <li><a href="/admin/translations"><i class="fa fa-language m-r-5"></i> Translations</a></li>
                                    <li><a href="/admin/faqs"><i class="fa fa-comments-o m-r-5"></i> FAQs</a></li>
                                    <li><a href="/admin/config"><i class="fa ion-edit m-r-5"></i> Customizable elements</a></li>
									<li><a href="/admin/cpc-url"><i class="fa ion-edit m-r-5"></i> URL Carepostcard</a></li>
                                    <li><a href="/admin/import"><i class="fa ion-arrow-down-a m-r-5"></i> Import Data</a></li>
                              		<li><a href="{{ route('admin::survey::index') }}"><i class="fa fa-list m-r-5"></i>Review Questions</a></li>
                              </ul>
                            </li>                            
                            @endif
                            <li><a href="{{ route('changePassword') }}" tabindex="-1"><i class="ti-key m-r-5"></i> Change Password</a></li>
                            <li><a href="{{ route('logout') }}" tabindex="-1"><i class="ti-power-off m-r-5"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
                @if (Auth::check()&&(Auth::user()->isAdmin() || Auth::user()->isPatient() || Auth::user()->isEmployee() || Auth::user()->isShift()))
                <div class="menu-item">
                    {{-- Mobile menu toggle --}}
                    <a class="navbar-toggle">
                        <div class="lines">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </a>
                    {{-- End mobile menu toggle --}}
                </div>
                @endif

                @if (Auth::user()->type()=='super-admin' || (\Cache::get('function_amada') == 1 && Auth::user()->type()=='super-executive'))
                <div class="container">                
                @if(isset($units))
                <form class="form-horizontal navbar-right app-search form-before" method="post"
                      action="{{ route('admin::set_unit') }}">                    
                    {!! csrf_field() !!}                    
                    <label class="col-md-4 control-label font-white label-dropdow">Select Unit</label>
                    <div class ="col-md-8 col-xs-12" style="margin-bottom: 10px;">
                        <select class="select2 form-control" name="current_unit" onchange="this.form.submit()"
                                data-placeholder="Select unit" style="background-color: #ffffff;color: #444;border-radius: 5px;height: 36px;width: 100%; text-align: center; text-align-last: center; padding-left: 45px;font-size: 14px;">
                            @if(isset($units))
                                @if(\Cache::get('function_amada') != 1 || Auth::user()->type()=='super-executive')
                                {
                                    <option value="0" {{ (Session::has('current_unit')&&Session::get('current_unit')==0)?'selected':'' }}>All</option>
                                }
                                @endif
                                @foreach ($units as $element)
                                    <option value="{{ $element->key }}" {{ (Session::has('current_unit')&&Session::get('current_unit')==$element->key)?'selected':'' }}>{!! $element->value !!} </option>
                                @endforeach
                            @elseif(\Cache::get('function_amada') != 1)
                                <option value="0">All</option>
                            @endif
                        </select>
                    </div>
                </form>
                @endif
                </div>           
                @elseif(isset($facs)&& (Auth::user()->type() =='super-executive' && \Cache::get('function_amada') != 1))
                <form class="form-horizontal navbar-right app-search pull-right form-before" method="post"
                      action="{{ route('admin::set_fac') }}">
                    {!! csrf_field() !!}                    
                    <label class="col-md-4 control-label font-white label-dropdow">Select Facility</label>
                    <div class ="col-md-8">
                        <select class="select2 form-control" name="current_fac" onchange="this.form.submit()"
                                data-placeholder='Select Facility' style="background-color: #ffffff;color: #444;border-radius: 5px;height: 36px;width: 100%;text-align: center; text-align-last: center; padding-left: 45px;font-size: 14px;">
                                
                            @if(isset($showAll) && $showAll == 1)
                                <option value="0" {{ isset($unitAll)&& $unitAll == 1?'selected':'' }}>All</option>
                            @endif
                            @if(isset($unitAll)&& $unitAll == 1){
                                @foreach ($facs as $element)
                                    <option value="{{ $element->key }}">{!! $element->value !!} </option>
                                @endforeach                            
                            }
                            @else{
                                @foreach ($facs as $element)
                                <option value="{{ $element->key }}" {{ (Session::has('current_fac')&&Session::get('current_fac')==$element->key)?'selected':'' }}>{!! $element->value !!} </option>
                                @endforeach                            
                            }
                            @endif                            
                        </select>
                    </div>
                </form>                
                @endif
            </div>
        </div>

        @if (Auth::user()->type()=='super-admin' || 
        (\Cache::get('function_amada') == 1 && Auth::user()->type()=='super-executive'))

            <div class="container">
                <form class="form-horizontal app-search form-after" method="post"
                      action="{{ route('admin::set_unit') }}">
                    {!! csrf_field() !!}
                    <div class ="col-xs-12" style="margin-bottom: 10px;">
                        <select class="select2 form-control" name="current_unit" onchange="this.form.submit()"
                                data-placeholder='Select unit' style="background-color: #ffffff;color: #444;border-radius: 5px;height: 36px;width: 100%;text-align: center; text-align-last: center; padding-left: 45px;font-size: 14px;">
                            @if(isset($units))
                                {{--@if(isset($showAll) && $showAll == 1)--}}
                                    @if(\Cache::get('function_amada') != 1)
                                    <option value="0" {{ isset($unitAll)&& $unitAll == 1?'selected':'' }}>All</option>
                                    @endif
                                {{--@endif--}}
                                @if(isset($unitAll)&& $unitAll == 1)
                                    @foreach ($units as $element)
                                        <option value="{{ $element->key }}" {{ ( !isset($unitAll) || $unitAll != 1) && (Session::has('current_unit')&&Session::get('current_unit')==$element->key) ?'selected':'' }}>{!! $element->value !!} </option>
                                    @endforeach
                                @else
                                    @foreach ($units as $element)
                                    <option value="{{ $element->key }}" {{ (Session::has('current_unit')&&Session::get('current_unit')==$element->key)?'selected':'' }}>{!! $element->value !!} </option>
                                    @endforeach
                                @endif
                            @endif
                        </select>
                    </div>
                </form>
            </div>
        @elseif(isset($facs)&&Auth::user()->type() =='super-executive')
            <div class="container">     
                <form class="form-horizontal navbar-right app-search form-after" method="post"
                      action="{{ route('admin::set_fac') }}">
                    {!! csrf_field() !!}                    
                    <label class="col-md-4 control-label font-white label-dropdow">Select Facility</label>
                    <div class ="col-md-8">
                        <select class="select2 form-control" name="current_fac" onchange="this.form.submit()"
                                data-placeholder='Select Facility' style="background-color: #ffffff;color: #444;border-radius: 5px;height: 36px;width: 100%;text-align: center; text-align-last: center; padding-left: 45px;font-size: 14px;">
                                
                            @if(isset($showAll) && $showAll == 1)
                                <option value="0" {{ isset($unitAll)&& $unitAll == 1?'selected':'' }}>All</option>
                            @endif
                            @if(isset($unitAll)&& $unitAll == 1){
                                @foreach ($facs as $element)
                                    <option value="{{ $element->key }}">{!! $element->value !!} </option>
                                @endforeach                            
                            }
                            @else{
                                @foreach ($facs as $element)
                                <option value="{{ $element->key }}" {{ (Session::has('current_fac')&&Session::get('current_fac')==$element->key)?'selected':'' }}>{!! $element->value !!} </option>
                                @endforeach                            
                            }
                            @endif                            
                        </select>
                    </div>
                </form> 
            </div>
        @endif
    </div>
    {{-- check role --}}
    @if (Auth::check()&&Auth::user()->isAdmin())
        <div class="navbar-custom">
            <div class="container">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">
                        <li class="has-submenu @if(Request::is('admin')) active @endif">
                            <a href="{{route('admin::dashboard')}}"><i class="icon-home"></i>Home</a>
                        </li>
                        <li class="has-submenu @if(Request::is('admin/shift*')) active @endif">
                            <a href="{{route('admin::shift::index')}}"><i class="icon-clock"></i>Shifts</a>
                            <ul class="submenu">
                                <li><a href="{{route('admin::shift::add')}}">Post Available Shift</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu @if(Request::is('admin/award*')) active @endif">
                            <a href="{{ route('admin::award::index') }}"><i class="icon-trophy"></i>Awards</a>
                            <ul class="submenu">
                                <li><a href="{{ route('admin::award::add') }}">Post Award</a></li>
                            </ul>
                        </li>
                        <li class="has-submenu @if(Request::is('admin/news*')) active @endif">
                            <a href="{{ route('admin::news::index') }}"><i class="icon-speech"></i>Newsfeed</a>
                            <ul class="submenu">
                                <li><a href="{{ route('admin::news::add') }}">Add Newsfeed</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu @if(Request::is('admin/employee*')) active @endif">
                            <a href="{{ route('admin::employee::index') }}"><i class="icon-people"></i>Employees</a>
                            <ul class="submenu">
                                <li><a href="{{ route('admin::employee::add') }}">Add Employee</a></li>
                            </ul>
                        </li>

                        @if (Auth::user()->type()=='super-admin' || Auth::user()->type()=='super-executive')
                            <li class="has-submenu @if(Request::is('admin/patient*')) active @endif">
                                <a href="{{ route('admin::patient::index') }}"><i class="icon-people"></i>Patients</a>
                                <ul class="submenu">
                                    <li><a href="{{ route('admin::patient::add') }}">Add Patients</a></li>
                                </ul>
                            </li>

                            @if(\Cache::get('function_ambassador') == 1)
                            <li class="has-submenu @if(Request::is('admin/ambassador*')) active @endif">
                                <a href="{{ route('admin::ambassador::index') }}"><i class="icon-people"></i>Ambassadors</a>
                                <ul class="submenu">
                                    <li><a href="{{ route('admin::ambassador::add') }}">Add Ambassadors</a></li>
                                </ul>
                            </li>
                            @endif

                            <li class="has-submenu @if(Request::is('admin/data*')) active @endif">
                                <a href="{{ route('admin::data') }}"><i class="icon-graph"></i>Data</a>
                            </li>
                          @endif
                          @if (Auth::user()->type()=='super-admin' || Auth::user()->type()=='super-executive' || Auth::user()->type()=='admin')
                            <!--- Comments -->
                            <li class="has-submenu @if(Request::is('admin/comments*')) active @endif">
                                <a href="{{ route('admin::comments') }}"><i class="icon-bubbles"></i>Comments</a>
                            </li>
                            <!--- End Comments -->
                           @endif
                           		
                           @if (Auth::user()->type()=='super-admin' || Auth::user()->type()=='super-executive'  || Auth::user()->type()=='admin')
                            <li class="has-submenu @if(Request::is('admin/review*')) active @endif">
                                <a href="{{ route('admin::review::index') }}"><i class="icon-note"></i>Reviews</a>
                            </li>
                           @endif
                           @if (Auth::user()->type()=='super-admin' || Auth::user()->type()=='super-executive')
                            <li class="has-submenu @if(Request::is('admin/reward*')) active @endif">
                                <a href="{{ route('admin::reward::index') }}"><i class="fa-gift fa"></i>Rewards</a>
                            </li>
                        @endif
                        @if(isset($print_status))
                            @if($print_status)
                            <li class="pull-right">
                                <a class="btn btn-default btn-print" href="{{ url('admin/employee/print-view/'.$employee->id) }}">Print View</a>
                            </li>
                            @else
                            <li class="pull-right">
                                <a class="btn btn-default btn-print" onclick="window.print()">Print</a>
                            </li>
                            @endif
                        @endif
                    </ul>
                    <!-- End navigation menu  -->
                    @if (Auth::user()->role->type != 'super-admin' && Auth::user()->type() !='super-executive' && Auth::user()->type() !='employee-manager'
                    			&& Auth::user()->type() !='patient-manager'
                    			&& Auth::user()->type() !='scheduling-manager')
                        <ul class="navigation-menu navbar-right">
                            <li class="pecks">
                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                    <div class="text-center text" style ="padding:0px;padding-right:10px">
                                        <h1 class="text-dark" style ="margin:0px;margin-bottom: 5px;">
                                            <b class="counter" id="employee-pecks">
                                                {{ Auth::user()->pecks }}
                                            </b>
                                        </h1>
                                        <p class="text-muted">Pecks</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="text-center">
                                    <div>
                                        <span class="fa fa-gift fa-3x"></span>
                                    </div>
                                    <a href="{{route('admin::reward::index')}}" class="btn btn-info">REWARDS</a>
                                </div>
                            </li>
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    @elseif(Auth::check() && (Auth::user()->isPatient() || Auth::user()->isEmployee() || Auth::user()->isShift()))
        <div class="navbar-custom">
            <div class="container">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">                        
                        @if(Auth::user()->isShift())
                        <li class="has-submenu @if(Request::is('admin/shift*')) active @endif">
                            <a href="{{route('admin::shift::index')}}"><i class="icon-clock"></i>Shifts</a>
                            <ul class="submenu">
                                <li><a href="{{route('admin::shift::add')}}">Post Available Shift</a></li>
                            </ul>
                        </li>
                        @elseif(Auth::user()->isEmployee())
                        <li class="has-submenu @if(Request::is('admin/employee*')) active @endif">
                            <a href="{{ route('admin::employee::index') }}"><i class="icon-people"></i>Employees</a>
                            <ul class="submenu">
                                <li><a href="{{ route('admin::employee::add') }}">Add Employee</a></li>
                            </ul>
                        </li>
                        @elseif(Auth::user()->isPatient())
                            <li class="has-submenu @if(Request::is('admin/patient*')) active @endif">
                                <a href="{{ route('admin::patient::index') }}"><i class="icon-people"></i>Patients</a>
                                <ul class="submenu">
                                    <li><a href="{{ route('admin::patient::add') }}">Add Patients</a></li>
                                </ul>
                            </li>

                            @if(\Cache::get('function_ambassador') == 1)
                            <li class="has-submenu @if(Request::is('admin/ambassador*')) active @endif">
                                <a href="{{ route('admin::ambassador::index') }}"><i class="icon-people"></i>Ambassadors</a>
                                <ul class="submenu">
                                    <li><a href="{{ route('admin::ambassador::add') }}">Add Ambassadors</a></li>
                                </ul>
                            </li>
                            @endif
                        @endif
                    </ul>
                    <!-- End navigation menu  -->
                    @if (Auth::user()->role->type != 'super-admin' && Auth::user()->type() !='super-executive' && Auth::user()->type() !='employee-manager'
                    			&& Auth::user()->type() !='patient-manager'
                    			&& Auth::user()->type() !='scheduling-manager')
                        <ul class="navigation-menu navbar-right">
                            <li class="pecks">
                                <div class="widget-bg-color-icon card-box fadeInDown animated">
                                    <div class="text-center text" style ="padding:0px;padding-right:10px">
                                        <h1 class="text-dark" style ="margin:0px;margin-bottom: 5px;">
                                            <b class="counter" id="employee-pecks">
                                                {{ Auth::user()->pecks }}
                                            </b>
                                        </h1>
                                        <p class="text-muted">Pecks</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                            <li>
                                <div class="text-center">
                                    <div>
                                        <span class="fa fa-gift fa-3x"></span>
                                    </div>
                                    <a href="{{route('admin::reward::index')}}" class="btn btn-info">REWARDS</a>
                                </div>
                            </li>
                        </ul>
                    @endif
                </div>
            </div>
        </div>
    @endif
</header>
<!-- End Navigation Bar-->
