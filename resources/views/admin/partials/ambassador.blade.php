
<div class="card-box">
    @if (!isset($hide_add_button))
        <a href="{{ route('admin::ambassador::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Add Ambassador</a>
    @endif
    <h4 class="text-dark m-t-0">Ambassadors</h4>
    <p class="text-muted m-b-30 font-13">
    </p>
    <table class="table table-striped table-hover table-responsive data-table" id ="data-table-export">
        <thead>
            <tr>
                <th>Ambassador</th>
        		@if (Auth::user()->type() =='super-executive')  
            		<th>Facility </th> 
            	@endif
            	<th>Unit</th>
                <th># Of Survey</th>
                <th>Send Access Code</th>
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
                 <td>{{$item->unitname()}}</td>              
                <td>{{$item->surveys->count()}}</td>
                <td>
                    <form class="ajax-send" action="{{route('admin::ambassador::send',['patient'=>$item])}}">
                        {!! csrf_field() !!}                                        
                        <button title='send' type="submit" class=' btn btn-default btn-sm waves-effect waves-light'>Send Access Code</button>
                    </form>
                </td>                
                <td>
                    <form class="ajax-delete" action="{{route('admin::ambassador::delete',['patient'=>$item->pid])}}">
                        {!! csrf_field() !!}                                        
                        <a href="{{ route('admin::ambassador::edit',['patient'=>$item]) }}" title='Edit' class="btn btn-primary btn-xs"><i class='icon-pencil'></i></a>
                        <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>  
