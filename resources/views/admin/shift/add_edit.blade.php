@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="card-box">
            <h4 class="m-t-0 header-title"><b>Post Shift</b></h4>
            <form action="{{ isset($shift_master)?url("admin/shift/edit/$shift_master->id"):'' }}" method ="post">
    		{!! csrf_field() !!}    
    		@if (Auth::user()->type() =='super-executive')  
     		<div class="form-group">
                    <label for="userName">Facility*</label>
				    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id">
				      <option value="">Select Facility</option>
                
				      @forelse ($facs as $item)
    				      	<option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->fac_id == $item->key)|| (!isset($shift_master) && $item->key == \Session::get('current_fac')) ?"selected":"" }}>{{ $item->value }}</option>                            
				      @empty
    				      	{{-- empty expr --}}
				      @endforelse
				    </select>                
				</div>
				@endif		  
                        
                <div class="form-group">
                    <label for="userName">Unit*</label>
				    <select name="shift_unit" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Unit" id="shift_unit">
				      @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	            		 <option value="">Select Unit</option>
	            	  @endif
                
				      @forelse ($units as $item)
    				      	<option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->shift_unit == $item->key)|| (!isset($shift_master) && $item->key == \Session::get('current_unit')) ?"selected":"" }}>{{ $item->value }}</option>                            
				      @empty
    				      	{{-- empty expr --}}
				      @endforelse
				    </select>                
				</div>
                <div class="form-group">
                    <label for="emailAddress">Discipline*</label>
                    <select name="shift_discipline" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Discipline" id="shift_discipline">
	            		 <option value="" disabled selected>Select Descipline</option>
                      @forelse ($disciplines as $item)
                        <option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->shift_discipline == $item->key)?"selected":"" }}>{{ $item->value }}</option>
                      @empty
                        {{-- empty expr --}}
                      @endforelse
                    </select>                
                </div>
                @if(\Cache::get('function_amada') != 1)                                
                <div class="form-group">
                    <label for="emailAddress">Hourly Rate</label>
				    <select name="shift_hourly_rate[]" class="form-control select2" parsley-trigger="change" multiple data-placeholder="Select Hourly Rate">
				      @forelse ($hourly_rates as $item)
				      	<option value="{{ $item->id }}" {{ (isset($shift_master)&&in_array($item->id,$shift_master->hourly_rate->pluck('id')->all()))?"selected":"" }}>{{ $item->display_name }}</option>
				      @empty
				      	{{-- empty expr --}}
				      @endforelse
				    </select>                
                </div>
                @endif
                <div class="form-group">
                    <label>Job Title*</label>
                    <select placeholder="Job Title" name="shift_job_title" parsley-trigger="change" required class="form-control select2" data-placeholder="Select Job Title" id ="shift_job_title">
	                    <option value=""></option>
				      @forelse ($job_titles as $item)
				      	<option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->shift_job_title == $item->key)?"selected":"" }}>{{ $item->value }}</option>
				      @empty
				      	{{-- empty expr --}}
				      @endforelse
                    </select>
                </div>
                <div class="form-group">
                    <label>Date*</label>
                    <input value="{{ $shift_master->shift_date or '' }}" parsley-trigger="change" required name="shift_date" placeholder="Select Date" class="form-control datepicker-autoclose">
                </div>
                @if(\Cache::get('function_amada') != 1)                                
                <div class="form-group">
                    <label>Time*</label>
                    <select placeholder="Time" name="shift_time" parsley-trigger="change" required class="form-control select2" data-placeholder="Select Shift Time">
	                    <option value=""></option>
				      @forelse ($shift_times as $item)
				      	<option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->shift_time == $item->key)?"selected":"" }}>{{ $item->value }}</option>
				      @empty
				      	{{-- empty expr --}}
				      @endforelse
                    </select>
                </div>
                @else                
                <div class="col-md-6">
                    <div class="form-group">
                    <label>Start Time*</label>
                        <div class="input-group m-b-15">
                            <div class="bootstrap-timepicker">
                                <input type="text" class="form-control timepicker" required value="{{$shift_master->shift_starttime or '00:00'}}" name = "shift_starttime">
                            </div>
                            <span class="input-group-addon bg-custom b-0 text-white"><i class="glyphicon glyphicon-time"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    <label>End Time*</label>
                        <div class="input-group m-b-15">
                            <div class="bootstrap-timepicker">
                                <input type="text" class="form-control timepicker" required value="{{$shift_master->shift_endtime or '00:00'}}" name = "shift_endtime">
                            </div>
                            <span class="input-group-addon bg-custom b-0 text-white"><i class="glyphicon glyphicon-time"></i></span>
                        </div>
                    </div>                    
                </div>
                <div class="form-group">
                    <label>City*</label>
                    <input class="form-control" type="text" value="{{$shift_master->city or ''}}" name="shift_city" placeholder="Type City">
                </div>
                @endif
                <div class="form-group">
                    <label>Pecks*</label>
                    <select placeholder="Job Title" name="shift_pecks" parsley-trigger="change" required class="form-control select2" data-placeholder="Select Pecks" id ="shift_pecks">
	                    <option value=""></option>
				      @forelse ($pecks as $item)
				      	<option value="{{ $item->key }}" {{ (isset($shift_master)&&$shift_master->shift_pecks == $item->key)?"selected":"" }}>{{ $item->display_name}}</option>
				      @empty
				      	{{-- empty expr --}}
				      @endforelse
                    </select>
                </div>
                <div class="form-group">                
                    <label>Note</label>
					<textarea name="shift_notes" class="form-control" parsley-trigger="change" rows="2" placeholder="Enter note.">{{ $shift_master->shift_notes or '' }}</textarea>	
				</div>			
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::shift::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>	
@stop
@section('page-script-selected')
var units = {!! json_encode($units) !!}; 
var dataJobTitle = {!! json_encode($job_titles) !!}; 
var dataPecks = {!! json_encode($pecks) !!}; 
var job = {{isset($shift_master) ? $shift_master->shift_job_title : 0}};
var pecks = {{isset($shift_master) ? $shift_master->shift_pecks : 0}};
var disciplines = {!! json_encode($disciplines) !!}; 
var discipline = {{isset($shift_master) ? $shift_master->shift_discipline : 0}};

$('.clockpicker-start').clockpicker();
$('.clockpicker-end').clockpicker();

            
$("#shift_discipline").change(function () {
    var val = $(this).val();
    var foo = [];         
    $("#shift_job_title :selected").map(function(i, el) {
        foo[i] =$(el).val();
    });
    var option ="";
    @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	 	option ="<option value=''></option>";
	@endif
    for(j=1;j <= Object.keys(dataJobTitle).length; j++){
        var item = dataJobTitle[j];
        if(item){
        	@if(\Cache::get('function_amada') == 1)
	            if(val == item["notes"] && $('#shift_unit').val() == item["refkey"]){
	                option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
	            }  
            @else
            	if(val == item["notes"]){
                	option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
            	}  
            @endif
        }
    }
    $("#shift_job_title").html(option);    
    selectItemByValue();    

});

function selectItemByValue(){
    var elmnt=document.getElementById("shift_job_title");
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
    var option ="<option value=''></option>";

    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
            }    
        }
    }
    $("#shift_unit").html(option);  
}); 
$("#shift_unit").change(function () {
	
    var val = $(this).val();
    var foo = [];         
    $("#shift_pecks :selected").map(function(i, el) {
        foo[i] =$(el).val();
    });
    var option ="";
    var optiondiscipline = "";
    @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	 	option ="<option value=''></option>";
	@endif
	
    for(j=0;j < Object.keys(dataPecks).length; j++){
        var item = dataPecks[j];
        if(item){
            if(val == item["notes"]){
                option += "<option value=\""+item['key'] +"\">" +item['display_name'] + "</option>"
            }    
        }
    }
    
 	$("#shift_pecks").html(option);    
    shift_unit_selectItemByValue();  
    @if(\Cache::get('function_amada') == 1)
    	
	    for(var j=1;j <= Object.keys(disciplines).length; j++){
	        var item = disciplines[j];
	        if(item){
	            if(val == item["refkey"]){
	                optiondiscipline += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
	            }    
	        }
	    }
	    $('#shift_discipline').html(optiondiscipline);
	    selectDisciplinesItemByValue();
	    $("#shift_discipline").change();
    @endif
});

function selectDisciplinesItemByValue(){
    var elmnt=document.getElementById("shift_discipline");
    var check = 0;

    for(var i=0; i < elmnt.options.length; i++)
    {   
        if(elmnt.options[i].value == discipline && discipline != 0) {
          elmnt.selectedIndex = i;
          break;
        }
    }
}

function shift_unit_selectItemByValue(){
var elmnt=document.getElementById("shift_pecks");

  for(var i=0; i < elmnt.options.length; i++)
  {
    if(elmnt.options[i].value == pecks) {
      elmnt.selectedIndex = i;
      break;
    }
  }
}
@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id").change();
@endif		 

window.onload = $("#shift_unit").change();
@if(\Cache::get('function_amada') != 1)
	window.onload = $("#shift_discipline").change();
@endif
@append