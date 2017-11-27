<div class="portlet">
	<div class="portlet-heading bg-custom">
		<h3 class="portlet-title">
			EMPLOYEE AWARDS
		</h3>
		<div class="portlet-widgets">			
			<button id ="addToTable-employee" class ="btn btn-default waves-effect waves-light">+ Create Awards</button>
		</div>
		<div class="clearfix"></div>
	</div>
	<div id="bg-primary" class="panel-collapse collapse in">
		<div class="portlet-body">
		<table class="table table-striped datatable-editable" id="datatable-editable-employee">
			<thead>
				<tr>
					<th width="100"><i class="icon-key"></i></th>
					<th>Content <i class="icon-question"></i> </th>	
					<th>Css Type</th>					
					<th><i class="icon-settings"></i></th>
				</tr>
			</thead>
			<tbody>

				@forelse ($award_employee as $item)
				<tr data-id={{ $item->id }}>
					<td class="readonly">{{ $item->key }}</td>
					<td class="can-edit">{{ $item->value }}</td>						
					<td class="can-edit">
                        {{$item->notes}}
                    </td>			
					<td class="actions">
						<a href="#" class="hidden on-editing save-row-employee"><i class="fa fa-save"></i></a>
						<a href="#" class="hidden on-editing cancel-row-employee"><i class="fa fa-times"></i></a>
						<a href="#" class="on-default edit-row-employee"><i class="fa fa-pencil"></i></a>
						<a href="#" class="on-default remove-row-employee"><i class="fa fa-trash-o"></i></a>
					</td>
				</tr>
				@empty
				{{-- empty expr --}}
				@endforelse
			</tbody>
		</table>
		</div>
	</div>
</div>