<div class="card-box" id="awards_request">
	<h4 class="text-dark m-t-0">Award Requests</h4>
	<div class="mx-box table-responsive">		
		<table class="table table-striped" id="data-table-awards-requests" style="overflow: scroll;">
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
					<th>Date Request</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>				
				@foreach ($award_requests as $element)
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
						@if( $element->date_created <> NULL)
                		{{Carbon\Carbon::parse( $element->date_created)->format('m/d/Y')}}
                		@endif</td>
					<td>
						@if ($element->status==null)
						<form>
			                {!! csrf_field() !!}            
							<button class="ajax-approve btn btn-xs btn-primary" data-url="{{ route('admin::award::approve',['award'=>$element->id]) }}">Accept</button>
							<button  class="ajax-approve btn btn-xs btn-danger" data-url="{{ route('admin::award::reject',['award'=>$element->id]) }}">Reject</button>
						</form>
						@else
							<button class="btn btn-xs btn-{{ Config::get('css.'.$element->status) }}">{{ $element->status or ''}}</button>
						@endif
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
</div>
@section('page-script')

$("#data-table-awards-requests").dataTable( {
  destroy: true,
    "language": {
      "emptyTable": "Sorry, there are no Award Requests at this time!"
    },
    "order": [11, 'asc'],
} );

 /* ajax approve */
 var checkAjaxApprove = 1;
$(".ajax-approve").on('click',function(){
  var _ = $(this);
  swal({
      title: "Are you sure?",
      // text: "You will not be able to recover this!",
      type: "info",
      showCancelButton: true,
      confirmButtonClass: 'btn-info',
      // confirmButtonText: "Yes, delete it!",
      closeOnConfirm: false
  }, function (isConfirm) {
  	if (isConfirm) {
  		if(checkAjaxApprove)
  		{
  			checkAjaxApprove = 0;
	  		$.ajax({
		      url: _.data('url'),
		      type: 'post',
		      dataType: 'json',
		      data: _.closest('form').serialize(),
		    })
		    .done(function(response) {
		    checkAjaxApprove = 1;
		      if(response.success){
		        _.text(response.status)
		        _.attr('class','btn btn-xs btn-'+response.cssClass);
		        _.attr('disabled','disabled');
		        _.closest('form').html(_);
		        swal("Success!", response.message, "success");
		      }
		    }) 
		    .fail(function(){
		    checkAjaxApprove = 1;

		        swal("Error!", "Problem while processing request", "error");
		    }) 
  		}
	  } else {
		    checkAjaxApprove = 1;
	     
	  }
  });                                      
  return false;
})	
@append