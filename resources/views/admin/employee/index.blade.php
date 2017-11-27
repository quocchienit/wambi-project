@extends('admin.layout')
@section('content')
@if (Auth::user()->type()=='admin')
	@include('admin.partials.admin_top')
@endif
<div class="row">
	<div class="col-lg-12">        
		@include('admin.partials.employees')
	</div>
	<div class="col-lg-12">        
		@include('admin.partials.employees_request_photo',['employees_photo'=>$employees_photo])
	</div>
	<div class="col-lg-12">
		<?php $employees_bio = \App\Employee::where('bio_new','<>',null)->get(); ?>
		@include('admin.partials.employees_request_bio',['employees_bio'=>$employees_bio])
	</div>
</div>
@stop
