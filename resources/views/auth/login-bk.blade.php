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
            <input name="clockid" class="form-control" type="text" data-parsley-type="digits" parsley-trigger="change" required  placeholder="EmployeeID">
        </div>
    </div>

    <div class="form-group" id="admin">
        <div class="col-xs-12">
            <input name="password" class="form-control" type="password" placeholder="Password">
        </div>
    </div>

    <div class ="form-group checkbox checkbox-circle">
        <div class="col-xs-12 ">                 
                <input id="chkTerm" type ="checkbox" name = "chkTerm">
                  <label for="chkTerm">                   
                     I accept the 
                  </label>
              <a href ="javascript:void(0);" id="btnTerm" data-animation="fadein" data-plugin="custommodal"
                         data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                         data-target="#term-condition">Terms and Conditions</a>    
                @extends('auth.term')          
        </div>
    </div>


    <div class="form-group text-center m-t-40">
        <div class="col-xs-12">
            <button id ="btnsubmit" class="btn btn-pink btn-block text-uppercase waves-effect waves-light" type="submit" onclick ="checklg()">Log In</button>
        </div>
    </div>

    <div class="form-group m-t-30 m-b-0">
        <div class="col-sm-12">
          <!-- Switch divs on click-->    
          <div id="employee1">
              <a class='plansSwitch' href='#admin'>Click here if you are a Super Admin/Admin</a>
          </div>
          <div  id="admin1">
              <a class='plansSwitch' href='#employee'>Click here if you are an Employee</a>
          </div>

          <!-- Switch divs on click-->
      </div>
  </div>
          <input type="hidden"  name="employee_status" id="employee_status" value="0">
</form> 

<a href ="javascript:void(0);" id="btnCheckLogin" data-animation="fadein" data-plugin="custommodal"
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
              <p>Oops something went wrong! Please check the box to Agree the Terms and Conditions in order to log in.</p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




Lost my info <a href="/auth/recovery">click here</a>
@stop
@section('script')
    $('form').parsley();
    <!-- Switch divs on click-->    
    var $plansHolders = $('#employee, #admin,#employee1, #admin1').hide();
    $('#employee').show();
    $('#employee1').show();
    // alert($('#employee_status').val());
    
    $('.plansSwitch').click(function() {
        var href = $(this).attr('href');
        $plansHolders.hide();
        $(href).show();
        $(href+'1').show();
        if($('#employee_status').val() ==0)
          $('#employee_status').val(1);
        else
          $('#employee_status').val(0);
    })

            // buton submit
            var btnsubmit = document.getElementById("btnsubmit");

            btnsubmit.onclick = function()
            {
                if(!document.getElementById("chkTerm").checked)
                {
                    document.getElementById("btnCheckLogin").click();
                    return false;
                }
            }
            
@append