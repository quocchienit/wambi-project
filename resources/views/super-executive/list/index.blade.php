@extends('admin.layout')
@section('content')
<div class ="row">
	<div class="config-10">        
		<ul class="nav nav-tabs navtab-bg nav-justified">
			<li class="active">
				<a href="#facility" data-toggle="tab" aria-expanded="true">
					<span class="hidden-xs">FACILITIES</span></a>
			</li>
			<li class="">
				<a href="#units" data-toggle="tab" aria-expanded="false">
					<span class="hidden-xs">UNITS</span></a>
			</li>			
		</ul>	
		<div class="tab-content">
			<div class="tab-pane active" id="facility">	
				@include('super-executive.list._facility')
			</div>
			<div class="tab-pane" id="units">
				@include('super-executive.list._unit')
			</div>			
		</div>		
	</div>
</div>
@stop