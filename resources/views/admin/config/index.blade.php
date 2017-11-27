@extends('admin.layout',['config' => '1'])
@section('content')
<div class ="row">
	<div class="config-10 col-md-offset-1">        
		<ul class="nav nav-tabs navtab-bg">
			<li class="active">
				<a href="#section" data-toggle="tab" aria-expanded="true">
					<span class="hidden-xs">SELECT UNIT</span></a>
			</li>
			<li class="">
				<a href="#survey" data-toggle="tab" aria-expanded="false">
					<span class="hidden-xs">SURVEY PECK VALUES</span></a>
			</li>
			<li class="">
				<a href="#shift" data-toggle="tab" aria-expanded="false">
					<span class="hidden-xs">SHIFT PECK VALUES</span></a>
			</li>
			<li class="">
				<a href="#performance" data-toggle="tab" aria-expanded="false">					
					<span class="hidden-xs">PERFORMANCE BREAKDOWN BENCHMARK VALUES</span></a>
			</li>
			<li class=""><a href="#award" data-toggle="tab" aria-expanded="false">				
				<span class="hidden-xs">AWARD TYPES</span></a>
			</li>
			<li class=""><a href="#patient" data-toggle="tab" aria-expanded="false">
				<span class="hidden-xs">ALERTS</span></a>
			</li>
		</ul>	
		<div class="tab-content">
			<div class="tab-pane active" id="section">	
				@include('admin.config.section')
			</div>
			<div class="tab-pane" id="survey">	
				@include('admin.config.survey')
			</div>
			<div class="tab-pane" id="shift">
				@include('admin.config.shift')
			</div>
			<div class="tab-pane" id="performance">
				@include('admin.config.performance')
			</div>
			<div class="tab-pane" id="award">
					@include('admin.config.award.unit')
					@include('admin.config.award.employee')
			</div>
			<div class="tab-pane" id="patient">
				@include('admin.config.patient')
			</div>
		</div>		
	</div>
</div>
@stop
@section('page-script-selected')
	$(".vertical-spin").TouchSpin({
	    verticalbuttons: true,
	    verticalupclass: 'ion-plus-round',
	    verticaldownclass: 'ion-minus-round'
	});
	var vspinTrue = $(".vertical-spin").TouchSpin({
	    verticalbuttons: true
	});
	if (vspinTrue) {
	    $('.vertical-spin').prev('.bootstrap-touchspin-prefix').remove();
	}
	$("input[name='survey']").TouchSpin({ 
					min: 0,
		            max: 20000,
		            step: 1
		            });
	$("input[name='ugent']").TouchSpin({ 
					min: 0,
		            max: 20000,
		            step: 1
		            });	
	$("input[name='performance']").TouchSpin({
		            min: 0,
		            max: 20000,
		            step: 1,
		            decimals: 0,
		            boostat: 5,
		            maxboostedstep: 10,
		            postfix: '%'
		        });

    
@append
