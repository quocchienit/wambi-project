<div class="tab-pane {{ (isset($award)&&$award->type=='employee_award')?"active":"" }}" id="employee-award">
    <form action="" method="post" accept-charset="utf-8">
        {!! csrf_field() !!}
        @if (Auth::user()->type() =='super-executive')  
 			<div class="form-group">
 				<h5 class="m-t-30">Facility*</h5>
			    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id_employee">
			      <option value="">Select Facility</option>
            
			      @forelse ($facs as $item)
				      	<option value="{{ $item->key }}" {{ (isset($award)&&$award->fac_id == $item->key)|| (!isset($award) && $item->key == \Session::get('current_fac')) ?"selected":"" }}>{{ $item->value }}</option>                            
			      @empty
				      	{{-- empty expr --}}
			      @endforelse
			    </select>                
			</div>
		@endif	
		 {{-- unit --}}
        <div class="form-group">
            <h5 class="m-t-30">Unit*</h5>
            <select name="units" id="select_unit_employee" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Unit">
                <option value="">Select Unit</option>
                @foreach($units as $element)
            		<option value="{{ $element->key }}" {{ (isset($award)&&$award->owner==$element->key) || (!isset($award)&& $element->key == \Session::get('current_unit')) ?"selected":""  }}>{{ $element->value }}</option>                    
                 @endforeach
            </select>
        </div>				  
        <div class="form-group">
            <h5 class="m-t-30">Employee*</h5>
            <select name="owner" class="employee_ajax_search" data-placeholder="Search Employee"  parsley-trigger="change" required >
                <option value="" selected="selected"></option>
            </select>
        </div>
       
        {{-- employee award--}}
        <input type="hidden" name="type" value="employee_award">
        <div class="form-group">
            <h5 class="m-t-30">Employee Award*</h5>
            <select id="select_award" name="award" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Employee Award">
                <option value="">Select Employee Award</option>
                @foreach($employee_awards as $element)
                    <option value="{{ $element->key }}" {{ (isset($award)&&$award->award==$element->key)?"selected":""  }}>{{ $element->value }}</option>
                @endforeach
            </select>
        </div>
        {{-- notes --}}
        @if(\Cache::get('function_amada') != 1)
        <div class="form-group" class="hidden">
            <h5 class="m-t-30">Specify details*</h5>
            <input name="note" value="{{ $award->notes or '' }}" parsley-trigger="change" required type="text" placeholder=" Specify details" class="form-control" >
        </div>                    
        @endif
        {{-- periods--}}
        <div class="form-group">
            <h5 class="m-t-30">Time period*</h5>
            <select name="period" class="form-control select2" parsley-trigger="change" required data-placeholder='Select Time Period'>
                <option value="">Select Time Period</option>
                @foreach($periods as $element)
                <option value="{{ $element->key }}" {{ (isset($award)&&$award->period==$element->key)?"selected":""  }}>{{ $element->value }}</option>
                @endforeach
            </select>
        </div>
        {{-- pecks --}}
        <div class="form-group">
            <h5 class="m-t-30">Pecks*</h5>
            <input name="peck" value="{{ $award->peck or '' }}" data-parsley-type="digits" parsley-trigger="change" required type="text" placeholder="Enter pecks" class="form-control" >
        </div>            
        <div class="form-group text-right m-b-0">
            <button class="btn btn-primary waves-effect waves-light" type="submit">
                Submit
            </button>
            <a href="{{ route('admin::award::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                Cancel
            </a>
        </div>
    </form>
</div>
@section('page-script')
    var isamada = 0;
    @if(\Cache::get('function_amada') == 1)
        isamada = 1;
    @endif

    $("[name='award']").change(function(){    
        var notes = $("[name='note']")
        var notes_wrap = notes.closest('.form-group');
        if(isamada != 1){
            if($(this).val()=='3'){
                notes.attr('required','required');
                notes_wrap.show();      
            }else{
                notes.removeAttr('required');  
                notes_wrap.hide();      
            }
        }else{
            notes.removeAttr('required');  
            notes_wrap.hide();
        }
    })
   
 	 
var units = {!! json_encode($units) !!}; 
var employee_awards = {!! json_encode($employee_awards) !!}; 

$("#select_unit_employee").change(function () {
	
    var val = $(this).val();
	var option ="<option value=''>Select Employee Award</option>";

    for(j=0;j < Object.keys(employee_awards).length; j++){
        var item = employee_awards[j];
        if(item){
            if(val == item["unit_id"]){
                option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>";
            }    
        }
    }
    $("#select_award").html(option);  
}); 

$("#fac_id_employee").change(function () {
	
    var val = $(this).val();
	var option ="<option value=''>Select Unit</option>";

    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>";
            }    
        }
    }
    $("#select_unit_employee").html(option);  
}); 
@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id_employee").change();
@endif	 
@append