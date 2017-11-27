<div class="card-box" id="shift-request">
    <h4 class="text-dark m-t-0">Shift Requests</h4>
    <div class="table-responsive">      
        <table class="table table-striped table-hover table-responsive" id="data-table-shift-requests" style="font-size:9pt;padding:5px">
            <thead>
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    @if (Auth::user()->type() =='super-executive')  
            			<th>Facility </th> 
	            	@endif
	            	<th>Unit</th> 
	            	<th>Job Title</th>
	            	<th>Date</th>
                    <th>Time</th>
                    <th>Pecks</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody >
                @foreach ($shift_requests as $item)
                    @foreach ($item->requests as $employee)
                        <tr>
                            <td>
                                <img src="{{ $employee->photo() }}" class="thumb-lg img-circle">                   
                            </td>
                            <td>{{ $employee->name()}}</td>
                            @if (Auth::user()->type() =='super-executive')  
			            		<td>
				                    {{$item->facility_name()}}
				                </td>
			            	@endif
			                 <td>{{$item->shift_unit()}}</td> 
                             <td>
                              @if(\Cache::get('function_amada') == 1)
                                  {{ $item->job_name() }}
                              @else
                                {{$job_titles[$item->shift_job_title]->value}}
                              @endif
                            </td>  
                            <td>{{$item->shift_date}}</td>
                            @if(\Cache::get('function_amada') != 1)
                              <td>{{ $shift_times[$item->shift_time]->value }}</td>
                            @else
                              <td>{{ $item->shift_starttime.' to '.$item->shift_endtime }}</td>
                            @endif                        
                            <td>{{$item->shift_pecks_display_name()}}</td>
                            <td>
                            {{--*/ $status = $item->status /*--}}

                                @if ($status=='Pending' &&  \Carbon\Carbon::createFromFormat('m/d/Y', $item->shift_date)  >= \Carbon\Carbon::now()->format('Y-m-d'))
                                <form>
                                    {!! csrf_field() !!}            
                                    <button class="ajax-approve btn btn-xs btn-primary" data-url="{{ route('admin::shift::approve',['shift_request'=>$item->id,'employee_id'=>$employee->id]) }}">Accept</button>
                                    {{-- <button  class="ajax-approve btn btn-xs btn-danger" data-url="{{ route('admin::shift::reject',['shift_request'=>$item->id]) }}">Reject</button> --}}
                                </form>

                                @elseif ($status=='Pending' &&  \Carbon\Carbon::createFromFormat('m/d/Y', $item->shift_date)  < \Carbon\Carbon::now()->format('Y-m-d'))
                                    <button disabled class="btn btn-xs btn-danger">Not Accept</button>
                                @else
                                    <button disabled class="btn btn-xs btn-{{ Config::get('css.'.$status) }}">{{ $status}}</button>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@section('page-script')

$("#data-table-shift-requests").dataTable( {
  destroy: true,
    "language": {
      "emptyTable": "Sorry, there are no Shift Requests at this time!"
    },
    "order": [7, 'asc'],
} );

/* ajax approve */
$("table").on('click','.ajax-approve',function(){
  var _ = $(this);  
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
      url: _.data('url'),
      type: 'post',
      dataType: 'json',
      data: _.closest('form').serialize(),
    })
    .done(function(response) {
      if(response.success){
        var id =_.closest('form').parent().parent().parent().find('.ajax-approve').parent();
        for(i=0; i < id.length; i++)
        {
          var url = id[i].childNodes[3].getAttribute('data-url');
          if(url == _.data('url'))
          {
            id[i].childNodes[3].setAttribute('class','btn btn-xs btn-danger');            
            id[i].childNodes[3].textContent ="Taken";
            id[i].childNodes[3].setAttribute('disabled','disabled');
          }
        }
        _.text(response.status)
        _.attr('class','btn btn-xs btn-'+response.cssClass);
        _.attr('disabled','disabled');
        _.closest('form').html(_);
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