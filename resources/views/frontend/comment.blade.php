@extends('frontend.layout')
@section('content')  
<div class="container">                  
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class ="imgoutpatient">
            <img src="{{ url("/assets/images/survey/outpatient.png") }}" alt=""  class="img-responsive">
        </div>
        <div class ="skip">
            <a href="/survey/complete"><span>Skip</spam> <i class="ion-arrow-right-c"></i><a/>
        </div>
        <div class="comment-box">            
            <form class ="form-horizontal group-border-dashed" action="{{route('survey::comment') }}" method="post" accept-charset="utf-8">
                {!! csrf_field() !!}
                <div class="form-group text-center">
                    <h3>@if(isset($title))
                            @lang("survey.$title")
                        @else
                            ""
                        @endif
                    </h3>
                </div>
                <div class ="box-info">
                    <div class="form-group">
                        <textarea name="comment" type="text" class ="text-comment" placeholder= "@lang('survey.comment_placeholder')"></textarea>
                    </div>
                    <div class="form-group">            
                        <div class="switchery-demo">
                            <input type="checkbox" name ="contact" data-plugin="switchery" data-color="#4c5667" data-size="small" id="info">
                             <lable>&emsp;@lang('survey.check_box_contact')</lable>
                        </div>
                    </div>
                    <div class ="visiabled" style ="display:none;">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" name ="firstname" parsley-trigger="change" placeholder ="First Name" class ="form-control text-name">
                            </div>
                            <div class="col-sm-6">
                                <input type="text" name ="lastname" parsley-trigger="change" placeholder ="Last Name" class ="form-control text-name">
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <div class ="col-sm-12">
                            <input type="text" name ="phonenumber" placeholder ="Phone Number" class ="form-control text-info">
                            <p>@lang('survey.Or')</p>
                            <input type="text" parsley-trigger="change" name ="email" data-parsley-type="email" name="email" type="text" placeholder="Email" class ="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-right">
                        <button class="btn btn-primary waves-effect waves-light" type="submit">@lang('survey.SUBMIT')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
   </div>    
@stop
@section('page-script')  
$('#info').change(function(){
        if (this.checked) {
            $('.visiabled').fadeIn('slow');
            $('.text-name').attr('required', 'true');
        }
        else {
            $('.visiabled').fadeOut('slow');
            $('.text-name').removeAttr('required');
        }                   
    });
$('.text-info').keypress(function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
});
@append