@extends('admin.review.layout')
@section('content')
<style>
    body{
        font-family: 'Montserrat', sans-serif;
    }
</style>
<div class="container"   style ="margin-top:60px">
  
    <div class="form-horizontal m-t-20" >
        <div class="text-center" >
            <img id="logo-small" src="{{ url('assets/images/survey/outpatient_thanks.png') }}"
                     alt="Wambi" class="img-responsive" style ="display: block; margin: 0 auto; zoom: 0.75;"/>
        </div>
           <br>
        <div class="text-center">
            <a href="/admin/review/caregivers" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.evaluate_your_caregiver')</a>
            @if(\Cache::get('function_ambassador') != 1 && \Cache::get('function_amada') != 1)
                <a href="/admin/review/exit-survey" class="btn-exit-survey btn-survey btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.patient_satisfaction_survey')</a>
            @endif
        </div>
        <span id="counter" hidden>45</span>
        
    </div>
</div>
@stop
@section('page-script')
var isAmbassador = {{ $isAmbassador }};
function countdown() {
    var i = document.getElementById('counter');
    if (parseInt(i.innerHTML)==0) {
        if(isAmbassador == 1){
            location.href = '/survey/caregivers';
        }else{
            location.href = '/selectunit';
        }
    }
    i.innerHTML = parseInt(i.innerHTML)-1;
}
setInterval(function(){ countdown(); },1000);
@append
