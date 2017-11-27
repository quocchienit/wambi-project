@extends('admin.layout',['script_patient'=>1])
@section('content')
<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="card-box">
            <form action="{{ isset($patient)?route('admin::ambassador::edit',['patient'=>$patient->pid]):route('admin::ambassador::add') }}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                {!! csrf_field() !!}            
                <h4 class="header-title">ADD AMBASSADOR</h4>
                
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
                {{-- unit --}}
                <!--
                <div class="form-groups">
                    <h5 class="m-t-30">Unit*</h5>
                    <select  name="lid" parsley-trigger="change" required class="select2" data-placeholder="Select Unit ...">
                        <option value="">Select Unit...</option>
                        @foreach ($units as $element)
                        <option value="{{ $element->key }}" {{ (isset($patient)&&$element->key==$patient->lid)?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>                    
                </div>-->
                <?php
                $units_array = array();
                foreach ($units as $element){
                    $units_array[] = $element->key;
                }
                $units_item = implode($units_array, ',');
                ?>
                <input type="hidden" value="{{ $units_item }}" name="unit_array">
                 @if (Auth::user()->type() =='super-executive')  
     			<div class="form-group">
                    <label for="userName">Facility*</label>
				    <select name="fac_id" class="form-control select2" parsley-trigger="change" required data-placeholder="Select Facility" id="fac_id">
				      <option value="">Select Facility</option>
                
				      @forelse ($facs as $item)
    				      	<option value="{{ $item->key }}" {{ (isset($patient)&&$patient->fac_id == $item->key)|| (!isset($patient) && $item->key == \Session::get('current_fac')) ?"selected":"" }}>{{ $item->value }}</option>                            
				      @empty
    				      	{{-- empty expr --}}
				      @endforelse
				    </select>                
				</div>
				@endif		  
                <div class="form-groups">
                    <h5 class="m-t-30">Unit*</h5>
                    <select id='unit' name="units[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Select Unit ...">
                        @if(\Cache::get('function_amada') != 1)
                            <option value="all">All</option>
                        @endif
                        @foreach ($units as $element)
                        <option value="{{ $element->key }}" {{ (isset($patient)&&in_array($element->key,$patient->units))?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- email --}}
                <div class="form-group">
                    <h5 class="m-t-30">Email</h5>
                    <input name="email" value="{{ $patient->email or '' }}" parsley-trigger="change"  type="text" placeholder="Email" class="form-control" >
                </div>

                {{-- phone number --}}
                <div class="form-group">
                    <h5 class="m-t-30">Phone number</h5>
                    <input name="mobile" value="{{ $patient->mobile or '' }}" parsley-trigger="change"  type="text" placeholder="Phone Number" class="form-control" >
                </div>
                
                {{-- first name --}}
                <div class="form-group">
                    <h5 class="m-t-30">Ambassador*</h5>
                    <input id = "fname" name="fname" value="{{ $patient->fname or '' }}" parsley-trigger="change" required type="text" placeholder="Name or ID#" class="form-control" >
                </div>
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::ambassador::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
@stop
{{--@section('page-script')--}}
{{--$('#fname').keypress(function validate(evt) {--}}
  {{--var theEvent = evt || window.event;--}}
  {{--var key = theEvent.keyCode || theEvent.which;--}}
  {{--key = String.fromCharCode( key );--}}
  {{--var regex = /[a-z0-9]|\./;--}}
  {{--if( !regex.test(key) ) {--}}
    {{--theEvent.returnValue = false;--}}
    {{--if(theEvent.preventDefault) theEvent.preventDefault();--}}
  {{--}--}}
{{--});--}}
{{--@append--}}
<input type="hidden" value="{{isset($patient)?json_encode($patient->units):''}}" id="unit_patient">
@section('page-script-selected')
var units = {!! json_encode($units) !!};
var unit_patient = $('#unit_patient').val();
$("#fac_id").change(function () {
	
    var val = $(this).val();
    var option ="<option value='all'>All</option>";

    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                var index = unit_patient.indexOf(""+item['key']+"");
                option += '<option value="'+item['key'] +'"';
                if(index >= 0) option += 'selected';
                option += '>' +item['value'] + '</option>';
            }    
        }
    }
    $("#unit").html(option);  
}); 
@if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id").change();
@endif		 
@append