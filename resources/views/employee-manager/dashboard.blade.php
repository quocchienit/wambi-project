@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-12">
        @include('admin.partials.employees')
    </div>
</div>
<input type="hidden" value="{{ isset($status_pass)?$status_pass:0 }}" id="status_pass">
@endsection