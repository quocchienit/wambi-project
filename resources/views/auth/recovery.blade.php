@extends('auth.layout')
@section('content')
<h3 class="text-center"> Recover Password </h3>
        @if (session('message'))
            <div class="alert alert-info">
                {{ session('message') }}
            </div>
        @endif 
<form  method="post" action="{{ route('backend-recovery') }}">
  {!! csrf_field() !!}
  <div class="form-group">
    <input type="email" name="email" class="form-control" placeholder="Enter Email" required="">
  </div>
  <div>
    <div class="pull-right">
      <button type="submit" class="btn btn-pink w-sm waves-effect waves-light">
        Send email
      </button>
    </div>
    <div class="clearfix"></div>
  </div>
</form>
<div class="form-group">or</div>
<form  method="post" action="{{ route('backend-recovery') }}">
  {!! csrf_field() !!}  
  <div class="form-group">
    <input type="mobile" name="mobile" class="form-control" placeholder="Enter Phone Number" required="">
  </div>
  <div class="pull-right">
    <a href="login"  class="btn btn-pink w-sm waves-effect waves-light">
      Back
    </a>
    <button type="submit" class="btn btn-pink w-sm waves-effect waves-light">
      Send text message
    </button>
  </div>
  <div class="clearfix"></div>
</div>

</form> 
@stop
@section('script')
$('form').parsley();
@append