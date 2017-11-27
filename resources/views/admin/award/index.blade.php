@extends('admin.layout')
@section('content')
<div class="row">
	@include('partials.awards')
</div>	
@if (Auth::user()->role->type == 'super-admin' ||
	Auth::user()->role->type == 'super-executive')
<div class="row">
	@include('partials.awards_request')
</div>
@endif
@stop
