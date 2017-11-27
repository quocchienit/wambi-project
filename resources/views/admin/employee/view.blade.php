@extends('admin.layout')
@section('content')
<div class="row">
    @include('employee._rating', ['name' => $employee->name(),'value'=>$employee->rating_view()])
    @include('partials.widget-icon', ['name' => 'Reviews','value'=>$employee->survey(),'icon'=>'icon-pencil'])
    @include('partials.widget-icon', ['name' => 'Pecks available','value'=>$employee->pecks,'icon'=>'icon-target'])
    @include('partials.widget-icon', ['name' => 'Awards','value'=>$employee->awards(),'icon'=>'icon-trophy'])
</div>
<div class="row">
	{{--
    @if(Cache::get('function_amada') && Cache::get('function_amada')==1)
        @include('partials.qa_amada', ['Q' => $Q])
        @include('partials.employee-chart-amada', ['employee'=>$employee,'from_date'=>\Carbon\Carbon::now()->subDay(7),'chart_title'=>"Employee’s performance vs The Total Unit's performance",'your_performance'=>"Employee’s performance"])
    @else
        @include('partials.qa', ['Q' => $Q])
        @include('partials.employee-chart', ['employee'=>$employee,'from_date'=>\Carbon\Carbon::now()->subDay(7),'chart_title'=>"Employee’s performance vs The Total Unit's performance",'your_performance'=>"Employee’s performance"])
    @endif
    --}}
    @include('partials.qa', ['Q' => $Q])
    @include('partials.employee-chart', ['employee'=>$employee,'from_date'=>\Carbon\Carbon::now()->subDay(7),'chart_title'=>"Employee’s performance vs The Total Unit's performance",'your_performance'=>"Employee’s performance"])

</div>
@endsection
@section('page-script')
    ajust_height("#employee-performance-breakdown","#performance-chart");    
@append