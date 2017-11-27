@extends('frontend.layout')
@section('content')
    <div class="container">
        <div class="content_div">
            <div>
                <img id="logo-big" class="img-responsive" src="{{ url('assets/images/logo-home.png') }}"
                     alt="Wambi"/>
            </div>

                <p style="color: #5f5f5f;font-family: Quicksand !important;font-size: 16px;font-weight: bold;padding: 15px 0 0;text-align: center;text-transform: capitalize;">Recognizing Compassionate Care</p>

            <div class="text-center selection">
                <a href="/login" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light" style="margin-bottom: 10px; margin-top: -13px;">@lang('survey.evaluate_your_caregiver')</a><br />
                @if(\Cache::get('function_ambassador') != 1 && \Cache::get('function_amada') != 1)
                    <a href="/survey/exit-survey" class="btn-exit-survey btn-survey btn btn-inverse btn-custom btn-rounded waves-effect waves-light">@lang('survey.patient_satisfaction_survey')</a>
                @endif
            </div>
                @if(config("customerindex.out_patient") != \Cache::get('current_index') && config("customerindex.santaanita") != \Cache::get('current_index'))
            <div class="text-center selection_language">
                @if (App::isLocale('en'))
                    <a href="/locale/es" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light">Español</a>
                @else
                    <a href="/locale/en" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light">English</a>
                @endif
            </div>
                @endif
        </div>
    </div>
@stop