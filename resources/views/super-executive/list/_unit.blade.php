<div class="card-box">
	<a href="{{ route('admin::list::add',['type'=>'unit']) }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Post Unit</a>
	<h4 class="text-dark m-t-0">Units</h4>
    <p class="text-muted m-b-30 font-13"></p>
	<div class="table-responsive">
		<table class="table table-striped " id="data-table-export">
			<thead>
				<tr>
					<th>Unit ID</th>
					<th>Unit Name</th>
					<th>Facility Name</th>
					<th>Address</th>
					<th>Actions</th>					
				</tr>
			</thead>
			<tbody>	
				@foreach($unit as $item)
					<tr>
						<td style = "width: 10%;">{{ $item->key }}</td>
						<td style = "width: 20%;">{{ $item->value }}</td>
						<td style = "width: 30%;">{{ $item->facname }}</td>
						<td style = "width: 30%">{!! $item->address !!}</td>
						<td style = "width: 10%;">
		                    <form class="ajax-delete" action="{{route('admin::list::delete',['type'=>'unit','value'=>$item->key])}}">
		                        {!! csrf_field() !!}                                        
		                        <a href="{{ route('admin::list::edit',['type'=>'unit','value'=>$item->key]) }}" title='Edit' class='btn btn-primary btn-xs'><i class='icon-pencil'></i></a>
		                        <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
		                    </form>
		                </td>
					</tr>
				@endforeach
			</tbody>
		</table>
	</div>
</div>