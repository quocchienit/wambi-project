<div class="card-box">
	<a href="{{ route('admin::listdiscipline::add',['type'=>'job_title']) }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Post Job Title</a>
	<h4 class="text-dark m-t-0">Job Title</h4>
    <p class="text-muted m-b-30 font-13"></p>
	<div class="table-responsive">
		<table class="table table-striped " id="data-table-export">
			<thead>
				<tr>
				
					<th>ID</th>
					<th>Name</th>
					<th>Discipline</th>
					@if(\Cache::get('function_amada') == 1)
					<th>Unit</th>			
					 @endif	
					<th>Actions</th>					
				</tr>
			</thead>
			<tbody>	
				@foreach($jobtitle as $item)
					<tr>

						<td style = "width: 10%;">{{ $item->id }}</td>
						<td style = "width: 20%;">{{ $item->value }}</td>
						<td style = "width: 40%;">{{ App\CodeMaster::get_code_by_type_and_key('discipline',$item->notes) }}</td>
						@if(\Cache::get('function_amada') == 1)
						<td style = "width: 20%;">{{ App\CodeMaster::get_code_by_type_and_key('unit',$item->refkey) }}</td>
						@endif	
						<td style = "width: 10%;">
		                    <form class="ajax-delete" action="{{route('admin::listdiscipline::delete',['type'=>'job_title','id'=>$item->id])}}">
		                        {!! csrf_field() !!}                                        
		                        <a href="{{ route('admin::listdiscipline::edit',['type'=>'job_title','id'=>$item->id]) }}" title='Edit' class='btn btn-primary btn-xs'><i class='icon-pencil'></i></a>
		                        <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
		                    </form>
		                </td>
					</tr>
				@endforeach
			</tbody>
		</table>
	</div>
</div>