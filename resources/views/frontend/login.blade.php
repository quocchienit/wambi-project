@extends('frontend.layout')
@section('content')
    <div class="login-wrapper">
        <form class="form-horizontal" method="post" action="/login" id="login-form">
            {!! csrf_field() !!}
            <div id="logo-login">
                <img src="{{ url('assets/images/logo-frontend-login.png') }}" alt="Wambi"
                     class="img-responsive logo"/>
            </div>
            <div id="login-info">
                {{--<p class="text-center"> @lang('survey.Please_Enter_Your_Login_Details') </p>--}}

                <div class="form-group ">
                    <div class="col-xs-12">
                        <input class="wambi-input" type="text" required="" placeholder="@lang('survey.username')" name="username">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <input class="wambi-input" type="password" required="" placeholder="@lang('survey.password')" name="password">
                    </div>
                </div>
                <div class="form-group text-center">
                    <div class="col-xs-12">
                        <button class="wambi-button btn-login"
                                type="submit" id ="btnsubmit">@lang('survey.login')
                        </button>
                    </div>
                </div>

                <div class="form-group ">
                    <div class="col-xs-12">

                        <div class="radio radio-inline">
                            @lang('survey.i_am_the')
                        </div>
                        <div class="radio wambi-patient radio-inline">
                            <input id="radio-patient" checked name="type" type="radio" value="patient">
                            <label for="radio-patient">
                                @lang('survey.patient')
                            </label>
                        </div>
                        <div class="radio wambi-family radio-inline">
                            <input id="radio-family" name="type" type="radio" value="family_member">
                            <label for="radio-family">
                                @lang('survey.family_member')
                            </label>
                        </div>
                        <div class="radio wambi-other radio-inline">
                            <input id="radio-other" name="type" type="radio" value="other">
                            <label for="radio-other">
                                @lang('survey.other')
                            </label>
                        </div>

                    </div>
                </div>
                <div class ="form-group checkbox">
                    <div class="col-xs-12">                 
                        <div class ="checkbox checkbox-circle">
                            <input id="chkTerm" type ="checkbox" name = "chkTerm">
                              <label for="chkTerm">                   
                                 @lang('survey.i_accept_the')
                              </label>

                            <a href ="javascript:void(0);" id="btnTerm" data-animation="fadein" data-plugin="custommodal"
                                     data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                                     data-target="#term-condition">@lang('survey.term_condition')</a>
                            
                            @if (App::isLocale('es'))                            
                                @include('frontend.term.es')
                            @else
                                @include('frontend.term.en')
                            @endif
                        </div>
                      </div>
                </div>
                <div class="form-group m-t-30 m-b-0">
                    <div class="col-sm-12 text-center">
                        <a href="javascript:void(0);" class="text-dark recover">@lang("survey.dont_know_login_info")</a>
                    </div>
                </div>
            </div>
        </form>
        <form method="post" role="form" class="text-center hidden-form" action="/recover"
              style="display: none;">
            {!! csrf_field() !!}
            <div class="text-center"><span class="icon-lock" style="font-size:50px;"></span></div>
            <p class="text-center"> @lang('survey.Please_Enter_Your_Contact_Details') </p>
            <div class="form-group m-b-0">
                <div class="input-group">
                    <input name='mobile' type="phone" class="form-control" placeholder="Enter Phone Number"
                           required="">
                    <span class="input-group-btn">
							<button type="button" class="btn btn-primary w-sm waves-effect waves-light">
								<i class=" icon-screen-smartphone"></i>
							</button> 
						</span>
                </div>
            </div>
            <div class="form-group m-b-0 m-t-10">
                <div class="input-group">
                    <input name='email' type="email" class="form-control" placeholder="Enter Email" required="">
                    <span class="input-group-btn">
							<button type="button" class="btn btn-primary w-sm waves-effect waves-light">
								<i class="icon-envelope-open"></i>
							</button> 
						</span>
                </div>
            </div>
            <div class="form-group m-t-30 m-b-0">
                <button class="btn btn-rounded btn-success btn-block" >@lang('survey.SUBMIT')</button>
            </div>
            <div class="form-group m-t-30 m-b-0">
                <div class="col-sm-12 text-center">
                    <a href="javascript:void(0);" class="text-dark recover">@lang('survey.Or_go_to_login_section')</a>
                </div>
            </div>

        </form>
    </div>

<a href ="javascript:void(0);" id="btnCheckLogin" data-animation="fadein" data-plugin="custommodal"
                         data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                         data-target="#chkTermCondition"></a>
<!--  Modal content for the above example -->
<div id="chkTermCondition" class="modal fade" role="dialog" aria-labelledby="myLargeModalLabel"
 aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">@lang('survey.Oops')</h4>
            </div>
            <div class="modal-body">
              <p>@lang('survey.Opps_Description')</p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

@stop
@section('page-script')
    $(".recover").click(function(){
    $(this).closest('form').fadeOut('slow',function(){
    $(".hidden-form").removeClass('hidden-form').fadeIn();
    $(this).addClass('hidden-form');
    });
    })    
@append
@section('submit')
var btnsubmit = document.getElementById("btnsubmit");

    btnsubmit.onclick = function()
    {
        if(!document.getElementById("chkTerm").checked)
        {
            document.getElementById("btnCheckLogin").click();
            return false;
        }
    }
@append