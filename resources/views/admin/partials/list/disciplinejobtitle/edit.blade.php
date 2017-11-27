@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-8 col-md-10 col-lg-offset-2 col-md-offset-1">
        <div class="card-box">

            <h4 class="m-t-0 header-title">Create @if($type == 'job_title') Job Title @else Discipline @endif</h4>
            <form action="{{ isset($data)?route("admin::listdiscipline::edit",['type'=>$type,'value'=>$data->key]):route("admin::listdiscipline::edit",['type'=>$type]) }}" method ="post" enctype="multipart/form-data">
                {!! csrf_field() !!}       
                @if (session('message'))
                    <div class="alert alert-info">
                        {{ session('message') }}
                    </div>
                @endif                
                <div class="form-group">
                    <label>Name*</label>
                    <input value="{{ $data->value or '' }}" parsley-trigger="change" required name="name" placeholder="Enter Name" class="form-control" >
                </div>
                @if(\Cache::get('function_amada') == 1)
                	 <div class="form-group">
                    <label>Unit*</label>
                    <select name='unit' id = 'unit' parsley-trigger="change" required class="form-control select2" data-placeholder="Select Unit ...">                        
                        <option value=""></option>
                        @foreach ($units as $element)
                        <option value="{{ $element->key }}" {{ (isset($data)&&($element->key==$data->refkey))?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>	
                @endif         		
                @if($type == 'job_title')
                <div class="form-group">
                    <label>Discipline*</label>
                    <select name='discipline' id = 'discipline' parsley-trigger="change" required class="form-control select2" data-placeholder="Select Discipline ...">                        
                        <option value=""></option>
                        @foreach ($discipline as $element)
                        <option value="{{ $element->key }}" {{ (isset($data)&&($element->key==$data->notes))?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>
                @endif
               
               <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::listdiscipline::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
			 <input type="hidden" value="{{ $data->id or '' }}" name="id">
            </form>
        </div>
    </div>
</div>	
@stop
				
@section('page-script')
@if(\Cache::get('function_amada') == 1)
var discipline = {{ isset($data) ? $data->notes : "0" }};
var disciplines =  {!! json_encode($discipline) !!}; 

$("#unit").change(function () {
    var val = $(this).val();
    var option ="";
    @if(config("customerindex.santaanita") != \Cache::get('current_index'))
	 	option ="<option value=''></option>";
	@endif
    
    if(val != null)
    {
        for(i = 0;i < val.length; i++)
        {
            for(j=0;j < Object.keys(disciplines).length; j++){
                var item = disciplines[j];
                if(item){
                    if(val[i] == item["refkey"]){
                        option += "<option value=\""+item['key'] +"\">" +item['value'] + "</option>"
                    }    
                }
            }
        }
    }
    $("#discipline").html(option);
    
    selectItemByValue();    

});
function selectItemByValue(){
    var elmnt=document.getElementById("discipline");
    var check = 0;
    for(var i=0; i < elmnt.options.length; i++)
    {
        if(elmnt.options[i].value == discipline && discipline != 0) {
          elmnt.selectedIndex = i;
          check = 1;
          break;
        }
    }
    if(check == 0)
        elmnt.selectedIndex = 1;

}
window.onload = $("#unit").change();
 @endif
@append