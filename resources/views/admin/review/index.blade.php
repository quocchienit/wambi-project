@extends('admin.review.layout')
@section('content')
     <div class="container" >
        <div class="content_div">
    <form class="form-horizontal m-t-20" action="/admin/review/selectunit" id="select-form">
        {!! csrf_field() !!}

        <div class ="col-xs-12">
            <div class="form-group  text-center ">
                <div class="col-xs-12">
                    <img src="/assets/images/survey/outpatient.png" alt="image" class="img-responsive ion-load-c">
                </div>
            </div>
            <div class="form-group " id = "error-code" hidden></div>
            {{-- carrier --}}
            <div class="form-group center">

                <select  required name="unit"  data-placeholder="Select your location" class="form-control" style="width: 200px; display: block;margin: auto">
                    <!--
                        <option value="">Select your location</option>
                    -->
	 				@foreach ($unitsadmin as $element)
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
    			  </div>
    </div>
@stop
