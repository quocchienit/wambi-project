@extends('admin.layout')
@section('content')
<div class="row">
    <div class="col-lg-12">
        @include('partials.available_shifts')
    </div>          
</div>
<div class="row">
    <div class="col-lg-12">
        @include('admin.partials.shift_requests')
    </div>
</div>
@stop