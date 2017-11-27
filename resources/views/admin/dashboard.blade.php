@extends('admin.layout')
@section('content')
<div class="row">    
    @include('partials.rating', ['name' => 'Unit','value'=>$rating_by_unit])
    @foreach ($rating_discipline_by_unit as $element)
        @include('partials.rating', ['name' => $element->categoryname,'value'=>$element->rate])
    @endforeach
</div>
<div class="row">
    @include('admin.partials.qa_admin', ['some' => 'data', 'Qnotes' => $Qnotes])
    @if(config("customerindex.santaanita") == \Cache::get('current_index'))
		@include('admin.partials.admin_chart_admin', ['name' => 'R.N vs C.N.A vs L.V.N','from_date'=>\Carbon\Carbon::now()->subDay(7)])
	@else
    	@include('admin.partials.admin_chart_admin', ['name' => 'Nurse vs. Respiratory vs. Rehab','from_date'=>\Carbon\Carbon::now()->subDay(7)])
	@endif
    
</div>
<div class="row">
    <div class="col-md-6 col-xs-12">
        @include('partials.news')
    </div>
    <div class="col-md-6 col-xs-12">
        @include('admin.partials.shift_requests')
    </div>
</div>
<input type="hidden" value="{{ isset($status_pass)?$status_pass:0 }}" id="status_pass">
@endsection
@section('page-script')
    ajust_height("#qa-tab","#admin_chart");
    ajust_height("#news","#shift-request");
@append