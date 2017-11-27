@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-8 col-md-10 col-lg-offset-2 col-md-offset-1">
        <div class="card-box">
            <h4 class="m-t-0 header-title">IMPORT DATA</h4>
            <form action="{{ route("admin::import::import") }}" method ="post" id="import" name = "import" enctype="multipart/form-data">
                {!! csrf_field() !!}       
				@if (session('message'))
				    <div class="alert alert-info" style = "width=100%;">
				        {{ session('message') }}
				    </div>
				@endif    
                @if (session('error'))
                    <div class="alert alert-danger" style = "width=100%;">
                        {{ session('error') }}
                    </div>
                @endif                     
                <div class="form-group m-b-0">                    
                    <label class="control-label">File excel</label>
                    <input type="file" class="filestyle" data-input="false" data-placeholder="Upload File" name="file" id = "file">
                </div>	
                <div class="form-group">
                    <label>Unit*</label>
                    <select id='type' name="type" parsley-trigger="change" required class="form-control select2"  data-placeholder="Select Type Import ...">
                        <option value="employee" selected>Employee</option>
                        <option value="patient">Patient</option>
                        <option value="ambassador">Ambassador</option>
                    </select>
                </div>
                <div class="form-group text-right m-b-0">
                    <a href="{{ route('admin::import::export') }}" id = 'download' class="btn btn-default waves-effect waves-light m-l-5">
                        Download Template
                    </a>
                    <button class="btn btn-primary waves-effect waves-light" type="submit">
                        Submit
                    </button>
                    <a href="" class="btn btn-default waves-effect waves-light m-l-5">
                        Cancel
                    </a>
                </div>

            </form>
        </div>
    </div>
</div>	
@stop
@section('page-script')
var link = "{{ route('admin::import::export') }}";
$('#type').on('change',function() {
    var type = $(this).val();    
    $("#download").attr("href", link + '?type=' + type);
})

@append