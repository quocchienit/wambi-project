@extends('employee.layout')
@section('content')
	<style>
		.span-bio{
			border: 1px solid #ddd;
			border-radius: 50%;
			width: 20px;
			height: 20px;
			display: inline-block;
			text-align: center;
			vertical-align: middle;
			background-color: #f2f2f2;
		}
		.attention_btn{
			border: 1px solid #888;
			border-radius: 50%;
			padding: 2px 10px;
			font-weight: bold;
			background-color: #f2f2f2;
			margin-left: 5px;
		}
		.tooltip-inner{
			color: #000000;
			background-color: #ffffff;
			border: 1px solid #888888;
			border-radius: 8px;
			text-align: left;
			padding: 12px;
			font-size: 13px;
		}
	</style>
	<div class="row">
		<div class="col-md-12 col-lg-offset-2 col-lg-8">
			<div class="card-box">
			    <h4 class="text-dark m-t-0">Settings</h4>
			    <p class="text-muted m-b-30 font-13"></p>
			    <form action="{{ route('employee::settings') }}" method="post" accept-charset="utf-8" enctype="multipart/form-data">
	                {!! csrf_field() !!}
					@if (count($errors) > 0)
						<div class="alert alert-danger">
							<ul>
								@foreach ($errors->all() as $error)
									<li>{{ $error }}</li>
								@endforeach
							</ul>
						</div>
					@endif
					<div class="form-group col-md-6 col-xs-12">
	                    <label class="control-label">Employee image</label>

	                    <input type="file" class="filestyle" data-input="false" data-placeholder="Select profile image" name="image" onchange="readURL(this);" >
                    	{{--<div style="color: red;margin-left: 145px;margin-top: -29px;">--}}
							{{--<p>*File size must be less than 1 MB</p>--}}
						{{--</div>--}}
						<button id = "resizeimg" type="button" class="btn btn-primary" data-target="#modal" data-toggle="modal" style = "display:none;"></button>
	                    <div id="result" class="thumb-xl">
	                        <img src="@if(isset($employee)) {{ $employee->photo() }} @endif" height="100" class="img-circle" id ="imgupload">
	                    </div>
	                    <!--
	                    <input type="file" class="filestyle" data-input="false" data-placeholder="Select profile image" name="image" onchange="readURL(this);">
		                -->

		                <input name="employeeimg" value="" style ="display:none;" id ="employeeimg">
	                </div>
					<div class="col-md-6 col-xs-12">
						<img class="ex-images" src="{{url('assets/images/users/ex-images.png')}}">
					</div>
					<div class="clearfix"></div>
	                {{-- description --}}
	                <div  class="form-group">
	                <p>In order to participate in the <b>review reward system</b>, be sure to upload a <i>photo</i> of yourself!</p>

					 <p>In order to be notified of <b>last minute shift availabilities</b></i>, please provide your <i>mobile phone number</i>.</p>

					 <p>In order to receive your <b>electronic gift card rewards</b></i>, please provide your <i>email address</i> .</p>

	                </div>
	                {{-- mobile --}}
	                <div class="form-group">
	                    <h5 class="m-t-30">Mobile*</h5>
	                    <input data-parsley-type="number" value="{{ $employee->mobile or '' }}" name="mobile" type="text" parsley-trigger="change" required placeholder="Mobile" class="form-control" >
	                </div>
	                	<!--
	                {{-- carrier --}}
	                <div class="form-group">
	                    <h5 class="m-t-30">Select Carrier*</h5>
	                    <select parsley-trigger="change" required name="carrier"  data-placeholder="Select Carrier" class="form-control select2">
	                        <option value="">Select Carrier</option>
	                        @if (isset($carriers))
	                        @foreach ($carriers as $element)
	                            <option value="{{ $element->address }}" {{ (isset($employee)&&($element->address==$employee->carrier))?"selected":"" }}>{{ $element->name }}</option>
	                        @endforeach
	                        @endif
	                    </select>
	                </div>
	                -->
	                {{-- email --}}
	                <div class="form-group">
	                    <h5 class="m-t-30">Email*</h5>
	                    <input parsley-trigger="change" value="{{ $employee->email or '' }}" data-parsley-type="email" required name="email" type="text" placeholder="Email" class="form-control" >
	                </div>

					<div class="form-group">
						<h5 class="m-t-30">Bio info <span class="span-bio" data-toggle="tooltip" data-placement="top" data-original-title="Bio information will be visible to patients and their families">?</span></h5>
						<input value="{{ $employee->bio or '' }}" name="bio" type="text" placeholder="Sample text: 15 years as a Registered Nurse. Enjoy reading Harry Potter" class="form-control" style="font-style: italic;">
					</div>

	                <div class="form-group text-right m-b-0">
	                    <button class="btn btn-primary waves-effect waves-light" type="submit">
	                        Submit
	                    </button>
	                    <a href="{{ URL::previous() }}" class="btn btn-default waves-effect waves-light m-l-5">
	                        Cancel
	                    </a>
	                </div>
			    </form>	
			</div>			
		</div>
	</div>
	@include('cropimage.crop')                    
@stop