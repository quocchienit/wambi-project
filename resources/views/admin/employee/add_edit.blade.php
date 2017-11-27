@extends('admin.layout')
@section('content')
<style>
    .span-bio{
        border: 1px solid #ddd;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        display: inline-block;
        text-align: center;
        vertical-align: middle;
        background-color: #f2f2f2;
    }
    .attention_btn{
        border: 1px solid #888;
        border-radius: 50%;
        padding: 2px 10px;
        font-weight: bold;
        background-color: #f2f2f2;
        margin-left: 5px;
    }
    .tooltip-inner{
        color: #000000;
        background-color: #ffffff;
        border: 1px solid #888888;
        border-radius: 8px;
        text-align: left;
        padding: 12px;
        font-size: 13px;
    }
</style>
<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="card-box">
            <form action="{{ isset($employee)?route('admin::employee::edit',['employee'=>$employee->id]):route('admin::employee::add') }}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                {!! csrf_field() !!}
                <h4 class="header-title">EMPLOYEE REGISTRATION</h4>
                @if (session('message'))
                    <div class="alert alert-info">
                        {{ session('message') }}
                    </div>
                @endif
                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::employee::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
                <div class="form-group m-b-0">
                    <label class="control-label">Employee image</label>
                    <input type="file" class="filestyle" data-input="false" data-placeholder="Select profile image" name="image" onchange="readURL(this);" >
                    <button id = "resizeimg" type="button" class="btn btn-primary" data-target="#modal" data-toggle="modal" style = "display:none;"></button>

                    <div id="result" class="thumb-xl">
                        <img src="@if(isset($employee)) {{ $employee->photo() }} @else {{old('image')}} @endif" height="100" class="img-circle" id ="imgupload">
                    </div>
                    <input name="employeeimg" value="" style ="display:none;" id ="employeeimg">
                </div>
                {{-- employee type --}}
                <div class="form-group">
                    <h5 class="m-t-30">User Type*</h5>
                    <select id="etid" parsley-trigger="change" data-placeholder="Select User Type" required name="etid" class="form-control select2">
                        <option value=""></option>
                        @if(isset($profiles) && count($profiles)>0)
                        @foreach ($profiles as $element)
                            @if (Auth::user()->type() !='super-admin' && Auth::user()->type() !='super-executive')
                                @if ($element->id == 4 ||
                                    $element->id == 7)
                                    @continue
                                @endif
                            @endif
                            <option value="{{ $element->id }}" {{ (isset($employee)&&($element->id==$employee->etid)) || $element->id==old('etid') ?"selected":"" }}>{{ $element->name }}</option>
                        @endforeach
                        @endif
                        @if(\Cache::get('function_amada') == 1 && Auth::user()->type() =='super-executive'){
                            <option value="7" {{ (isset($employee)&&( 7 == $employee->etid)) || 7==old('etid') ?"selected":"" }}> Super Executive User </option>
                            @endif
                        }
                    </select>
                </div>
                @if (Auth::user()->type() =='super-executive')  
     				<div class="form-group">
                    <h5 class="m-t-30">Facility*</h5>
				    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id">
				      <option value="">Select Facility</option>
                
				      @forelse ($facs as $item)
    				      	<option value="{{ $item->key }}" {{ (isset($employee)&&$employee->fac_id == $item->key)|| (!isset($employee) && $item->key == \Session::get('current_fac')) ?"selected":"" }}>{{ $item->value }}</option>                            
				      @empty
    				      	{{-- empty expr --}}
				      @endforelse
				    </select>                
				</div>
				@endif	
                {{-- unit --}}
                <?php
                $units_array = array();
                foreach ($units as $element){
                    $units_array[] = $element->key;
                }
                $units_item = implode($units_array, ',');
                ?>
                <input type="hidden" value="{{ $units_item }}" id="unit_array" name="unit_array">
                <div class="form-groups">
                    <h5 class="m-t-30">Unit*</h5>
                    <select id='unit' name="units[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Select Unit ...">
                        @foreach ($units as $element)
                            <option value="{{ $element->key }}" {{ (isset($employee)&&in_array($element->key,$employee->units)) || old('units')!=""&&in_array($element->key,old('units')) || (!isset($employee) && $element->key == \Session::get('current_unit')) ? "selected" : "" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>
                {{-- discipline --}}
                <div class="form-groups">
                    <h5 class="m-t-30">Discipline*</h5>
                    <select  name="disciplines[]" {{ (isset($employee)&&$employee->etid!=4)?"data-parsley-maxcheck=1":"" }} parsley-trigger="change" @if (isset($employee)&&$employee->etid!=4) required @endif class="select2 select2-multiple" multiple="multiple" multiple data-placeholder="Select Discipline ..." id ="disciplines">
                    @foreach ($disciplines as $element)
                        <option value="{{ $element->key }}" {{ (isset($employee)&&in_array($element->key,$employee->disciplines)) || old('disciplines')!=""&&in_array($element->key,old('disciplines'))?"selected":"" }}>{{ $element->value }}</option>
                    @endforeach
                    </select>
                </div>
                <!--
                {{-- employee id --}}
                <div class="form-group">
                    <h5 class="m-t-30">Employee ID*</h5>
                    <input type="text"  name="employeeid" data-parsley-type="digits" required value="{{ $employee->employeeid or '' }}" placeholder="Employee ID" class="form-control" parsley-trigger='change'>
                </div>-->
                {{-- clock id --}}
                <div class="form-group">
                    <h5 class="m-t-30">Employee ID*</h5>
                    <input id="clockid" name="clockid" value="{{ $employee->clockid or old('clockid') }}" type="text" maxlength="50"  data-parsley-length="[4,50]" data-parsley-type="digits"  required placeholder="Employee ID" class="form-control" >
                </div>
                {{-- job title --}}
                <div class="form-group">
                    <h5 class="m-t-30">Job Title*</h5>
                    <select data-placeholder="Select Job Title" name="job" class="form-control select2" parsley-trigger="change" {{ (isset($employee)&&$employee->etid!=3 && isset($employee)&&$employee->etid!=4)?"required":"" }}   id="job">
                        @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	            		 <option value=""></option>
	            		@endif

                        @foreach($job_titles as $element)
                        <option value="{{ $element->key }}" {{ (isset($employee)&&($element->key==$employee->job)) || old('job')==$element->key?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>
                {{-- first name --}}
                <div class="form-group">
                    <h5 class="m-t-30">First Name*</h5>
                    <input name="firstname" value="{{ $employee->firstname or old('firstname') }}" parsley-trigger="change" required type="text" placeholder="Employee First Name" class="form-control" >
                </div>
                {{-- last name --}}
                <div class="form-group">
                    <h5 class="m-t-30">Last Name</h5>
                    <input name="lastname" value="{{ $employee->lastname or old('lastname') }}" type="text" parsley-trigger="change" placeholder="Employee Last Name" class="form-control" >
                </div>
                {{-- email --}}
                <div class="form-group">
                    <h5 class="m-t-30">Email</h5>
                    <input parsley-trigger="change" value="{{ $employee->email or old('email') }}" data-parsley-type="email" name="email" type="text" placeholder="Email" class="form-control" >
                </div>
                {{-- password --}}
                <div class="form-group">
                    <h5 class="m-t-30">Password</h5>
                    <input parsley-trigger="change" id="password" name="password"  type="password" placeholder="Password" class="form-control" >
                    @if(!$employee)
                    <p style="font-size: 12px; margin-top: 3px;">Temporary password assigned will be the Employee’s ID #. Employee will be prompted to change their password during first-time login</p>
                    @endif
                </div>
                {{-- {{ (empty($employee->password)&&$employee->etid != 2)?'required':" value " }} --}}
                {{-- address --}}
                <div class="form-group">
                    <h5 class="m-t-30">Address</h5>
                    <input name="address" value="{{ $employee->address or old('address') }}" type="text" parsley-trigger="change"  placeholder="Employee Address" class="form-control" >
                </div>
                {{-- mobile --}}
                <div class="form-group">
                    <h5 class="m-t-30">Mobile</h5>
                    <input data-parsley-type="number" value="{{ $employee->mobile or old('mobile') }}" name="mobile" type="text" parsley-trigger="change" placeholder="Mobile" class="form-control" >
                </div>
                {{-- carrier --}}
                <!--
                <div class="form-group">
                    <h5 class="m-t-30">Select Carrier*</h5>
                    <select parsley-trigger="change" required name="carrier"  data-placeholder="Select Carrier" class="form-control select2">
                        <option value="">Select Carrier</option>
                        @foreach ($carriers as $element)
                            <option value="{{ $element->address }}" {{ (isset($employee)&&($element->address==$employee->carrier)) || old('carrier')== $element->address?"selected":"" }}>{{ $element->name }}</option>
                        @endforeach
                    </select>
                </div>
                -->
                {{-- hire date --}}
                <div class="form-group">
                    <h5 class="m-t-30">Hire Date</h5>
                    <div class="input-group">
                        <input name="hiredate" value="{{ $employee->hiredate or old('hiredate') }}" type="text" placeholder="Hire Date" class="form-control datepicker-autoclose" >
                        <span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
                    </div>
                </div>
                {{-- shift time --}}
                @if(\Cache::get('function_amada') != 1)
                <div class="form-group">
                    <h5 class="m-t-30">Shift time*</h5>
                    <?php
                    function convert_army_to_regular($time) {
                        $hours1 = substr($time, 0, 2);
                        $minutes1 = substr($time, 3, 2);
                        $hours2 = substr($time, 8, 2);
                        $minutes2 = substr($time, 11, 2);
                        return $hours1.':'.$minutes1.':00 - '.$hours2.':'.$minutes2.':00';
                    }
                    ?>
                    <select name="shifts[]" parsley-trigger="change" required class="select2 select2-multiple" multiple data-placeholder="Select Shift Time">
                        @foreach ($shift_times as $element)
                        <option value="{{ $element->key }}" {{ (isset($employee)&&in_array($element->key,$employee->shifts)) || (old('shifts')!="" && in_array($element->key,old('shifts')))?"selected":"" }}>{{ convert_army_to_regular($element->value) }}</option>
                        @endforeach
                    </select>
                </div>
                @endif
                <div class="form-group">
                    <h5 class="m-t-30">Bio info <span class="span-bio" data-toggle="tooltip" data-placement="top" data-original-title="Bio information will be visible to patients and their families">?</span></h5>
                    <input value="@if(isset($employee->bio_new)) {{$employee->bio_new}} @elseif (isset($employee->bio)) {{$employee->bio }} @endif" name="bio" type="text" placeholder="Sample text: 15 years as a Registered Nurse. Enjoy reading Harry Potter" class="form-control" style="font-style: italic;">
                </div>
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::employee::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<input type="hidden" value="{{isset($employee)?json_encode($employee->units):''}}" id="unit_employee">
@include('cropimage.crop')
@stop
@section('page-script')
/* check user type*/
$('#etid').on('change',function() {
  var getVal = $(this).val();
  if(getVal==2){
    {{--$("input[name='password']").closest(".form-group").hide();--}}
    {{-- $("input[name='password']").removeAttr('required'); --}}

    //$('#unit').removeAttr('data-parsley-maxcheck');
    //$('#unit').attr('data-parsley-maxcheck',1);
    $('select[name="disciplines[]"]').attr('data-parsley-maxcheck',1);//.addAttr('required');
    $('select[name="disciplines[]"]').attr('required',true);
    $('select[name="job"]').attr('required',true);
  }else{
    {{--$("input[name='password']").closest(".form-group").show();--}}
    {{-- $("input[name='password']").attr('required',true); --}}

    //$('#unit').removeAttr('data-parsley-maxcheck');
    $('select[name="disciplines[]"]').removeAttr('data-parsley-maxcheck');//.removeAttr('required');
    $('select[name="disciplines[]"]').removeAttr('required');
    $('select[name="job"]').removeAttr('required');

  }
  /*
  if($(this).val()==4 || $(this).val()==7){
     //$('#unit').removeAttr('data-parsley-maxcheck');
    $('select[name="disciplines[]"]').removeAttr('data-parsley-maxcheck');//.removeAttr('required');
    $('select[name="disciplines[]"]').removeAttr('required');
    $('select[name="job"]').removeAttr('required');
  }else{
    //$('#unit').removeAttr('data-parsley-maxcheck');
    //$('#unit').attr('data-parsley-maxcheck',1);
    $('select[name="disciplines[]"]').attr('data-parsley-maxcheck',1);//.addAttr('required');
    $('select[name="disciplines[]"]').attr('required',true);
    $('select[name="job"]').attr('required',true);
  }

    if(getVal==2){
        $('select[name="job"]').attr('required', true);
    }else{
        $('select[name="job"]').removeAttr('required');
    }
    */
});

var units = {!! json_encode($units) !!}; 
var job = {{ isset($employee) ? $employee->job : "0" }};
var job_time =  {!! json_encode($job_titles) !!};
var disciplines = {!! json_encode($disciplines) !!};
var discipline =  @if(isset($employee)){!! json_encode($employee->disciplines) !!}  @else [] @endif;
var unit_employee = $('#unit_employee').val();

$("#etid").change(function(){
   if($(this).val() == 7){
        var html = "<option value=\"all\">All</option> " + $("#unit").html();
        $("#unit").html(html);
    }
});
<?php if(!$employee){ ?>
$("#clockid").on('keyup', function(){
  var id = $(this).val();
  $("#password").val(id);
});
<?php } ?>

@if(\Cache::get('function_amada') == 1)

	$("#unit").change(function(){
	   var val =  $(this).val();
	   if(val && val.includes('all')){
	        selectAllUnit();
	    }
	    val =  $(this).val();
	   var option ="";
	   if(val != null)
	    {
	        for(var i = 0;i < val.length; i++)
	        {
	            for(var j=1;j <= Object.keys(disciplines).length; j++){
	                var item = disciplines[j];
	                if(item){
	                    if(val[i] == item["refkey"]){
	                        option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
	                    }
	                }
	            }
	            break;
	        }
	    }
	    $("#disciplines").html(option);
	    selectDisciplinesItemByValue();
	    $("#disciplines").change();
	});
@endif

$("#disciplines").change(function () {
    var val = $(this).val();
    var option ="";
    @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	 	option ="<option value=''></option>";
	@endif

    if(val != null)
    {
        for(var i = 0;i < val.length; i++)
        {
            for(var j=1;j <= Object.keys(job_time).length; j++){
                var item = job_time[j];
                if(item){
                	@if(\Cache::get('function_amada') == 1)

	                    if(val[i] == item["notes"] && checkContainUnit(item["refkey"])){
	                        option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
	                    }
                    @else
						if(val[i] == item["notes"]){
                        	option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
                    	}
                    @endif
                }
            }
        }
    }
    $("#job").html(option);

    selectItemByValue();

});

function checkContainUnit(value){
    var units = $('#unit').val();
    for(var k = 0;k < units.length; k++){
        if(value == units[k] && k==0)
            return true;
    }
    return false;
}

function selectDisciplinesItemByValue(){
    var elmnt=document.getElementById("disciplines");
    var check = 0;

    for(var i=0; i < elmnt.options.length; i++)
    {
        for(var j = 0;j < Object.keys(discipline).length; j++){
            if(elmnt.options[i].value == discipline[j] && discipline[j] != 0) {
              elmnt.selectedIndex = i;
              break;
            }
        }
    }
}

function selectAllUnit(){
    var elmnt=document.getElementById("unit");
    var arr = new Array();
    for(var i=1; i < elmnt.options.length; i++)
    {
        arr.push(elmnt.options[i].value);
    }
    $("#unit").val(arr);
}

function selectItemByValue(){
    var elmnt=document.getElementById("job");
    var check = 0;
    for(var i=0; i < elmnt.options.length; i++)
    {
        if(elmnt.options[i].value == job && job != 0) {
          elmnt.selectedIndex = i;
          check = 1;
          break;
        }
    }
    if(check == 0)
        elmnt.selectedIndex = 1;

}

$("#fac_id").change(function () {
	
    var val = $(this).val();
    var option ="<option value='all'>All</option>";
    var unit_array = new Array();
    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                var index = unit_employee.indexOf(""+item['key']+"");
                option += '<option value="'+item['key'] +'"';
                if(index >= 0) option += 'selected';
                option += '>' +item['value'] + '</option>';

                unit_array.push(item['key']);
            }    
        }
    }
    $('#unit_array').val(unit_array);
    $("#unit").html(option);  
}); 

@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id").change();
@endif	 

@if(\Cache::get('function_amada') == 1)
	window.onload = $("#unit").change();
@else
	window.onload = $("#etid").change();
	window.onload = $("#disciplines").change();
@endif
@append
