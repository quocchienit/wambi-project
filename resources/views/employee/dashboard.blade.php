@extends('employee.layout')
@section('content')
    <div class="row">
        @include('employee._rating', ['name' => Auth::user()->name(),'value'=>Auth::user()->rating_view()])
        @include('employee._widget-peck', ['name' => 'Pecks available','value'=>Auth::user()->pecks,'icon'=>'icon-target'])
        @include('partials.widget-panel', ['name' => 'Reviews','value'=>Auth::user()->survey(),'icon'=>'icon-note'])
        @include('partials.widget-panel', ['name' => 'Awards','value'=>Auth::user()->awards(),'icon'=>'icon-trophy'])
    </div>
    <div class="row">
        {{--@if(Cache::get('function_amada') && Cache::get('function_amada')==1)--}}
            {{--@include('partials.qa_amada', ['Q' => $Q, 'Qnotes' => $Qnotes])--}}
            {{--@include('partials.employee-chart-amada', ['employee'=>Auth::user(),'from_date'=>\Carbon\Carbon::now()->subDay(6)])--}}
        {{--@else--}}
            @include('partials.qa', ['Q' => $Q, 'Qnotes' => $Qnotes])
            @include('partials.employee-chart', ['employee'=>Auth::user(),'from_date'=>\Carbon\Carbon::now()->subDay(6)])
        {{--@endif--}}
    </div>
    <div class="row">
        <div class="col-lg-6">
            @include('partials.news')
        </div>
        <div class="col-lg-6">
            @include('partials.available_shifts')
        </div>
    </div>
    <input id="info-check" type="hidden" value="{{$flash_message}}">
    <input type="hidden" value="{{ isset($status_pass)?$status_pass:0 }}" id="status_pass">
    <!-- end row -->
@endsection

@section('page-script')
    ajust_height("#employee-performance-breakdown","#performance-chart");
    ajust_height("#news","#available-shift");
    $(window).load(function () {
        var info = $('#info-check').val();
        if (info == 'Success') {
            $('#info-check').val('ok');
            console.log(info);
            swal({
                title: "Success!",
                text: "Your photo has been sent to your manager. Please wait for it to be approved. Thank you!",
                type: "success",
                showCancelButton: false,
                showConfirmButton: true,
                cancelButtonClass: 'btn-primary btn-md waves-effect'
            });
        }
    });
@append