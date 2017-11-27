@extends('admin.layout')
@section('content')
<style>
	.content{
		margin-left: 200px;
		margin-right: 200px;
		border: 1px solid #ddd;
		padding: 20px;
	}
	.performance-report-md,
	.individual-report-md{
		z-index: 20000;
	}
	.dt-button:hover{
		cursor: pointer;
	}
</style>
<div class="col-lg-12">
	<ul class="nav nav-tabs navtab-bg nav-justified">
		<li class="active">
			<a href="#patient" class ="patient" data-toggle="tab" aria-expanded="true">
				{{-- <span class="visible-xs"><i class="fa fa-home"></i></span>  --}}
				<span>PATIENT EXPERIENCE DATA</span>
			</a>
		</li>
		<li class="">
			<a href="#caregiver" class ="caregiver" data-toggle="tab" aria-expanded="false">
				{{-- <span class="visible-xs"><i class="fa fa-user"></i> --}}
				</span> 
				<span>CARE PROVIDER PERFORMANCE DATA</span>
			</a>
		</li>
		<li class="">
			<a href="#organizational"  class ="organizational" data-toggle="tab" aria-expanded="false">
				{{-- <span class="visible-xs"><i class="fa fa-envelope-o"></i> --}}
				</span> 
				<span>ORGANIZATIONAL PERFORMANCE DATA</span>
			</a>
		</li>
	</ul>

	<div class ="tab-content">
		<div class ="tab-pane active" id ="patient">			
			<table class="table table-striped" id="data-table-export">
				<thead>
					<tr>
						<th rowspan ="3">Unit</th>						
						<th rowspan ="3">User Type</th>
						<th rowspan ="3">Insurance Payor</th>
						<th rowspan ="2">Overall</th>
						<th>Care Provider Satisfaction</th>
						<th>Unit Satisfaction</th>						
						<th>Birds-Eye</th>
					</tr>
					<tr>
						<th>
						{{--*/ $sumpercent = 0 /*--}}
						{{--*/ $q = '' /*--}}
						@for($i = 0; $i < $surveys_count; $i++)
							{{--*/ $q = 'q'.($i+1) /*--}}
						
						{{--*/ $sumpercent += $surveys_rate[$q] /*--}}
						@endfor
						{{--*/ $overall_patient =  $surveys_count == 0 ? 0 :round($sumpercent/$surveys_count) /*--}}
						{{ round($overall_patient) }}%
						
						</th>
						<th>{{$overall_exit_patient == 0 ? '-' :$overall_exit_patient.'%'}}</th>
						@if($overall_exit_patient && round($overall_patient))
						<th>{{ round(($overall_exit_patient + round($overall_patient))/2) }}%</th>
						@else
						<th>{{ round(($overall_exit_patient + round($overall_patient))/1) }}%</th>
						@endif					
						<!-- <th>{{ round(($overall_exit_patient + round($overall_patient))/2) }}%</th> -->
					</tr>
					<tr>
						<th>Date</th>
						<th style ="display:none;">Care Provider Satisfaction</th>
						<th style ="display:none;">Unit Satisfaction</th>	
						<th style ="display:none;">Birds-Eye</th>
					</tr>
						
				</thead>
				<tbody>
					@foreach ($patient_data as $element)
						<tr>
							<td>{{ $element->unitname }}</td>
							<td>{{ title_case(str_replace('_',' ',$element->type)) }}</td>
							<td>{{ $element->value }}</td>
							<td>{{ $element->date}}</td>
							<td>{{ $element->avg_rating == 0 ? '' : $element->avg_rating.'%' }}</td>
							<td>{{ $element->avg_rating1 == 0 ? '' : $element->avg_rating1.'%' }}</td>
							<td>-</td>
						</tr>
					@endforeach
				</tbody>
			</table>
		</div>
		<div class ="tab-pane" id ="caregiver">
			<form type="get" id="filter-form">
				<table class="table table-striped table-filter" id="data-table-export1" >
					<thead>
						<tr>
							@if(!\Session::get('current_fac'))
								<td rowspan="3">
									<div class="dropdown">
										<a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											Facility
										</a>
										<div class="dropdown-menu dropdown-table">
											<ul class="list-group">
												<li class="list-group-item"><input type="checkbox" name="facility[]" value="all" <?php if(isset($request_data['facility']) && $request_data['facility'][0]=='all') echo 'checked'; ?>>Select All</li>
												@foreach($facility as $element)
													<li class="list-group-item"><input type="checkbox" name="facility[]" value="{{ $element->key }}" <?php if(isset($request_data['facility']) && in_array($element->key,$request_data['facility'])) echo 'checked'; ?>>{{ $element->value }}</li>
												@endforeach
											</ul>
											<a class="btn btn-default button-submit">Submit</a>
										</div>
									</div>
								</td>
							@endif
							<td rowspan ="3">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Unit
									</a>
									<div class="dropdown-menu dropdown-table" style="min-width: 200px;">
										<ul class="list-group">
											<li class="list-group-item"><input type="checkbox" name="unit[]" value="all" <?php if(isset($request_data['unit']) && $request_data['unit'][0]=='all') echo 'checked'; ?>>Select All</li>
											@foreach($units as $unit)
												<li class="list-group-item"><input type="checkbox" name="unit[]" value="{{ $unit->key }}" <?php if(isset($request_data['unit']) && in_array($unit->key,$request_data['unit'])) echo 'checked'; ?>>{{ $unit->value }}</li>
											@endforeach
										</ul>
										<a class="btn btn-default button-submit">Submit</a>
									</div>
								</div>
							</td>
							<td rowspan ="3">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Name
									</a>
									<div class="dropdown-menu dropdown-table" style="min-width: 250px;">
										<ul class="list-group">
											<li class="list-group-item"><input type="checkbox" name="name[]" value="all" <?php if(isset($request_data['name']) && $request_data['name'][0]=='all') echo 'checked'; ?>>Select All</li>
											@foreach($employees as $element)
												<li class="list-group-item"><input type="checkbox" name="name[]" value="{{ $element->id }}" <?php if(isset($request_data['name']) && in_array($element->id,$request_data['name'])) echo 'checked'; ?>><img src="{{ url($element->photo()) }}" class="img-circle" alt="">{{ $element->name() }}</li>
											@endforeach
										</ul>
										<a class="btn btn-default button-submit">Submit</a>
									</div>
								</div>
							</td>
							<td rowspan ="3">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										Discipline
									</a>
									<div class="dropdown-menu dropdown-table" style="min-width: 200px;">
										<ul class="list-group">
											<li class="list-group-item"><input type="checkbox" name="discipline[]" value="all" <?php if(isset($request_data['discipline']) && $request_data['discipline'][0]=='all') echo 'checked'; ?>>Select All</li>
											@foreach($disciplines as $discipline)
												<li class="list-group-item"><input type="checkbox" name="discipline[]" value="{{ $discipline->key }}" <?php if(isset($request_data['discipline']) && in_array($discipline->key,$request_data['discipline'])) echo 'checked'; ?>>{{ $discipline->value }}</li>
											@endforeach
										</ul>
										<a class="btn btn-default button-submit">Submit</a>
									</div>
								</div>
							</td>
							<th>Overall Wambi Rating</th>
							<th colspan="5" class="text-right">Total</th>
							<th>Date</th>
						</tr>
						<tr>
							{{--*/ $sumpercent = 0 /*--}}
							{{--*/ $q = '' /*--}}
							@for($i = 0; $i < $surveys_count; $i++)
								{{--*/ $q = 'q'.($i+1) /*--}}
								<th>{{ round($surveys_rate[$q]) }}%</th>
							{{--*/ $sumpercent += $surveys_rate[$q] /*--}}
							@endfor
							<th>
								{{ $surveys_count == 0 ? 0 :round($sumpercent/$surveys_count)}} %
							</th>
						</tr>
						<tr>
							{{--@for($i = 0; $i < $surveys_count; $i++)--}}
							{{--<th style ="display:none;">Q{{ $i+1 }}</th>--}}
							{{--@endfor--}}
							<th style ="display:none;">Total</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($surveys as $element)
							<tr>
								{{--*/ $q_element = json_decode(json_encode($element), true); /*--}}
								@if(!\Session::get('current_fac'))
									<td>{{ $element->facilityname }}</td>
								@endif
								<td>{{ $element->unitname }}</td>
								<td><a href={{ route('admin::employee::view',['employee'=>$element->employee_id]) }}>{{ $element->name }}</a></td>
								<td>{{ $element->discipline }}</td>
								@for($i = 0; $i < $surveys_count; $i++)
									{{--*/ $q = 'q'.($i+1) /*--}}
									<td>{{$q_element[$q]}}</td>
								@endfor
								<td>{{ $element->avg_rating }}%</td>
								<td>{{ $element->date}}</td>
						@endforeach
					</tbody>
				</table>
			</form>
		</div>
		<div class ="tab-pane" id ="organizational">			
			<table class="table table-striped" id="data-table-export2" >
				<thead>
					<tr>
						<th rowspan ="3">Unit</th>						
						<th rowspan ="3">User Type</th>
						<th rowspan ="3">Insurance Payor</th>
						<th rowspan ="2">Overall Wambi Rating</th>						
						@for($i = 0; $i < $exit_count; $i++)
						<th>Q{{ $i+1 }}</th>
						@endfor
						<th>Total</th>						
					</tr>
					<tr>
						{{--*/ $sumpercent = 0 /*--}}
						{{--*/ $q = '' /*--}}
						@for($i = 0; $i < $exit_count; $i++)
							{{--*/ $q = 'q'.($i+1) /*--}}
							<th>{{ round($exit_avg[$q]) }}%</th>
						{{--*/ $sumpercent += $exit_avg[$q] /*--}}
						@endfor
						<th>{{ $exit_count == 0 ? 0 : round($sumpercent/$exit_count)}} %</th>
					</tr>
					<tr>
						<th>Date</th>
						@for($i = 0; $i < $exit_count; $i++)
						<th style = "display:none;">Q{{ $i+1 }}</th>
						@endfor
						<th style = "display:none;">Total</th>
					</tr>
				</thead>
				<tbody>					
						@foreach($exitsurvey as $element)
						<tr>
							{{--*/ $q_element = json_decode(json_encode($element), true); /*--}}
							<td>{{ $element->unitname }}</td>
							<td>{{ title_case(str_replace('_',' ',$element->type)) }}</td>
							<td>{{ $element->value }}</td>
							<td>{{ $element->date }}</td>
							@for($i = 0; $i < $exit_count; $i++)
								{{--*/ $q = 'q'.($i+1) /*--}}
								<td>{{$q_element[$q] == 0 || $q_element[$q]? '-' : $q_element[$q] == 0}}</td>
							@endfor
							<td>{{ round($element->avg_rating) }}%</td>
						</tr>
						@endforeach
				</tbody>
			</table>
		</div>
	</div>
</div>
@stop
@section('page-script')
Number.prototype.padLeft = function(base,chr){
    var  len = (String(base || 10).length - String(this).length)+1;
    return len > 0? new Array(len).join(chr || '0')+this : this;
}
// Please have the filename generated be 'Wambi-Date-time (mm.dd.yyyy-hh.mm)' -- example 'Wambi-09.01.2016-13.45.xlsx'
var currentDate = new Date();
var d = (currentDate.getMonth() + 1).padLeft() + "." + currentDate.getDate().padLeft()
+ "." + currentDate.getFullYear()
+"-"+currentDate.getHours().padLeft() + "." +currentDate.getMinutes().padLeft();

    $('#data-table-export').DataTable( {
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            'copy', { extend: 'csv', title: 'Wambi-'+d}, { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
        ],
	    "columnDefs": [
	    // { "orderData": [ 2, 3, 4 ], "targets": 2 }
	    //{ "orderable": false, "targets": 5 },
	    //{ "visible": false, "targets": 9 },
	    ],
    } );
    $('#data-table-export1').DataTable( {
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            'copy', { extend: 'csv', title: 'Wambi-'+d}, { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
        ],
	    "columnDefs": [
	    { "orderData": [  9 ],    "targets": 4 },
	    ],
    } );
    $('#data-table-export2').DataTable( {
    	'scrollX': true,
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            'copy', { extend: 'csv', title: 'Wambi-'+d},  { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
        ],
	    "columnDefs": [
	    { "orderData": [  4 ],    "targets": 4 },
	    // { "orderData": [ 2, 3, 4 ], "targets": 2 }
	    //{ "orderable": false, "targets": 5 },
	    //{ "visible": false, "targets": 9 },
	    ],
    } );
    var keytab = {!! $keytab ? $keytab : 0 !!};
    $( document ).ready(function() {
    	if(keytab == 1){
    		$('.patient').click();
    	}else if(keytab == 2){
    		$('.caregiver').click();
    	}else if(keytab == 3){
    		$('.organizational').click();
    	}
	});
	$("<div class=\"text-center\" style =\"float:left; width: 250px; z-index: 1;\"> <h2 class=\"text-default m-t-0\">WAMBI RATINGS</h2></div>").insertAfter( ".dt-buttons");
@append