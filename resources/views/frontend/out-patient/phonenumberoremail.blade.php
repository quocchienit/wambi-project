@extends('frontend.out-patient.layout')
@section('content')
<style>
    .panel-body{
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: 50%;
        margin: auto;
    }
</style>
<form class="form-horizontal m-t-20" method="post" action="/phonenumber-email" id="login-form">                  
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
    	<div class="form-group ">
                <div class="col-xs-12">
                    <input type="text" id="numberphone" maxlength ="20" name ="numberphone" placeholder = "Enter your phone number" class="form-control"
        data-mask="(999) 999-9999">
                </div>
            </div>
 			<div class="form-group text-center">
                <div class="col-xs-12">
                	OR
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                	<input type="email" class="form-control" parsley-type="email" placeholder="Enter your email address"  name="email">
                </div>
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
$('#number').keypress(function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
});
$('.login').click(function(){
    $('#login-form').fadeOut('slow');
    $('#recover-form').fadeIn('slow');    
});

var btnsubmit = document.getElementById("btnsubmit");
btnsubmit.onclick = function()
{
    $('#error-code').attr('hidden');
}
$('#login-form').submit(function(){
  var _ = $(this);
  $.ajax({
    url: _.attr('action'),
    type: 'post',
    dataType: 'json',
    data: _.serialize(),
  })
  .done(function(response) {
    console.log(response);
    if(!response.success){
      $('#error-code').removeAttr('hidden');
      $('#error-code').html(response.message);
    }else{
      if(!response.ambassador){
        window.location = 'selectunit';
      }else{
        window.location = 'code';
      }
    }
  }) 
  .fail(function(){
     // swal("Error!", "Problem when processing request", "error");
  }) 
  return false;                  
});

@append