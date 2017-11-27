<style>
	input[type=checkbox]{
		line-height: 20px;
		height: 25px;
		width: 25px;
	}
</style>
<div class="col-lg-12">
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				REVIEW QUESTIONS
			</h3>
			<div class="portlet-widgets">				
				<!--<a data-toggle="collapse" data-parent="#accordion1" href="#bg-primary"><i class="ion-minus-round"></i></a>
				<span class="divider"></span>
				<a href="#" data-toggle="remove"><i class="ion-close-round"></i></a>-->
				<button id ="addToTable" class ="btn btn-default waves-effect waves-light">+ Add Question</button>
			</div>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
			<table class="table table-striped" id="datatable-editable">
				<thead>
					<tr>
						<th class="sorting">Question ID <i class="icon-key"></i></th>
						<th class="sorting">Question <i class="icon-question"></i> </th>
						<th>Color</th>
						<th class="sorting">Order by</th>						
						<th class="sorting">Enabled</th>
						<th class="sorting"> Disabled</th>
						<th class="sorting_disabled"><i class="icon-settings"></i></th>
					</tr>
				</thead>
				<tbody>

					@forelse ($questions as $item)
					<tr data-id={{ $item->id }}>
						<td class="readonly">{{ $item->qid }}</td>
						<td class="can-edit">{{ $item->question }}</td>
						<td class="can-edit">{{ $item->css_class }}</td>	
						<td class="can-edit text-center">{{ $item->orderby }}</td>
						<td class="chkenabled text-center">
							<div class="checkbox checkbox-success checkbox-circle" style="padding-left: 0px;">
								<input name = "{{$item->id}}" id ="en" type="checkbox" {{$item->enabled == 1 ? 'checked="checked"' : ''}}>
								<label></label>
							</div>
						</td>
						<td class="chkvisiabled text-center">
							<div class="checkbox checkbox-danger checkbox-circle">
								<input name = "{{$item->id}}" id = 'vi'type="checkbox" {{$item->enabled == 1 ? '' : 'checked="checked"'}}>
								<label></label>
							</div>
						</td>
						<td class="actions">
							<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
							<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
							<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>							
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
</div>