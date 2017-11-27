<form class="form-horizontal form-before" method="post" action="{{ route('admin::config::set_fac_unit') }}">
                    {!! csrf_field() !!}     
@if (Auth::user()->type() =='super-executive')  
<div class="form-group">
    <h5 class="m-t-30">Facility</h5>
    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id_unit_config">
      <option value="">Select Facility</option>
      @forelse ($facs as $item)
	      	<option value="{{ $item->key }}" {{($item->key == \Session::get('current_fac'))?"selected":""}} >{{ $item->value }}</option>                            
      @empty
	      	{{-- empty expr --}}
      @endforelse
    </select>                
</div>
@endif	
<?php
$units_array = array();
foreach ($units as $element){
$units_array[] = $element->key;
}
$units_item = implode($units_array, ',');
?>
<input type="hidden" value="{{ $units_item }}" name="unit_array">
<div class="form-group">
<h5 class="m-t-30">Unit</h5>
<select name="unit_id" class="form-control select2"  parsley-trigger="change" required id ="unitid_config" onchange="this.form.submit()">
	@foreach($units as $element)
        <option value="{{ $element->key }}" {{ ($element->key == \Session::get('current_unit')) ?"selected":""  }}>{{ $element->value }}</option>
    @endforeach
</select>
</div>
<span hidden="" id="current_unit" data-current-unit="{{\Session::get('current_unit')}}"></span>
</form>

@section('page-script')
var units = {!! json_encode($units) !!}; 
var current_unit = $("#current_unit").data("current-unit");
$("#fac_id_unit_config").change(function () {
    var val = $(this).val();
     var option ="<option value=''>Select Unit</option>";
    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){

            	if(item['key'] == current_unit)
            	{
            		option += "<option selected value=\""+item['key'] +"\">" +item['value'] + "</option>";
            	}
            	else
            	{
            		option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>";
            	}
            }    
        }
    }
    $("#unitid_config").html(option);  
}); 
@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id_unit_config").change();
@endif	 
@append
