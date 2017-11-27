
<div class="card-box">
    @if (!isset($hide_add_button))
        <a href="{{ route('admin::patient::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Add Patient</a>
    @endif
    <h4 class="text-dark m-t-0">Patients</h4>
    <p class="text-muted m-b-30 font-13">
    </p>
    <table class="table table-striped table-hover table-responsive data-table" id ="data-table-export">
        <thead>
            <tr>
                <th>Patient ID #</th>
        		@if (Auth::user()->type() =='super-executive')  
            		<th>Facility </th> 
            	@endif
                <th>Unit</th>
                <th>Admitted Date</th>
                @if(\Cache::get('function_ambassador') != 1)
                <th>Username</th>
                <th>Password</th>
                @endif
                <th># of Reviews</th>
                <th>Insurance Payor</th>
                <th>Release Date</th>
                @if(config("customerindex.out_patient") == \Cache::get('current_index'))
                    <th>Send Access Code</th>
                @endif
                <th>Action</th>
            </tr>
        </thead>
        <tbody>            
            @foreach ($patients as $item)
            <tr>
                <td>{{"$item->fname"}}</td>
        		@if (Auth::user()->type() =='super-executive')  
            		<td>
	                    {{$item->facility_name()}}
	                </td>
            	@endif
                <td>{{ $item->unitname() }}</td>
                <td>{{Carbon\Carbon::parse($item->admitteddate)->format('m/d/Y')}}</td>
                @if(\Cache::get('function_ambassador') != 1)
                <td>{{$item->ssn}}</td>
                <td>{{$item->pinno}}</td>
                @endif
                <td>{{$item->surveys->count()}}</td>
                <td>
                	@if($item->insurance_id <> NULL && $item->insurance_id <= count($insurance))
                	{{ $insurance[$item->insurance_id]->value }}
                	@endif
                	</td>
                <td>
                	@if($item->release <> NULL)
                		{{Carbon\Carbon::parse($item->release)->format('m/d/Y')}}
                	@endif
                </td>
                @if(config("customerindex.out_patient") == \Cache::get('current_index'))
                    <td>
                        <form class="ajax-send" action="{{route('admin::patient::send',['patient'=>$item->pid])}}">
                            {!! csrf_field() !!}                                        
                            <button title='send' type="submit" class=' btn btn-default btn-sm waves-effect waves-light'>Send Access Code</button>
                        </form>
                    </td>                
                
                @endif
                <td>
                    <form class="ajax-delete" action="{{route('admin::patient::delete',['patient'=>$item->pid])}}">
                        {!! csrf_field() !!}                                        
                        <a href="{{ route('admin::patient::edit',['patient'=>$item->pid]) }}" title='Edit' class="btn btn-primary btn-xs"><i class='icon-pencil'></i></a>
                        <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>  
