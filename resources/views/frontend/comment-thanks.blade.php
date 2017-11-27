@extends('frontend.layout')
@section('content')
    <style>
        body{
            font-family: 'Montserrat', sans-serif;
        }
    </style>
    <div class="row comment-new">
        <div class="col-md-6 col-xs-12" style="border-right: 2px solid #0099FF">
            <div class="imgoutpatient">
                <img src="{{ url("/assets/images/survey/outpatient.png") }}" alt="" class="img-responsive">
            </div>
            <div class="skip hidden-mobile">
                <a href="/survey/thanks-completed"><span>Skip</span> <i class="ion-arrow-right-c"></i></a>
            </div>
            <div class="button_and_or hidden-xs hidden-sm">
                <button>AND/OR</button>
            </div>
            <div class="comment-box">
                <form class="form-horizontal group-border-dashed" action="{{route('survey::comment') }}" method="post" accept-charset="utf-8">
                    {!! csrf_field() !!}
                    <input type="hidden" name="cpc_status" value="1">
                    <div class="form-group text-center title-comment">
                        <h3 class="title text-center">Want to share more?</h3>
                        <p class="text-center content">Enter any additional comments you have here</p>
                    </div>
                    <div class="form-group comment-textarea">
                        <textarea rows="20" name="comment" type="text" class="text-comment"
                                  placeholder="Everything you share here will remain anonymous unless you select to be contacted below..."></textarea>
                    </div>
                    <div class="form-group comment-footer">
                        <div class="switchery-demo">
                            <input type="checkbox" name="contact" data-plugin="switchery" data-color="#4c5667"
                                   data-size="small" id="info">
                            <lable style="color: #000000;">&emsp;@lang('survey.check_box_contact')</lable>
                        </div>
                        <div class ="visiabled" style ="display:none;">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <input type="text" name ="firstname" parsley-trigger="change" placeholder ="First Name" class ="form-control text-name">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name ="lastname" parsley-trigger="change" placeholder ="Last Name" class ="form-control text-name">
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <div class ="col-sm-12">
                                    <input type="text" name ="phonenumber" placeholder ="Phone Number" class ="form-control text-info">
                                    <p>@lang('survey.Or')</p>
                                    <input type="text" parsley-trigger="change" name ="email" data-parsley-type="email" name="email" type="text" placeholder="Email" class ="form-control">
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary waves-effect waves-light"
                                type="submit">@lang('survey.SUBMIT')</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-6 col-xs-12">
            <div class="skip hidden-desktop">
                <a href="/survey/thanks-completed"><span>Skip</span> <i class="ion-arrow-right-c"></i></a>
            </div>
            <div class="form-horizontal" >
                <div class="text-center complete-content">
                    <img id="logo-small" src="{{ url('assets/images/survey/outpatient_thanks.png') }}"
                         alt="Wambi" class="img-responsive" style ="display: block; margin: 0 auto; zoom: 0.75;"/>
                </div>
                <br>
                <div class="text-center ">
                    <a href="/survey/caregivers" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.evaluate_your_caregiver')</a>
                    @if(\Cache::get('function_ambassador') != 1)
                        <a href="/survey/exit-survey" class="btn-exit-survey btn-survey btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.patient_satisfaction_survey')</a>
                    @endif
                </div>
                <span id="counter" hidden>45</span>

            </div>
        </div>
    </div>
@stop
@section('page-script')
    $('#info').change(function () {
        if (this.checked) {
            $('.visiabled').fadeIn('slow');
            $('.text-name').attr('required', 'true');
        }
        else {
            $('.visiabled').fadeOut('slow');
            $('.text-name').removeAttr('required');
        }
    });
    $('.text-info').keypress(function validate(evt) {
        var theEvent = evt || window.event;
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
        var regex = /[0-9]|\./;
        if (!regex.test(key)) {
            theEvent.returnValue = false;
            if (theEvent.preventDefault) theEvent.preventDefault();
        }
    });
@append