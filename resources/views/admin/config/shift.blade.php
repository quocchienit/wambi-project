<form class="form-horizontal " method="post" action="{{route('admin::config::shift')}}" id ="shift_config">
	{!! csrf_field() !!}
	<div class ="config-6">
		<div class ="form-group">		
			<div class="col-xs-12">
				<label class ="col-md-4">Urgent</label>
				<div class="input-group bootstrap-touchspin col-md-8">
					<input id="urgent" type="text" value="{{ $config_peck->urgent }}" name="ugent"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-4">Very Urgent</label>
				<div class="input-group bootstrap-touchspin col-md-8">
					<input id="v_urgent" type="text" value="{{ $config_peck->v_urgent }}" name="ugent"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-4">Extremely Urgent</label>
				<div class="input-group bootstrap-touchspin col-md-8">
					<input id="e_urgent" type="text" value="{{ $config_peck->e_urgent }}" name="ugent"/>
				</div>
			</div>
		</div>		
	</div>
	<div class ="form-group text-right m-b-0">
		<button class="btn btn-primary waves-effect waves-light" type="submit">
	        Submit
	    </button>
	</div>
</form>
@section('page-script')
$('#shift_config').submit(function(){
	swal({
		text: '',
		type: 'info',
        confirmButtonClass: 'btn-info',
        confirmButtonText: "OK",
        cancelButtonClass: "btn-default",
        showCancelButton: true,
        html: htmlUnits,
        preConfirm: function () {
            return new Promise(function (resolve) {
                var units = [];
                var index = 0;
                units.push({});
                units[0]["id"] = $('.1')[0].id;
                units[0]["checked"] = $('.1')[0].checked? "1":"0";
                index = 1;
                for (var i = 1; i < count; i++) {                                                
                    units.push({});
                    units[index]["id"] = $('.'+(i+1))[0].id;
                    units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
                    index++;
                };
              resolve([                                            
                units
              ])
            })
          }
	}).then(function(result){
		$.ajax({
			url: $('#shift_config').attr('action'),
			type: 'post',
			dataType: 'json',
			data: {unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), urgent: $('#urgent').val(), v_urgent: $('#v_urgent').val(), e_urgent: $('#e_urgent').val()}
		}).done(function(response){
			swal("Success!", response.message, "success");
		}).fail(function (response) {
         	swal("Error!", "Problem when processing request", "error");           
        });
	});
	return false;
});
@append