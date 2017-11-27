@extends('admin.layout',['script_patient'=>1])
@section('content')
<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="card-box">
            <form action="{{ isset($patient)?route('admin::patient::edit',['patient'=>$patient->pid]):route('admin::patient::add') }}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                {!! csrf_field() !!}            
                <h4 class="header-title">ADD PATIENT</h4>
                <!--
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::patient::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
                -->
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
                {{-- unit --}}
                <div class="form-groups">
                    <h5 class="m-t-30">Unit*</h5>
                    <select  name="lid" id ="unit" parsley-trigger="change" required class="select2" data-placeholder="Select Unit ...">
                        <option value="">Select Unit...</option>
                        @foreach ($units as $element)
                        <option value="{{ $element->key }}" {{ (isset($patient) && $element->value == $patient->unitname())?'selected':'' }}>{{ $element->value }}</option>
                        @endforeach
                    </select>                    
                </div>
                {{-- email --}}
                <div class="form-group">
                    <h5 class="m-t-30">Email</h5>
                    <input name="email" value="{{ $patient->email or '' }}" parsley-trigger="change"  type="text" placeholder="Patient Email" class="form-control" >
                </div>
                {{-- phone number --}}
                <div class="form-group">
                    <h5 class="m-t-30">Phone number</h5>
                    <input name="mobile" value="{{ $patient->mobile or '' }}" parsley-trigger="change"  type="text" placeholder="Patient Phone Number" class="form-control" >
                </div>
                <!--
                <div class="form-group">
                    <h5 class="m-t-30">Select Carrier</h5>
                    <select parsley-trigger="change" name="carrier"  data-placeholder="Select Carrier" class="form-control select2">
                        <option value="">Select Carrier</option>
                        @foreach ($carriers as $element)
                            <option value="{{ $element->address }}" {{ (isset($patient)&&($element->address==$patient->patient_carrier))?"selected":"" }}>{{ $element->name }}</option>
                        @endforeach
                    </select>
                </div>
                -->
                {{--Remove Last Name, change First Name to Patient ID #--}}
                {{-- first name --}}
                <div class="form-group">
                    <h5 class="m-t-30">Patient ID #*</h5>
                    <input name="fname" value="{{ $patient->fname or '' }}" parsley-trigger="change" required type="text" placeholder="Patient ID #" class="form-control" >
                </div>
                {{-- last name --}}
                <div class="form-group" style ="display:none;">
                    <h5 class="m-t-30">Last Name*</h5>
                    <input name="lname" value="{{ $patient->lname or '' }}" type="text" parsley-trigger="change" placeholder="Patient First Name" class="form-control" >
                </div>
                {{-- date of birth --}}
                @if(\Cache::get('function_amada') != 1)
                <div class="form-group">
                    <h5 class="m-t-30">Admitted Date*</h5>
                    <div class="input-group">
                        <input name="admitteddate" value="{{ $patient->admitteddate or '' }}" parsley-trigger="change"  required placeholder="Admitted Date" class="form-control datepicker-autoclose" >
                        <span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
                    </div>
                </div>
                @endif
                {{-- Insurance Payor --}}
                <div class="form-groups">
                    <h5 class="m-t-30">Insurance Payor</h5>
                    <select  name="insurance" parsley-trigger="change" class="select2" data-placeholder="Select Insurance Payor ...">
                        <option value="">Select Unit...</option>                        
                        @foreach ($insurance as $element)
                        <option value="{{ $element->key }}" {{ (isset($patient)&&$element->key==$patient->insurance_id)?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach                        
                    </select>                    
                </div>
                {{-- release date --}}
                @if(config("customerindex.out_patient") != \Cache::get('current_index'))
                <div class="form-group">
                    <h5 class="m-t-30">Release Date</h5>
                    <div class="input-group">
                        <input name="release" value="{{ $patient->release or '' }}" type="text" placeholder="Release Date" class="form-control datepicker-autoclose" >
                        <span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
                    </div>
                </div>
                @else
                <div class="form-group">
                    <h5 class="m-t-30">Visitors</h5>
                    <div class="col-sm-12">
                        <div class="form-group text-right m-b-0">
                            <button id ="addToTable" class ="btn btn-default waves-effect waves-light">+ Add</button>
                        </div>
                        <table class="table table-striped table-patient" id="datatable-editable">
                            <thead>
                                <th>Full Name</th>
                                <th>Phone number </th>
                                <th>Email Address </th>
                                <th><i class="icon-settings"></i></th>
                            </thead>
                            <tbody>
                                {{--*/ $i = 1 /*--}}
                                @if(isset($member_family))
                                @foreach($member_family as $element)                             
                                <tr>
                                    <td class="can-edit">
                                        <input name ="fullname{{$i}}" required type="text" class="form-control input-block" value="{{$element->fullname}}"/>
                                    </td>
                                    <td class="can-edit">
                                        <input name ="numberphone{{$i}}" required type="text" class="form-control input-block" value="{{$element->numberphone}}"/>
                                    </td>
                                    <td class="can-edit">
                                        <input name ="email{{$i}}" data-parsley-type="email" required type="text" class="form-control input-block" value="{{$element->email}}"/>
                                    </td>
                                    <!--
                                    <td class="can-edit">
                                        <select parsley-trigger="change" required name="fcarrier{{$i}}"  data-placeholder="Select Carrier" class="form-control select2">
                                            <option value="">Select Carrier</option>
                                            @foreach ($carriers as $key)
                                                <option value="{{ $key->address }}" {{ (isset($element)&&($key->address==$element->carrier))?"selected":"" }}>{{ $key->name }}</option>
                                            @endforeach
                                        </select>
                                    </td>
                                    -->
                                    <td class="actions">                                        
                                        <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                    </td>
                                </tr>
                                {{--*/ $i = $i + 1 /*--}}            
                                @endforeach             
                                @endif                   
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input name="count_members" id ="count_members" value="{{isset($member_family) ? $member_family->count() : 0}}" type="text" hidden>                        
                    </div>
                </div>
                @endif
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::patient::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<input type="hidden" id="unit_patient" value="{{isset($patient)?$patient->unitname():''}}">
@stop
@section('page-script-selected')
	var units = {!! json_encode($units) !!}; 
    var str_carrier = '<select parsley-trigger="change" required name="fcarrier" data-placeholder="Select Carrier" class="form-control select2"><option value="">Select Carrier</option>';
    @foreach ($carriers as $element)
       str_carrier = str_carrier +  
       '<option value="{{ $element->address }}">{{ $element->name }}</option>';
    @endforeach
    str_carrier = str_carrier + '</select>';
    var count = $('#count_members').val();
{{--<script>--}}
$("#fac_id").change(function () {
	
    var val = $(this).val();
    var unit_patient = $('#unit_patient').val();
    var option ="<option value=''></option>";

    for(j=0;j < Object.keys(units).length; j++){
        var item = units[j];
        if(item){
            if(val == item["refkey"]){
                option += '<option value="'+item['key']+'" ';
                if(item["value"]==unit_patient) option+="selected";
                option += '>'+item["value"]+'</option>';
            }    
        }
    }
    $("#unit").html(option);  
}); 
   @if (Auth::user()->type() =='super-executive')  
	window.onload = $("#fac_id").change();
@endif		 
@append