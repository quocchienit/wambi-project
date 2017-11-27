@extends('admin.layout')
@section('content')
<div class="row">
    @include('employee._rating', ['name' => $employee->name(),'value'=>$employee->rating_view()])
    @include('partials.widget-icon', ['name' => 'Reviews','value'=>$employee->survey(),'icon'=>'icon-pencil'])
    @include('partials.widget-icon', ['name' => 'Pecks','value'=>$employee->pecks,'icon'=>'icon-target'])
    @include('partials.widget-icon', ['name' => 'Awards','value'=>$employee->awards(),'icon'=>'icon-trophy'])
</div>
<div class="row">
    @include('partials.qa', ['Q' => $Q])
    @include('partials.employee-chart', ['employee'=>$employee,'from_date'=>\Carbon\Carbon::now()->subDay(7),'chart_title'=>"Employee’s performance vs The Total Unit's performance",'your_performance'=>"Employee’s performance"])
</div>
<div class="row">
    <div class="col-lg-12">
    @include('partials.news')
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
    @include('partials.awards_request')
    </div>
</div>
@endsection
@section('page-script')
    ajust_height("#employee-performance-breakdown","#performance-chart");
    ajust_height("#qa-tab","#admin_chart");
@append