<form class="form-horizontal" id="patient_config" method = "post" action="{{route('admin::config::patient')}}">
	{!! csrf_field() !!}
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				SERVICE RECOVERY
			</h3>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
				<div class ="form-group">
					<div class="col-xs-12">
						The Service-Recovery feature sends real-time alerts when there has been a "Poor" survey result. This allows you and your team to make immediate changes and remedy a situation before it's too late. The Users included here will receive these alerts via text message and email.
					</div>
				</div>
				<div class ="form-group">					
					<label class="control-label">Users to receive alerts:</label>					
					<select id='employeeid' name="employeeid[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Search Name">                        
                        @foreach ($employee as $element)
                        <option value="{{ $element->id }}" {{ (isset($config_peck)&&in_array($element->id,$config_peck->eidalert)) ?"selected":"" }}>{{ $element->name() }}</option>
                        @endforeach
                    </select>
				</div>
			</div>
		</div>
	</div>
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				SERVICE RECOGNITION
			</h3>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
				<div class ="form-group">
					<div class="col-xs-12">
						The Service Recognition feature sends real-time alerts when there has been consecutive perfect reviews submitted for a particular Employee User. This allows managers to recognize employees, when they have received multiple 100% scores on reviews left by their patients/clients. The Users included here will receive these alerts via text message and email.
					</div>
				</div>
				<div class ="form-group">					
					<label class="control-label">Number of consecutive reviews until alerted:</label>					
					<select id='number_of_consecutive' name="number_of_consecutive[]" parsley-trigger="change" required class="form-control select2" data-placeholder="Select Number...">                        
                        @foreach ($number_of_consecutives as $element)
                        <option value="{{ $element }}"  {{ (isset($config_peck->number_of_consecutive)&&($element==$config_peck->number_of_consecutive)) || old('number_of_consecutive')==$element?"selected":"" }}>{{ $element }}</option>
                        @endforeach
                    </select>
				</div>
				<div class ="form-group">					
					<label class="control-label">Users to receive alerts:</label>					
					<select id='employeeid3' name="employeeid3[]" parsley-trigger="change" class="form-control select2 select2-multiple" multiple data-placeholder="Search Name">                        
                        @foreach ($employee as $element)
                        <option value="{{ $element->id }}"  {{ (isset($config_peck->users_to_receive)&&in_array($element->id,$config_peck->users_to_receive)) ?"selected":"" }}>{{ $element->name() }}</option>
                        @endforeach
                    </select>
				</div>
			</div>
		</div>
	</div>
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				EMPLOYEE RECOGNITION
			</h3>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
				<div class ="form-group">
					<div class="col-xs-12">
						The Employee Recognition feature sends real-time alerts to any Employee User who has received a perfect score, 100%, on a Wambi review. If this feature is enabled all Employee Users who receive a perfect score, 100%, on a Wambi Review, will be recognized and alerted via text message and email.
					</div>
				</div>
				<div class ="form-group">
					<div class="col-xs-12 text-center">
						<div class="switchery-demo">				
							@if($config_peck->perfectscore == 1)
							<input type="checkbox" id ="perfectscore" checked data-plugin="switchery" data-color="#81c868">
							@else
							<input type="checkbox" id ="perfectscore" data-plugin="switchery" data-color="#81c868">
							@endif
							<lable style ="font-size:18px;"> <b>PERFECT SCORE ALERTS</b> </lable>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				Patient Follow Up
			</h3>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
				<div class ="form-group">
					<div class="col-xs-12">
						The ‘Patient Follow Up’ feature gives patients/ families the ability to request a follow up meeting with the individual at your organization responsible for patient satisfaction. With this feature enabled, Patients/ families are asked to provide their full name and contact information at the end of the survey if they wish to be contacted. If this feature is enabled and a patient/ family member requests follow up, the individual(s) responsible for patient satisfaction will receive an email with the patient/ family’s contact information.
					</div>
				</div>
				<div class ="form-group">
					<div class="col-xs-12 text-center">
						<div class="switchery-demo">				
							@if($followup == 1)
							<input type="checkbox" id ="follow" checked data-plugin="switchery" data-color="#81c868">
							@else
							<input type="checkbox" id ="follow" data-plugin="switchery" data-color="#81c868">
							@endif
							<lable style ="font-size:18px;"> <b>PATIENT FOLLOW UP</b> </lable>	
						</div>
					</div>
				</div>
				<div class ="form-group" id = "followdropdown">					
					<label class="control-label">Users to receive alerts:</label>
					<select id='employeeid1' name="employeeid1[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Search Name">                        
                        @foreach ($employee as $element)
                        <option value="{{ $element->id }}" {{ (isset($config_peck)&&in_array($element->id,$config_peck->eidfollow)) ?"selected":"" }}>{{ $element->name() }}</option>
                        @endforeach
                    </select>
				</div>
			</div>
		</div>
	</div>

	<!-- Redem notification -->
	<div class="portlet">
		<div class="portlet-heading bg-custom">
			<h3 class="portlet-title">
				REWARD REDEMPTION
			</h3>
			<div class="clearfix"></div>
		</div>
		<div id="bg-primary" class="panel-collapse collapse in">
			<div class="portlet-body">
				<div class ="form-group">
					<div class="col-xs-12">
						When an employee cashes out their pecks for a Reward, a designated User will receive an alert via text message and email. This User will be responsible for distributing the Rewards to the employees. Please note, employees are notified that they will receive their Reward within 24-48 hours.
					</div>
				</div>
				<div class ="form-group">					
					<label class="control-label">Users to receive alerts:</label>
					<select id='employeeid2' name="employeeid2[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Search Name">                        
                        @foreach ($employee as $element)
                        <option value="{{ $element->id }}" {{ (isset($config_peck)&&in_array($element->id,$config_peck->eidfollow)) ?"selected":"" }}>{{ $element->name() }}</option>
                        @endforeach
                    </select>
				</div>
			</div>
		</div>
	</div>
	<div class ="form-group text-right m-b-0">
		<button class="btn btn-primary waves-effect waves-light" type="submit" id="btnPatient">
	        Submit
	    </button>
	</div>
</form>
@section('page-script')
$('#patient_config').submit(function(){
	swal({
		text: '',
		type: 'info',
        confirmButtonClass: 'btn-info',
        confirmButtonText: "OK",
        cancelButtonClass: "btn-default",
        showCancelButton: true,
        html: htmlUnits_create_award_types,
        preConfirm: function () {
            return new Promise(function (resolve) {
                var units = [];
                var index = 0;
                units.push({});
                units[0]["id"] = $('.1')[0].id;
                units[0]["checked"] = $('.1')[0].checked? "1":"0";
                index = 1;
                for (var i = 1; i < count; i++) { 
	                if ($('.'+(i+1)).length>0) {                                               
	                    units.push({});
	                    units[index]["id"] = $('.'+(i+1))[0].id;
	                    units[index]["checked"] = $('.'+(i+1))[0].checked? "1":"0";
	                    index++;
	                }
                };
              resolve([                                            
                units
              ])
            })
          }
	}).then(function(result){
		$.ajax({
			url: $('#patient_config').attr('action'),
			type: 'post',
			dataType: 'json',
			data: {unit_type:$('.survey-check:checked').val(),
				units: JSON.stringify(result), 
					follow: $('#follow').prop('checked') ? 1 : 0, 
					employeeid: $('#employeeid').val() , 
					employeeid1: $('#employeeid1').val(), 
					employeeid2: $('#employeeid2').val(),
					number_of_consecutive: $('#number_of_consecutive').val(),
					employeeid3: $('#employeeid3').val(),
					perfectscore: $('#perfectscore').prop('checked') ? 1 : 0
					}
		}).done(function(response){
			swal("Success!", response.message, "success");
		}).fail(function (response) {
         	swal("Error!", "Problem when processing request", "error");           
        });
	});
	return false;
});
$('#follow').change(function(){
	if($('#follow').prop('checked')){
		$('#followdropdown').css("display","");	
	}else{
		$('#followdropdown').css("display","none");	
	}
})

@append