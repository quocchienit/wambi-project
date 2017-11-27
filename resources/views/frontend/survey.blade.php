@extends('frontend.layout')
@section('content')   
<style>
        @media (max-width: 991px){
        .imgoutpatient.center-back{
            display: none;
        }
    }
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
    #patient-panel{
        display: block;
    }

    /*Demon Dragon 11/05/2017*/
    @media (max-width: 991px){
        .survey-answers li{
            width: 120px;
        }
        .survey-answers li img{
            width: 100px;
        }
    }

    @media (max-width: 768px) {
        .survey-answers li{
            width: 80px;
        }
        .survey-answers li img{
            width: 70px;
        }
    }

    @media (max-width: 480px) {
        .survey-answers li{
            width: 60px;
        }
        .survey-answers li img{
            width: 55px;
        }
    }
</style> 
<div class ="imgoutpatient top-left">
    <img src="{{ url("/assets/images/survey/outpatient.png") }}" alt="">
</div>
<div class="checkout-wrap">
    <ul class="checkout-bar">
    @if($questions->count()==0)  
        <li class="first" style ="width: 90%;">&nbsp;</li>
        @for($i = 1; $i < $questions->count() - 1 ; $i++)
        <li class="" style ="width: 90%;">&nbsp;</li>
        @endfor
        <li class="last" style ="width: 90%;">&nbsp;</li>
    @else
        <li class="first" style ="width: {{90/$questions->count()}}%;">&nbsp;</li>
        @for($i = 1; $i < $questions->count() - 1 ; $i++)
        <li class="" style ="width: {{90/$questions->count()}}%;">&nbsp;</li>
        @endfor
        <li class="last" style ="width: {{90/$questions->count()}}%;">&nbsp;</li>
    @endif
    
    </ul>
    <div class="clearfix"></div>
    <div class="survey-employee-info">
        <div class="survey-employee-photo text-center">
            <img class="img-circle" src="{{ $employee->photo() }}">
            <h3>{{ $employee->name() }}</h3>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="text-center" style = "position: relative;">            
    <div class ="imgoutpatient center-back" style = "z-index: 999; position: absolute; left: 0px;">
            <a href="javascript: void(0);" class ="prev">
                <img src="{{ url("/assets/images/survey/back.png") }}" alt="">
            </a>
    </div>
    <ul class="survey-question" style ="position: relative;">                
        @foreach ($questions as $key => $element)
            <li @if($key==0) class="active" @endif>
                @if(trans("questions.$element->question") == "questions.$element->question")
                    {{$element->question}}
                @else
                    {{trans("questions.$element->question") }}
                @endif
                </li>
        @endforeach
    </ul>
    <ul class="survey-answers">
        @foreach ($answers as $element)
            <li data-key="{{$element->key}}">
                <img src="{{ url("/assets/images/survey/$element->key.png") }}" alt="">
                <div class="display-name">
                    @if(trans("survey.$element->key") == "survey.$element->key")
                        {{$element->key}}
                    @else
                        {{trans("survey.$element->key") }}
                    @endif
                </div>
            </li>
        @endforeach
    </ul>
</div>
<div id="myModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content">
    <div class = "headinsurance">
        <h4>Please select your insurance provider</h4>
    </div>
    <div class = "form-groups selectinsurance">
        <h5>Insurance Payor</h5>
        <select class = "form-control" id = "insurance"  name="insurance" >
            <option value="">Select Insurance Payor...</option>                        
            <option value="0">Not Available</option>
                @foreach ($insurance as $element)
            <option value="{{ $element->key }}">{{ $element->value }}</option>
            @endforeach                        
        </select>
    </div>    
  </div>
</div>

@stop
@section('page-script')
var step = 1;
var isSend = {{ $isSend }};
var isCommit = 0;
var insurance_payor = {{ $enable_insurance_payor }};
var qids = '{{ $qids }}';
var modal = document.getElementById('myModal');
var answers = []; 
    // $('.survey-question li:nth-child('+step+')').addClass('active');
    var next = function(){
        $('.survey-question li.active').addClass('animated bounceOutLeft');
        $('.survey-answers').unbind('click');
        $(this).addClass("animated bounce");
        answers[step-1]=$(this).data('key');
        $(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $(this).removeClass();
            $('.survey-answers').on('click','li',next);
        });
        $('.checkout-bar li.active').removeClass('active').addClass('visited');
        step++;
        $('.checkout-bar li:nth-child('+(step-1)+')').addClass('active');
        $('.survey-question li.active').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
            $(this).removeClass();console.log($(this).text());
            $('.survey-question li:nth-child('+(step)+')').addClass('active animated bounceInRight');
        });
        if(step > {{$questions->count()}}){
            // Get the modal
            if(insurance_payor == 1){                
                // Get the <span> element that closes the modal
                modal.style.display = "block";
            }else{
            
                if(isCommit == 1) return;
                isCommit = 1;
                $('.survey-answers').unbind('click');
                console.log(answers);
                $.ajax({
                    url: '{{route("survey::save",["employee"=>$employee->id])}}',
                    type: 'post',
                    dataType: 'json',
                    data: {answers: answers,qids:qids},
                })
                .done(function() {
                    if(isSend == 1)
                        location.href = "/survey/comment";
                    else
                        location.href = "/survey/complete";
                })
                .fail(function() {
                    console.log("error");
                })
                .always(function() {
                });
                return false;
            }
        }
    }
    // $('.survey-question li:nth-child('+(step)+')').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){

    // })
    $('.survey-answers').on('click','li',next);

    $('.prev').click(function(){
        if(step > 1)
        {
            $('.survey-question li.active').addClass('animated bounceOutLeft');            
            $('.checkout-bar li.active').removeClass('active');
            step--;
            $('.checkout-bar li:nth-child('+(step-1)+')').addClass('active');
            $('.checkout-bar li:nth-child('+(step-1)+')').removeClass('visited');
            $('.survey-question li.active').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){                
                $(this).removeClass();console.log($(this).text());
                $('.survey-question li:nth-child('+(step)+')').addClass('active animated bounceInRight');
            });
        }
    });
    

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    $('#insurance').change(function(){
        $.ajax({
            url: '{{route("survey::save",["employee"=>$employee->id])}}',
            type: 'post',
            dataType: 'json',
            data: {answers: answers, insurance_id: $(this).val(),qids:qids},
        })
        .done(function() {
            if(isSend == 1)
                location.href = "/survey/comment";
            else
                location.href = "/survey/complete";
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
        });
        return false;

    });
@append