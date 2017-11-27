@extends('frontend.out-patient.layout')
@section('content')
<style>
    .panel-body{
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        height: 50%;
        margin: auto;
    }
</style>
<form class="form-horizontal m-t-20" method="post" action="/selectunit" id="select-form">
	{!! csrf_field() !!}

    	<div class ="col-xs-12">
    			<div class="form-group  text-center ">
                <div class="col-xs-12">
                  	<img src="assets/images/survey/outpatient.png" alt="image" class="img-responsive ion-load-c">
                </div>
            </div>
            <!--
	      	<div class="">
		      		<div class="iconbox text-center" style ="font-size:40px;">
		      			<i class="ion-load-c" id ="img"></i>
		      		</div>
	      	</div>
	      	-->

        <div class="form-group " id = "error-code" hidden></div>
    	{{-- carrier --}}
        <div class="form-group">

            <select parsley-trigger="change" required name="unit"  data-placeholder="Select your location" class="form-control select2">
            <!--
                <option value="">Select your location</option>
            -->

                @foreach ($units as $element)
                	<option value="{{ $element->fname }}" >{{ $element->fac() }}, {{ $element->value }}</option>
                @endforeach
            </select>
        </div>

        <div class ="clearfix"></div>

      <div class="form-group text-center">
          <div class="col-xs-12">
              <button id="btnsubmit" class="btn btn-primary waves-effect waves-light" type="submit">SUBMIT</button>
          </div>
      </div>
    </div>
</form>
@stop
@section('script')
$('#select-form').submit(function(){
  var _ = $(this);
  $.ajax({
    url: _.attr('action'),
    type: 'post',
    dataType: 'json',
    data: _.serialize(),
  })
  .done(function(response) {
    if(!response.success){
      $('#error-code').removeAttr('hidden');
      $('#error-code').html(response.message);
    }else{
      if(!response.ambassador)
        window.location = 'code';
      else
        window.location = 'survey';
    }
  })
  .fail(function(){
     // swal("Error!", "Problem when processing request", "error");
     console.log('error');
  })
  return false;
});

@append
