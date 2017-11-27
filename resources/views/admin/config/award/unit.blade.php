<div class="portlet">
	<div class="portlet-heading bg-custom">
		<h3 class="portlet-title">
			UNIT AWARDS
		</h3>
		<div id="urlUnitSave" hidden>{{route('admin::config::award::save')}}</div>
		<div id="urlUnitDelete" hidden>{{route('admin::config::award::delete')}}</div>
		<div class="portlet-widgets">			
			<button id ="addToTable-unit" class ="btn btn-default waves-effect waves-light">+ Create Awards</button>
		</div>
		<div class="clearfix"></div>
	</div>
	<div id="bg-primary" class="panel-collapse collapse in">
		<div class="portlet-body">
		<table class="table table-striped datatable-editable" id="datatable-editable-unit">
			<thead>
				<tr>
					<th width="100"><i class="icon-key"></i></th>
					<th>Content <i class="icon-question"></i> </th>						
					<th>Css Type</th>
					<th><i class="icon-settings"></i></th>
				</tr>
			</thead>
			<tbody>

				@forelse ($award_unit as $item)
				<tr data-id={{ $item->id }}>
					<td class="readonly">{{ $item->key }}</td>
					<td class="can-edit">{{ $item->value }}</td>	
					<!--Additional css type-->
					<td class="can-edit">
                        {{$item->notes}}
                    </td>					
					<td class="actions">
						<a href="#" class="hidden on-editing save-row-unit"><i class="fa fa-save"></i></a>
						<a href="#" class="hidden on-editing cancel-row-unit"><i class="fa fa-times"></i></a>
						<a href="#" class="on-default edit-row-unit"><i class="fa fa-pencil"></i></a>
						<a href="#" class="on-default remove-row-unit"><i class="fa fa-trash-o"></i></a>
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
