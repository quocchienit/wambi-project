@extends('admin.layout')
@section('content')

<div class="col-md-10 col-md-offset-1">
    <ul class="nav nav-tabs navtab-bg nav-justified">
    @if (@$award->type!='employee_award')
        <li class="{{ isset($award)?(($award->type=='unit_award')?"active":""):"active" }}">
            <a href="#unit-award" data-toggle="tab" aria-expanded="false">
                {{-- <span class="visible-xs"><i class="fa fa-home"></i></span> --}}
                <span>Unit Award</span>
            </a>
        </li>
    @endif
    @if (@$award->type!='unit_award')
        <li class="{{ (isset($award)&&$award->type=='employee_award')?"active":"" }}">
            <a href="#employee-award" data-toggle="tab" aria-expanded="true">
                {{-- <span class="visible-xs"><i class="fa fa-user"></i></span> --}}
                <span>Employee Award</span>
            </a>
        </li>
    @endif
    </ul>
    <div class="tab-content">
    @if (@$award->type!='employee_award')
        @include('admin.award._unit')
    @endif
    @if (@$award->type!='unit_award')
        @include('admin.award._employee')
    @endif
    </div>
</div>
@stop
