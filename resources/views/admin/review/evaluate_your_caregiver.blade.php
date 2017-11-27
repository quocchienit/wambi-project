@extends('admin.review.layout')
@section('content')
    <div class="container">
        <div class="content_div">
            <div>
                <img id="logo-big" class="img-responsive" src="{{ url('assets/images/logo-home.png') }}"
                     alt="Wambi"/>
            </div>

                <p style="color: #5f5f5f;font-family: Quicksand !important;font-size: 16px;font-weight: bold;padding: 15px 0 0;text-align: center;text-transform: capitalize;">Recognizing Compassionate Care</p>

            <div class="text-center selection">
                <a href="/admin/review/caregivers" class="btn-survey btn-survey-caregivers btn btn-inverse btn-custom btn-rounded waves-effect waves-light" style="margin-bottom: 10px; margin-top: -13px;">@lang('survey.evaluate_your_caregiver')</a><br />
            </div>
        </div>
    </div>
@stop