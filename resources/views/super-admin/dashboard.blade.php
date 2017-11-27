@extends('admin.layout')
@section('content')
    @if(\Session::get('current_unit')==0)
        <style>
            svg.nvd3-svg{
                height: 85vh;
            }
        </style>
    @endif
<div class="row">
    @include('partials.rating', ['name' => 'Unit','value'=>$rating_by_unit])
    @foreach ($rating_discipline_by_unit as $element)
        @include('partials.rating', ['name' => $element->categoryname,'value'=>$element->rate])
    @endforeach
</div>
<div class="row">
    @include('admin.partials.qa')
    @if(config("customerindex.santaanita") == \Cache::get('current_index'))
	 	@include('admin.partials.admin_chart', ['name' => 'R.N vs C.N.A vs L.V.N','from_date'=>\Carbon\Carbon::now()->subDay(7)])
	@else
    	@include('admin.partials.admin_chart', ['name' => 'Nurse vs Rehab vs Respiratory','from_date'=>\Carbon\Carbon::now()->subDay(7)])
	@endif
</div>
<div class="row">
    <div class="col-lg-6">
        @include('partials.news')
    </div>
	 <div class="col-lg-6">
	    @include('partials.awards_request')
	</div>
</div>
<input type="hidden" value="{{ isset($status_pass)?$status_pass:0 }}" id="status_pass">
<!-- end row -->
@endsection
@section('page-script')
    ajust_height("#qa-tab","#admin_chart");
    ajust_height("#news","#awards_request");
@append