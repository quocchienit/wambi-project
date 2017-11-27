<div class="card-box">
	<a href="{{ route('admin::award::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Post Award</a>
	<h4 class="text-dark m-t-0">Awards</h4>
    <p class="text-muted m-b-30 font-13"></p>
	<div class="table-responsive">
	<table class="table table-striped" id="data-table-export">
		<thead>
			<tr>
				@if (Auth::user()->type() =='super-executive')  
            		<th>Facility </th> 
            	@endif
				<th>Unit</th>
				<th>Discipline</th>
				<th>Shift(s)</th>
				<th>Employee Name</th>
				<th>Job Title</th>
				<th>Type of Award</th>
				<th>Special Situations</th>
				<th>Time Period</th>
				<th>Pecks</th>
				<th>Status</th>
					<th>Created Date</th>
				@if (Auth::user()->type()=='super-admin' ||
						Auth::user()->type() == 'super-executive' ||
						Auth::user()->type() == 'admin')
					<th>Actions</th>
				@endif
			</tr>
		</thead>
		<tbody>
			@foreach ($awards as $element)
			
				<tr>
					@if (Auth::user()->type() =='super-executive')  
	            		<td>
		                    {{$element->facility_name()}}
		                </td>
	            	@endif

					<td>{{ $element->unitname() }}</td>
					<td>{{ ($element->type!='employee_award')?$element->disciplines():'-' }}</td>
					<td>{{ ($element->type!='employee_award')?$element->shift_times():'-' }}</td>
					<td>{{ ($element->type=='employee_award')?$element->employeename():'-' }}</td>
					<td>{{ ($element->type=='employee_award')?$element->job_title():'-' }}</td>
					<td>
						@if($element->cssClass() != 'info')
							<span class="label" style = "background-color: {{ $element->cssClass() }};">{{ $element->type() }}</span>
						@else
							<span class="label label-{{ $element->cssClass() }}">{{ $element->type() }}</span>
						@endif
					</td>
					<td>{{ ($element->type=='employee_award')?$element->note:'-' }}</td>
					<td>{{ $element->period() }}</td>
					<td>{{ $element->peck or 0}}</td>
						
					<td>        
						<span class="label label-{{ $element->status?Config::get('css.'.$element->status):'inverse' }}">{{ $element->status?$element->status:'&nbsp;Pending&nbsp;' }}</span>
					</td>
				<td data-order="{{$element->date_created}}">{{$element->date_created}}</td>
					
						<td>
							@if (Auth::user()->type()=='super-admin' ||
						Auth::user()->type() == 'super-executive' ||
						(Auth::user()->type() == 'admin' && !$element->status))
	                        <form class="ajax-delete" action="{{route('admin::award::delete',['award'=>$element->id])}}">
	                            {!! csrf_field() !!}                                        
	                            <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
	                        </form>
	                        @endif
                        </td>
				
				</tr>
			@endforeach
		</tbody>
	</table>
</div>
</div>
@section('page-script')
Number.prototype.padLeft = function(base,chr){
    var  len = (String(base || 10).length - String(this).length)+1;
    return len > 0? new Array(len).join(chr || '0')+this : this;
}
var currentDate = new Date();
var d = (currentDate.getMonth() + 1).padLeft() + "." + currentDate.getDate().padLeft() 
+ "." + currentDate.getFullYear()
+"-"+currentDate.getHours().padLeft() + "." +currentDate.getMinutes().padLeft();
$('#data-table-export').DataTable( {
        dom: 'lBfrtip',
        'stateSave': true,
		"bSort" : false,
        buttons: [
            { extend: 'csv', title: 'Wambi-'+d}, { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
        ],
    } );
  
var table = $('#data-table-export').DataTable();
// Sort by column 1 and then re-draw
// https://datatables.net/reference/api/order()
table
    .order( [ 7, 'desc' ] )
    .draw();
@append