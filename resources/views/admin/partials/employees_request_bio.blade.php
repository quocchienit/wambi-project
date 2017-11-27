<div class="card-box">
    <h4 class="text-dark m-t-0" id="employee_bio">Employees Request New Bio</h4>
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
                <th>New Bio</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($employees_bio as $item)
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
                <td>{{ $item->bio_new }}</td>
                <td style="min-width: 120px;">
                    <form>
                        {!! csrf_field() !!}
                        <div class="btn-group">
                            <button class="ajax-approve btn btn-xs btn-primary" data-url="{{ route('admin::employee::approve-bio',['employee'=>$item->id]) }}">Accept</button>
                            <button class="ajax-approve btn btn-xs btn-danger" data-url="{{ route('admin::employee::reject-bio',['employee'=>$item->id]) }}">Reject</button>
                            <a class="btn btn-xs btn-icon btn-purple" href="{{ route('admin::employee::edit',['employee'=>$item->id]) }}"><i class="fa fa-edit"></i></a>
                        </div>
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