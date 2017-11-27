<div class="tab-pane {{ isset($award)?(($award->type=='unit_award')?"active":""):"active" }}" id="unit-award">
    <form action="" method="post" accept-charset="utf-8">
        {!! csrf_field() !!}   
        @if (Auth::user()->type() =='super-executive')  
 			<div class="form-group">
                <h5 class="m-t-30">Facility*</h5>
			    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id_unit">
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
        <?php
        $units_array = array();
        foreach ($units as $element){
            $units_array[] = $element->key;
        }
        $units_item = implode($units_array, ',');
        ?>
        <input type="hidden" value="{{ $units_item }}" name="unit_array">
        <div class="form-group">
            <h5 class="m-t-30">Unit*</h5>
            <select name="owner" class="form-control select2" parsley-trigger="change" required id ="unitid">
	         	<option value="">Select Unit</option>
                @if(\Cache::get('function_amada') != 1 || \Auth::user()->type() == 'super-executive')      
                    <option value="all">All</option>                
                @endif
                @foreach($units as $element)
                    <option value="{{ $element->key }}" {{ (isset($award)&&$award->owner==$element->key) || (!isset($award)&& $element->key == \Session::get('current_unit')) ?"selected":""  }}>{{ $element->value }}</option>                    
                @endforeach
            </select>
        </div>
        {{-- discipline --}}
                <div class="form-groups">
                    <h5 class="m-t-30">Discipline</h5>
                    <select  name="disciplines[]" parsley-trigger="change" class="select2 select2-multiple" multiple="multiple" multiple data-placeholder="Select Discipline ..." id ="disciplines">
                    @foreach ($disciplines as $element)
                        <option value="{{ $element->key }}">{{ $element->value }}</option>
                    @endforeach
                    </select>
                </div>
         {{-- shift time --}}
                @if(\Cache::get('function_amada') != 1)
                <div class="form-group">
                    <h5 class="m-t-30">Shift(s)</h5>
                    <?php
                    function convert_army_to_regular($time) {
                        $hours1 = substr($time, 0, 2);
                        $minutes1 = substr($time, 3, 2);
                        $hours2 = substr($time, 8, 2);
                        $minutes2 = substr($time, 11, 2);
                        return $hours1.':'.$minutes1.':00 - '.$hours2.':'.$minutes2.':00';
                    }
                    ?>
                    <select name="shifts[]" parsley-trigger="change" class="select2 select2-multiple" multiple data-placeholder="Select Shift(s)">
                        @foreach ($shift_times as $element)
                        <option value="{{ $element->key }}" >{{ convert_army_to_regular($element->value) }}</option>
                        @endforeach
                    </select>
                </div>
                @endif
        {{-- Award Type--}}
        <input type="hidden" name="type" value="unit_award">
        <div class="form-group">
            <h5 class="m-t-30">Award Type*</h5>
            <select name="award" class="form-control select2" parsley-trigger="change" required id ="award_unit">
                <option value="">Select Award Type</option>
                
            </select>
        </div>
        {{-- periods--}}
        <div class="form-group">
            <h5 class="m-t-30">Time period*</h5>
            <select name="period" class="form-control select2" parsley-trigger="change" required>
                <option value="">Select Time Period</option>
                @foreach($periods as $element)
                <option value="{{ $element->key }}" {{ (isset($award)&&$award->period==$element->key)?"selected":""  }}>{{ $element->value }}</option>
                @endforeach
            </select>
        </div>
        {{-- first name --}}
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
@section('page-script-selected')
var award = {{ (isset($award) ? $award->award : 0) }};
var award_unit =  {!! json_encode($unit_awards) !!}; 
$('#unitid').change(function () {
    var val = $(this).val();
    var option = '<option value="">Select Unit Award</option>';
    for(i = 0; i <  award_unit.length ; i++){
        award = award_unit[i];
        if(val=='all'){
            if(award["unit_id"] == 1){
                option = option + '<option value = "' + award["key"] + '">' + award["value"] + '</option>';
            }
        }else{
            if(award["unit_id"] == val){
            option = option + '<option value = "' + award["key"] + '">' + award["value"] + '</option>';
            }
        }
    }
    $("#award_unit").html(option);    
    selectItemByValue();    
});
function selectItemByValue(){
    var elmnt=document.getElementById("award_unit");
    for(var i=0; i < elmnt.options.length; i++)
    {
        if(elmnt.options[i].value == award) {
        elmnt.selectedIndex = i;
        break;
    }
  }
}

var units = {!! json_encode($units) !!}; 

$("#fac_id_unit").change(function () {
	
    var val = $(this).val();
    var option ="<option value=''>Select Unit</option><option value='all'>ALL</option>";

    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>";
            }    
        }
    }
    $("#unitid").html(option);  
}); 
@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id_unit").change();
@endif	 
window.onload = $("#unitid").change();
@append