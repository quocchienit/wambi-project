@extends('auth.layout')
@section('content')
    @if (session('message'))
        <div class="alert alert-info">
            {{ session('message') }}
        </div>
    @endif
    <form class="form-horizontal m-t-20" method="post" action="{{ url('admin/login') }}">
        {!! csrf_field() !!}
        <div class="form-group">
            <div class="col-xs-12">
                <input name="clockid" class="form-control" type="text" required placeholder="EmployeeID">
            </div>
        </div>

        <div class="form-group">
            <div class="col-xs-12">
                <input required name="password" class="form-control" type="password" placeholder="Password *">

                <br>* Temporary Password is your Employee ID#
  
            </div>
        </div>

        <div class="form-group checkbox checkbox-circle">
            <div class="col-xs-12 ">
                <input id="chkTerm" type="checkbox" name="chkTerm">
                <label for="chkTerm">
                    I accept the
                </label>
                <a href="javascript:void(0);" id="btnTerm" data-animation="fadein" data-plugin="custommodal"
                   data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a"
                   data-target="#term-condition">Terms and Conditions</a>
                @extends('auth.term')
            </div>
        </div>

        <div class="form-group text-center m-t-40">
            <div class="col-xs-12">
                <button id="btnsubmit" class="btn btn-pink btn-block text-uppercase waves-effect waves-light"
                        type="submit" onclick="checklg()">Log In
                </button>
            </div>
        </div>
    </form>

    <a href="javascript:void(0);" id="btnCheckLogin" data-animation="fadein" data-plugin="custommodal"
       data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a"
       data-target="#chkTermCondition"></a>
    <!--  Modal content for the above example -->
    <div id="chkTermCondition" class="modal fade" role="dialog" aria-labelledby="myLargeModalLabel"
         aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Oops something went wrong</h4>
                </div>
                <div class="modal-body">
                    <p>Oops something went wrong! Please check the box to Agree the Terms and Conditions in order to log
                        in.</p>
                </div>
            </div>
        </div>
    </div>
    <br>
    Forgot your password? <a href="/auth/recovery">click here</a><br>
    Don’t have a password? <a href="/auth/recovery">click here</a>
@stop
@section('script')
    $('form').parsley();
    var btnsubmit = document.getElementById("btnsubmit");
    btnsubmit.onclick = function () {
        if (!document.getElementById("chkTerm").checked) {
            document.getElementById("btnCheckLogin").click();
            return false;
        }
    }
@append