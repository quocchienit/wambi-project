<form class="form-horizontal " method="post" action="{{route('admin::config::survey')}}" id ="survey_config">
	{!! csrf_field() !!}
	<div class ="config-5">
		<div class ="form-group">		
			<div class="col-xs-12">
				<label class ="col-md-2">Poor</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="poor" type="text" value="{{ $config_peck->poor }}" name="survey"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-2">Fair</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="fair" type="text" value="{{ $config_peck->fair }}" name="survey"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-2">Ok</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="ok" type="text" value="{{ $config_peck->ok }}" name="survey"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-2">Good</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="good" type="text" value="{{ $config_peck->good }}" name="survey"/>
				</div>
			</div>
		</div>
		<div class ="form-group">
			<div class="col-xs-12">
				<label class ="col-md-2">Great</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="great" type="text" value="{{ $config_peck->great }}" name="survey"/>
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
$('#survey_config').submit(function(){
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
			url: $('#survey_config').attr('action'),
			type: 'post',
			dataType: 'json',
			data: {unit_type:$('.survey-check:checked').val(),units: JSON.stringify(result), poor: $('#poor').val(), fair: $('#fair').val(), ok: $('#ok').val(), good: $('#good').val(), great: $('#great').val() }
		}).done(function(response){
			swal("Success!", response.message, "success");
		}).fail(function (response) {
         	swal("Error!", "Problem when processing request", "error");           
        });
	});
	return false;
});
@append