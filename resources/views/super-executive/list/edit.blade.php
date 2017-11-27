@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-8 col-md-10 col-lg-offset-2 col-md-offset-1">
        <div class="card-box">

            <h4 class="m-t-0 header-title">Create @if($type == 'unit') Unit @else Facility @endif</h4>
            <form action="{{ isset($data)?route("admin::list::edit",['type'=>$type,'value'=>$data->key]):route("admin::list::edit",['type'=>$type]) }}" method ="post" enctype="multipart/form-data">
                {!! csrf_field() !!}       
                @if (session('message'))
                    <div class="alert alert-info">
                        {{ session('message') }}
                    </div>
                @endif                
                <div class="form-group">
                    <label>Name*</label>
                    <input value="{{ $data->value or '' }}" parsley-trigger="change" required name="name" placeholder="Enter Name" class="form-control" >
                </div>
                @if($type == 'unit')
                <div class="form-group">
                    <label>Facility*</label>
                    <select name='fac' parsley-trigger="change" required class="form-control select2" data-placeholder="Select Facility ...">                        
                        <option value=""></option>
                        @foreach ($fac as $element)
                        <option value="{{ $element->key }}" {{ (isset($data)&&($element->key==$data->refkey))?"selected":"" }}>{{ $element->value }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input value="{{ isset($data)?$data->address:'' }}" name="address" placeholder="Enter Address" class="form-control" >
                </div>
                @endif
               <div class="form-group text-right m-b-0">
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="{{ route('admin::list::index') }}" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>	
@stop