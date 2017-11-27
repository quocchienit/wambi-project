<div class="card-box">    
    <h4 class="text-dark m-t-0">Employees Request New Photo</h4>
    <p class="text-muted m-b-30 font-13">
    </p>
    <table class="table table-striped table-hover table-responsive" id="employees-photo-table">
        <thead>
            <tr>
                <th>EmployeeID</th>
                <th>Name</th>
    			@if (Auth::user()->type() =='super-executive')  
            		<th>Facility </th> 
            	@endif     
            	<th>Unit</th> 
   				 <th>Discipline</th>
                <th>Job Title</th>     
                <th>User Type</th>
                <th>Old Photo</th>
                <th>New Photo</th>                
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employees_photo as $item)
            <tr>
                <td>
                    <a href="{{ route('admin::employee::view',['employee'=>$item->id]) }}" title="">
                        {{$item->clockid}}
                    </a>
                </td>
                <td>
                    <a href="{{ route('admin::employee::view',['employee'=>$item->id]) }}" title="">
                        {{$item->name()}}
                    </a>
                </td>
                @if (Auth::user()->type() =='super-executive')  
            		<td>
	                    {{$item->facility_name()}}
	                </td>
            	@endif
            	<td>{{$item->unitname()}}</td>
                <td>{{ $item->disciplines() }}</td>
                <td>
                    @if(\Cache::get('function_amada') == 1)
                        {{ $item->job_name() }}
                    @elseif(array_has($job_titles,$item->job)) 
                        {{$job_titles[$item->job]->value}}                     
                    @endif
                </td>
                  
                	
                <td>@if(array_has($utype,$item->etid)) {{$utype[$item->etid - 1]->name}} @endif</td>
                <td>
                    <div class="chart easy-pie-chart-with-image">
                        <div class="thumb-xl">
                            <img src="{{ url($item->photo()) }}" class="img-circle" alt="">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="chart easy-pie-chart-with-image">
                        <div class="thumb-xl">
                            <img src="{{ url($item->newphoto()) }}" class="img-circle" alt="">
                        </div>
                    </div>    
                </td>
                <td>
                    <form>
                        {!! csrf_field() !!}            
                        <button class="ajax-approve btn btn-xs btn-primary" data-url="{{ route('admin::employee::approve',['employee'=>$item->id]) }}">Accept</button>
                        <button  class="ajax-approve btn btn-xs btn-danger" data-url="{{ route('admin::employee::reject',['employee'=>$item->id]) }}">Reject</button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>  
@section('page-script')
 /* ajax approve */
$(".ajax-approve").on('click',function(){
  var _ = $(this);
  swal({
      title: "Are you sure?",      
      type: "info",
      showCancelButton: true,
      confirmButtonClass: 'btn-info',      
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
        _.text(response.status == 0 ? 'Accept' : 'Reject')
        _.attr('class',response.status == 0 ? 'btn btn-xs btn-info' : 'btn btn-xs btn-danger');
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