@extends('frontend.out-patient.layout')
@section('content')
<style>
    .content_div{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    }

</style>
<div class="content_div">
    <form class="form-horizontal m-t-20" method="post" action="/code" id="login-form">
        {!! csrf_field() !!}
        <div class ="col-xs-12">
            <div class="form-group  text-center ">
                    <div class="col-xs-12">
                        <img src="assets/images/survey/outpatient.png" alt="image" class="img-responsive ion-load-c">
                    </div>
                </div>
            <div class="">
                <div class="iconbox text-center" style ="font-size:40px;">
                <i class="ion-load-c" id ="img"></i>
                </div>
                    <div class="col-sm-12 text-center">
                            Type in the code we sent you!
                        </div>
            </div>
            <div class="form-group " id = "error-code" hidden>

            </div>
            <div class="form-group">
                <div class="col-25">
                    <input type="tel" maxlength ="1" pattern="\d*" onfocus="this.select();" name ="digit0" class="text-code" required="" id="text1">
                </div>
                <div class="col-25">
                    <input type="tel" maxlength ="1" pattern="\d*" onfocus="this.select();" name ="digit1" class="text-code" required="" id="text2">
                </div>
                <div class="col-25">
                    <input type="tel" maxlength ="1" pattern="\d*" onfocus="this.select();" name ="digit2" class="text-code" required="" id="text3">
                </div>
                <div class="col-25">
                    <input type="tel" maxlength ="1" pattern="\d*" onfocus="this.select();" name ="digit3" class="text-code" required="" id="text4">
                </div>
            </div>
            <div class ="clearfix"></div>
            <div class="form-group">

              <div class ="checkbox checkbox-circle" style="margin-left: 15px;">
                  <input id="chkTerm" type ="checkbox" name = "chkTerm">
                    <label for="chkTerm">
                        I accept
                    </label>

                  <a href ="javascript:void(0);" id="btnTerm" data-animation="fadein" data-plugin="custommodal"
                           data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a"
                           data-target="#term-condition"> Terms and Conditions</a>
              </div>
          </div>
          <div class="form-group text-center">
              <div class="col-xs-12">
                  <button id="btnsubmit" class="btn btn-primary waves-effect waves-light" type="submit">SUBMIT</button>
              </div>
          </div>
          <div class="form-group">
              <div class="col-sm-12 text-center">
                  <a href="javascript:void(0);" class="text-blue login" id="login">Didn't receive the code?</a>
              </div>
          </div>
        </div>
    </form>
    <!--Form send again code-->
    <form class="form-horizontal m-t-20" method="post" action="/recovercode" id="recover-form" style ="display: none;">
        {!! csrf_field() !!}
      <div class ="col-xs-12">
        <div class="form-group">
            <input type="text" id="number" maxlength ="20" required="" name ="numberphone" placeholder = "Phone Number" class="form-control">
        </div>
        <div class="form-group text-center">
                <div class="col-xs-12">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">SUBMIT</button>
                </div>
            </div>
      </div>
    </form>
    <a href ="javascript:void(0);" id="btnCheckLogin" data-animation="fadein" data-plugin="custommodal"
                             data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a"
                             data-target="#chkTermCondition"></a>
</div>

@include('frontend.term.en')
<!--  Modal content for the above example -->
<div id="chkTermCondition" class="modal fade" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">@lang('survey.Oops')</h4>
            </div>
            <div class="modal-body">
                <p>@lang('survey.Opps_Description')</p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
@stop
@section('script')  
  $('#text1').keyup(function () {
    if (this.value.length == this.maxLength) {      
      $('#text2').focus();
    }
});
$('#text2').keyup(function () {
    if (this.value.length == this.maxLength) {      
      $('#text3').focus();
    }
});
$('#text3').keyup(function () {
    if (this.value.length == this.maxLength) {      
      $('#text4').focus();
    }
});
$('#text4').keyup(function () {
    if (this.value.length == this.maxLength) {      
      $('#img').removeClass("ion-load-c");
      $('#img').addClass("icon-check");
    }
});
$('.text-code').keypress(function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
});
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
    if(!document.getElementById("chkTerm").checked)
    {
        document.getElementById("btnCheckLogin").click();
        return false;
    }
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
    if(!response.success){
      $('#error-code').removeAttr('hidden');
      $('#error-code').html(response.message);
    }else{
      if(!response.ambassador)
        window.location = 'survey';
      else
        window.location = 'selectunit';      
    }
  }) 
  .fail(function(){
     // swal("Error!", "Problem when processing request", "error");
  }) 
  return false;                  
});

@append