@extends('employee.layout')
@section('content')
    <div class="row">
        @include('employee._rating', ['name' => Auth::user()->name(),'value'=>Auth::user()->rating_view()])
        @include('employee._widget-peck', ['name' => 'Pecks available','value'=>Auth::user()->pecks,'icon'=>'icon-target'])
        @include('partials.widget-panel', ['name' => 'Reviews','value'=>Auth::user()->survey(),'icon'=>'icon-note'])
        @include('partials.widget-panel', ['name' => 'Awards','value'=>AUth::user()->awards(),'icon'=>'icon-trophy'])
    </div>
    @include('partials.reward')
@endsection