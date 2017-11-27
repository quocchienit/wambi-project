<form class="form-horizontal " method="post" action="{{route('admin::config::performance')}}" id ="performance_config">
	{!! csrf_field() !!}
	<!-- Improvement -->
	<div class ="form-group">		
		<div class="col-xs-12">
			<div class="col-md-7">
				<label class ="col-md-5">Improvement needed</label>
				<div class="input-group bootstrap-touchspin col-md-7">
					<input id="from_need" type="text" value="{{ $config_peck->from_need }}" name="performance"/>
				</div>
			</div>
			<div class="col-md-5">
				<label class ="col-md-2">to</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="to_need" type="text" value="{{ $config_peck->to_need }}" name="performance"/>
				</div>
			</div>
		</div>
	</div>

	<!-- Satisfactory -->
	<div class ="form-group">		
		<div class="col-xs-12">
			<div class="col-md-7">
				<label class ="col-md-5">Satisfactory</label>
				<div class="input-group bootstrap-touchspin col-md-7">
					<input id="from_sactisfactory" type="text" value="{{ $config_peck->from_sactisfactory }}" name="performance"/>
				</div>
			</div>
			<div class="col-md-5">
				<label class ="col-md-2">to</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="to_sactisfactory" type="text" value="{{ $config_peck->to_sactisfactory }}" name="performance"/>
				</div>
			</div>
		</div>
	</div>

	<!-- Good -->
	<div class ="form-group">		
		<div class="col-xs-12">
			<div class="col-md-7">
				<label class ="col-md-5">Good</label>
				<div class="input-group bootstrap-touchspin col-md-7">
					<input id="from_good" type="text" value="{{ $config_peck->from_good }}" name="performance"/>
				</div>
			</div>
			<div class="col-md-5">
				<label class ="col-md-2">to</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="to_good" type="text" value="{{ $config_peck->to_good }}" name="performance"/>
				</div>
			</div>
		</div>
	</div>

	<!-- Excellent -->
	<div class ="form-group">		
		<div class="col-xs-12">
			<div class="col-md-7">
				<label class ="col-md-5">Excellent</label>
				<div class="input-group bootstrap-touchspin col-md-7">
					<input id="from_excellent" type="text" value="{{ $config_peck->from_excellent }}" name="performance"/>
				</div>
			</div>
			<div class="col-md-5">
				<label class ="col-md-2">to</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="to_excellent" type="text" value="{{ $config_peck->to_excellent }}" name="performance"/>
				</div>
			</div>
		</div>
	</div>

	<!-- Exceptional -->
	<div class ="form-group">		
		<div class="col-xs-12">
			<div class="col-md-7">
				<label class ="col-md-5">Exceptional</label>
				<div class="input-group bootstrap-touchspin col-md-7">
					<input id="from_exceptional" type="text" value="{{ $config_peck->from_exceptional }}" name="performance"/>
				</div>
			</div>
			<div class="col-md-5">
				<label class ="col-md-2">to</label>
				<div class="input-group bootstrap-touchspin col-md-10">
					<input id="to_exceptional" type="text" value="{{ $config_peck->to_exceptional }}" name="performance"/>
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
$('#performance_config').submit(function(){
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
			url: $('#performance_config').attr('action'),
			type: 'post',
			dataType: 'json',
			data: {unit_type:$('.survey-check:checked').val(),
					units: JSON.stringify(result), 
					from_need: $('#from_need').val(), to_need: $('#to_need').val(), 
					from_sactisfactory: $('#from_sactisfactory').val(), 
					to_sactisfactory : $('#to_sactisfactory').val(), 
					from_good: $('#from_good').val(), to_good: $('#to_good').val(), 
					from_excellent: $('#from_excellent').val(), to_excellent: $('#to_excellent').val(), 
					from_exceptional: $('#from_exceptional').val(), to_exceptional: $('#to_exceptional').val()}
		}).done(function(response){
			swal("Success!", response.message, "success");
		}).fail(function (response) {
         	swal("Error!", "Problem when processing request", "error");           
        });
	});
	return false;
});
@append