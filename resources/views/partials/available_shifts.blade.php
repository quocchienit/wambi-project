<div class="card-box" id="available-shift">
    @if (Auth::user()->can('shift-add'))
    <a href="{{ route('admin::shift::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Post Shift</a>
    @endif
    <h4 class="text-dark m-t-0">Available Shifts</h4>
    <p class="text-muted m-b-30 font-13"></p>
    
    <div class="table-responsive">
        <table class="table table-hover table-striped data-table"  id="data-table-shift">
            <thead>
                <tr>
        			@if (Auth::user()->type() =='super-executive')  
            			<th>Facility </th> 
	            	@endif
	            	<th>Unit</th> 
	    			<th>Job Title</th>
                    <th>Date</th>
                    <th>Time</th>
                    
                    
                    <th>Pecks</th>
                    @if (Auth::user()->can('shift-manage'))
                    <th>Employee Name</th>                      
                    @endif
                    <th>Status</th>
                     @if (Auth::user()->can('shift-manage'))
                    <th>Actions</th>
                    @endif
                </tr>
            </thead>
            <tbody>
                @forelse ($available_shifts as $item)
                <tr>
                	@if (Auth::user()->type() =='super-executive')  
	            		<td>
		                    {{$item->facility_name()}}
		                </td>
	            	@endif
	                 <td>{{$item->shift_unit()}}</td>
	                 @if(\Cache::get('function_amada') != 1)
                      <td>{{ $job_titles[$item->shift_job_title]->value }}</td>
                    @else
                      <td>{{ $item->job_name()}}</td>
                    @endif
                    <td>{{ $item->shift_date }}</td>
                    
                    @if(\Cache::get('function_amada') != 1)
                      <td>{{ $shift_times[$item->shift_time]->value }}</td>
                   @else
                      <td>{{ date('h:i:s A',strtotime($item->shift_starttime)) .' to '.date('h:i:s A',strtotime($item->shift_endtime))}}</td>
                    @endif
                     <td>{{ $item->shift_pecks_display_name()}}</td>
                    @if (Auth::user()->can('shift-manage'))
                    <td>{{ isset($item->employee->firstname) ? $item->employee->firstname.' '.$item->employee->lastname : ''}}</td>
                    @endif
                    <td>
                        {{--*/ $status = $item->status() /*--}}
                        @if ($status)
                          <form class="ajax-request" data-job-title="{{ $job_titles[$item->shift_job_title]->value }}" action="{{ route('employee::shift::request',['shift_request'=>$item->id]) }}">
                            {!! csrf_field() !!}            
                            <button type="submit" {{ $status=='Request'?'':'disabled' }} class="btn btn-xs btn-{{ Config::get('css.'.$status) }}">{{ $status }}</button>
                          </form>
                        @endif
                    </td>
                    @if (Auth::user()->can('shift-manage'))
                    <td>
                        <form class="ajax-delete" action="{{route('admin::shift::delete',['shift_master'=>$item->id])}}">
                            {!! csrf_field() !!}                                        
                            <a href="{{ route('admin::shift::edit',['shift_master'=>$item->id]) }}" title='Edit' class='btn btn-primary btn-xs'><i class='icon-pencil'></i></a>
                            <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                        </form>
                    </td>
                    @endif
                </tr>
                @empty
                {{-- empty expr --}}
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@section('page-script')
$("#data-table-shift").dataTable( {
	destroy: true,
    "language": {
      "emptyTable": "Sorry, there are no Available Shifts at this time!"
    }
} );

var job_title = "{{ Auth::user()->jobtitle() }}"
/* ajax request */
$("table").on('submit','.ajax-request',function(){
  var _ = $(this);console.log(_);
  if(job_title != _.data('job-title')){
    swal("Sorry you are an '"+job_title+"' and cannot request a shift for '"+_.data('job-title')+"' ",'',"warning");
    return false;
  }
  swal({
      title: "Are you sure?",
      // text: "You will not be able to recover this!",
      type: "info",
      showCancelButton: true,
      confirmButtonClass: 'btn-info',
      // confirmButtonText: "Yes, delete it!",
      closeOnConfirm: false
  }, function () {
    $.ajax({
      url: _.attr('action'),
      type: 'post',
      dataType: 'json',
      data: _.serialize(),
    })
    .done(function(response) {
      if(response.success){
        _.text(response.status)
        _.attr('class','btn btn-xs btn-'+response.cssClass);
        _.attr('disabled','disabled');
        // _.closest('form').html(_);
        swal("Success!", response.message, "success");
      }
    }) 
    .fail(function(){
        swal("Error!", "Problem while processing request", "error");
    })                   
  });                                      
  return false;
})
@append