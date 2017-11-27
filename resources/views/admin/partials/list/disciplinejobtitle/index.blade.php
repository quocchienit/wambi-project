@extends('admin.layout')
@section('content')
<div class ="row">
	<div class="config-10">        
		<ul class="nav nav-tabs navtab-bg nav-justified">
			<li class="active">
				<a href="#disciplines" data-toggle="tab" aria-expanded="true">
					<span class="hidden-xs">DISCIPLINES</span></a>
			</li>
			<li class="">
				<a href="#jobtitle" data-toggle="tab" aria-expanded="false">
					<span class="hidden-xs">JOB TITLE</span></a>
			</li>			
		</ul>	
		<div class="tab-content">
			<div class="tab-pane active" id="disciplines">	
				@include('admin.partials.list.disciplinejobtitle._disciplines')
			</div>
			<div class="tab-pane" id="jobtitle">
				@include('admin.partials.list.disciplinejobtitle._jobtitle')
			</div>			
		</div>		
	</div>
</div>
@stop