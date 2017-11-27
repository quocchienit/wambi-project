
@extends('frontend.layout')
@section('content')	
	{{--
	<div class="text-center" style="font-size: 40px;margin-top:5px;">
		@lang('survey.thanks')
	</div>
	<div class="text-center" style="font-size: 13px;margin-top:5px;">
		@lang('survey.feedbacks')
	</div>	
	<div class="text-center">
		<img src="/assets/images/survey/thank.png" class="centeredd"  alt="">	
	</div>
	<div class="text-center">
		<a href="/survey" class="btn btn-primary"><i class="icon-home"></i> @lang('survey.home')</a>
	</div>
	<div class="text-center" style="font-size: 13px;margin-top:5px;">
		@lang('survey.gohome')
	</div>
		--}}
		
		

<div class="container">
    <div class ="imgoutpatient top-left">
        <img src="{{ url("/assets/images/survey/outpatient.png") }}" alt="" class="img-responsive">
    </div>
    <div class="form-horizontal m-t-20" >
        
        <!--<div class="text-center" style="font-size: 40px;margin-top:5px;">
            @lang('survey.thanks')
        </div>-->
        
        <div class="text-center" >
            <img id="logo-small" src="{{ url('assets/images/survey/outpatient_thanks.png') }}"
                     alt="Wambi" class="img-responsive" style ="display: block; margin: 0 auto; zoom: 0.75;"/>
        </div>
         <!--<div class="text-center text-thanks">
            @lang('survey.hospital_mission_statement')
        </div>-->
        <!--
            <p style="text-transform: uppercase;text-align: center;padding:40px;font-size:20px;color:#aaa;">We appreciate your feedback so that you can get the highest quality of care for your patient. Please fill out this brief 5 questions survey and your caregivers will be rewarded accordingly for their perfomance. Thank you!</p>
            -->
            
           <br>
        <div class="text-center ">
            <a href="/survey/caregivers" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.evaluate_your_caregiver')</a>
            @if(\Cache::get('function_ambassador') != 1 && \Cache::get('function_amada') != 1)
                <a href="/survey/exit-survey" class="btn-exit-survey btn-survey btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.patient_satisfaction_survey')</a>
            @endif
        </div>
        <span id="counter" hidden>45</span>
        
    </div>
</div>

@section('page-script')
function countdown() {
    var i = document.getElementById('counter');
    if (parseInt(i.innerHTML)==0) {
        location.href = '/survey/caregivers';
    }
    i.innerHTML = parseInt(i.innerHTML)-1;
}
setInterval(function(){ countdown(); },1000);
@append
@stop
	
	
