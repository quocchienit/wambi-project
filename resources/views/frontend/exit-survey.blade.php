@extends('frontend.layout')
@section('content')
<style>
/* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 70%;
    }
    .selectinsurance{
        margin: auto;
        width: 60%;  
        padding-bottom: 20px;      
        z-index: 2;
    }
    .headinsurance{
        margin: auto;
        padding: 20px;
        width: 100%;        
        z-index: 1;
        text-align: center;
        font-weight: bold;
    }
    .form-control {
        background-color: #FFFFFF; 
         border: 1px solid #E3E3E3; 
         border-radius: 4px; 
         color: #565656; 
         padding: 7px 12px; 
         height: 38px; 
         max-width: 100%; 
        -webkit-box-shadow: none;
        box-shadow: none;
        -webkit-transition: all 300ms linear;
        -moz-transition: all 300ms linear;
        -o-transition: all 300ms linear;
        -ms-transition: all 300ms linear;
        /* transition: all 300ms linear; */
    }

    .form-control {
         display: block; 
         width: 100%; 
         height: 34px; 
         padding: 6px 12px; 
         font-size: 14px; 
         line-height: 1.42857143; 
         color: #555; 
         background-color: #fff; 
         background-image: none; 
         border: 1px solid #ccc; 
         border-radius: 4px; 
         -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075); 
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }
</style>
<div class="container">
  <form action="" method="post" accept-charset="utf-8" novalidate>
                  {!! csrf_field() !!}            
    {{--*/ $i = 1 /*--}}
    @if(isset($data))
      @foreach ($data as $element)
        @include('frontend.partials.exit-survey', ['questions' => $element['questions'],'header'=>$element['header'],'name'=>$element['name'], 'value' => $i])
        @if(is_null($element['questions']))
          {{--*/ $i = $i + 0 /*--}}
        @else
        {{--*/ $i = $i + count($element['questions']) /*--}}
        @endif
      @endforeach
    @endif
    @if(\Cache::get('function_ambassador') != 1)
      <button class="btn btn-success waves-effect waves-light pull-right" id ="btnsubmit">
         <span class="btn-label">
             <i class="fa fa-check"></i>
          </span>Submit
      </button>
    @else
      <button type="submit" class="btn btn-success waves-effect waves-light pull-right" id ="btnsubmit">
        <span class="btn-label">
           <i class="fa fa-check"></i>
        </span>Submit
      </button>
    @endif

    <!-- Select Change submit -->

    <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
        <div class = "headinsurance">
            <h4>Please select your insurance provider</h4>
        </div>
        <div class = "form-groups selectinsurance">
            <h5>Insurance Payor</h5>
            <select class = "form-control" id = "insurance"  name="insurance" onchange="this.form.submit()" parsley-trigger="change" class="select2" required data-placeholder="Select Insurance Payor ...">
                <option value="">Select Insurance Payor...</option>                        
                <option value="0">Not Available</option>  
                    @foreach ($insurance as $element)
                <option value="{{ $element->key }}">{{ $element->value }}</option>
                @endforeach                        
            </select>
        </div>    
      </div>
    </div>

    <!-- End Select change -->

  </form>
</div>

@stop
@section('page-script')
{{-- $('input').iCheck(); --}}
{{-- FormiCheck.init(); --}}
$("input:checkbox").on('click', function() {
  // in the handler, 'this' refers to the box clicked on
  var $box = $(this);
  if ($box.is(":checked")) {
    // the name of the box is retrieved using the .attr() method
    // as it is assumed and expected to be immutable
    var group = "input:checkbox[name='" + $box.attr("name") + "']";
    // the checked state of the group/box on the other hand will change
    // and the current value is retrieved using .prop() method
    $(group).prop("checked", false);
    $box.prop("checked", true);
  } else {
    $box.prop("checked", false);
  }
});
var modal = document.getElementById('myModal');
var insurance_payor = {{ $enable_insurance_payor }};
$('#btnsubmit').click(function() {
    var table = $('table');
    var rows = table.find('tr');
    var error = 0;
    var ierr = 0;
    for (i = 0; i < rows.length; i++) {
      ierr=0;
      var cell = rows.eq(i).find('td');
      for (a = 0; a < cell.length; a++) {
        var input = cell.eq(a).find(':input').get(0);
        if (input && !input.checked) {          
          ierr++;   
        }
      }
      if(ierr == 5)
      {
        error++;
        rows.eq(i).addClass('error');
      }
      else{
        rows.eq(i).removeClass('error');
      }
    } 

    if (error > 0){
      alert('Please make sure you have answered every question!')
      return false;
    }
    
    if(insurance_payor == 1){                
        // Get the <span> element that closes the modal
        modal.style.display = "block";
        return false;
    }
    
    return true; 
  })
@append