@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
        <div class="card-box">
            <form action="{{ isset($qa)?route("admin::news::edit",['qa'=>$qa->qaid]):'' }}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                {!! csrf_field() !!}
                <h4 class="header-title">QUESTION and ANSWER</h4>
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
                <div class="form-group">
                    <h5 class="m-t-30">Question ID #*</h5>
                    <input value="{{ $faqs->qaid or '' }}" parsley-trigger="change" required name="qaid" placeholder="Enter Question ID #" class="form-control" >
                </div>                
                <div class="form-group">
                    <h5 class="m-t-30">User Type*</h5>                    
                        <select id='utype' onchange ="changeText();" {{ (isset($faqs)&&$faqs->utype!=0)?"data-parsley-maxcheck=7":"" }} name="utype[]" parsley-trigger="change" required class="form-control select2 select2-multiple" multiple data-placeholder="Select User Type ...">
                        @foreach ($profiles as $element)
                        <option value="{{ $element->id }}" {{ (isset($faqs)&&in_array($element->id,$faqs->utype))?"selected":"" }}>{{ $element->name }}</option>
                        @endforeach
                        <option value="7" {{ (isset($faqs)&&in_array(7,$faqs->utype))?"selected":"" }}>Font-End</option>
                    </select>
                </div>
                <div class="form-group">
                    <h5 class="m-t-30">Question</h5>
                    <!--<textarea type="text-area" name="employeeid" required value="{{ $employee->employeeid or '' }}" placeholder="Question" class="form-control" parsley-trigger='change'></textarea>-->
                    <textarea name="Qcontent" class="form-control summernote" parsley-trigger="change" required rows="4" placeholder="Enter question content.">{!! $faqs->question or '' !!}</textarea>    
                    <div id ="Qes" style ="display:none; margin-top:5px;">
                        <h5 class="m-t-30">Question Espanol</h5>
                        <textarea  name="Qescontent" class="form-control summernote" parsley-trigger="change"  rows="4" placeholder="Enter question content translate.">{!! $faqs->qes or '' !!}</textarea>    
                    </div>
                    <div id="TransQ" class="text-right m-b-0" style ="margin-top:5px; display:none;" >
                        <a class="btn btn-info waves-effect waves-light" onclick ="showQTrans();">
                            Translate
                        </a>
                    </div>                    
                </div>                
                <div class="form-group">
                    <h5 class="m-t-30">Answer</h5>
                    <textarea name="Acontent" class="form-control summernote" parsley-trigger="change"  rows="4" placeholder="Enter answer content.">{!! $faqs->anwser or '' !!}</textarea>    
                    <div  id="Aes" style ="display:none; margin-top:5px;" >
                        <h5 class="m-t-30">Answer Espanol</h5>
                        <textarea name="Aescontent" class="form-control summernote" parsley-trigger="change"  rows="4" placeholder="Enter answer content translate." >{!! $faqs->aes or '' !!}</textarea>    </div>
                        <div id="TransA" class="text-right m-b-0" style ="margin-top:5px; display:none;">
                            <a class="btn btn-info waves-effect waves-light" onclick ="showATrans();">
                                Translate
                            </a>
                        </div>
                </div>
                <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{route('admin::faqs::view')}}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
@stop
@section('page-script-selected')
            function changeText()
            {                
                var foo = [];
                $("#utype :selected").map(function(i, el) {
                    foo[i] =$(el).val();
                });

                if(foo.indexOf("7")> -1)
                {
                    document.getElementById("TransQ").style.display ="block";
                   document.getElementById("TransA").style.display ="block";                                  
                }                          
                else
                {
                  document.getElementById("TransQ").style.display ="none";
                   document.getElementById("TransA").style.display ="none";
                }
            }

            function showQTrans()
            {
              if(document.getElementById("Qes").style.display == "none")
              {       
               document.getElementById("Qes").style.display ="block";        
              }else
              {
                document.getElementById("Qes").style.display ="none";
              }
            }

            function showATrans()
            {
              if(document.getElementById("Aes").style.display == "none")
              {       
               document.getElementById("Aes").style.display ="block";        
              }else
              {
                document.getElementById("Aes").style.display ="none";
              }
            }
            window.onload = changeText();
@append
