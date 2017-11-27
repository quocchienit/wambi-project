@extends('admin.layout')
@section('content')
<style>
	#passwordStrength
	{
		height:10px;
		display:block;
		float:left;
	}

	.strength0
	{
		width:100%;
		background:#cccccc;
	}

	.strength1
	{
		width:33%;
		background:#ff5f5f;
	}

	.strength2
	{
		width:67%;
		background:#f1f442;
	}

	.strength3
	{
		background:#56e500;
		width:100%;
	}
	#content-dev{
		padding: 5px 10px;
	}
	.bg-warning{
		background: #f5f791!important;
	}
	.bg-success{
		background: #dff0d8!important;
	}
	.bg-danger{
		background: #f2dede!important;
	}
	.bg-primary{
		background: #dadbc7!important;
	}
</style>
<div class ='row'>
	<div class="col-lg-6 col-md-8 col-lg-offset-3 col-md-offset-1">
		<div class="card-box">
			<h4 class="m-t-0 header-title"><b>Change Password Log in</b></h4>
			<form class="form-horizontal" role="form" data-parsley-validate="" novalidate="" method ="post" action = "changePassword">
				{!! csrf_field() !!}
				<div class="form-group">
					<label for="password" class="col-sm-4 control-label">Password*</label>
					<div class="col-sm-7">
						<input id="password" name="password" type="password" placeholder="Password" required class="form-control parsley-success password-field-all" data-parsley-id="19" minlength="8" onkeyup="passwordStrength(this.value)">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-7 col-sm-offset-4">
						<div id="passwordStrength" class="strength0"></div><br>
						<div id="content-dev">
							<label id="passwordDescription">Password strength</label>
							<div id="">Passwords must be alpha-numeric (have letters and numbers) and be at least 8 characters in length</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="hori-pass2" class="col-sm-4 control-label">Confirm Password *</label>
					<div class="col-sm-7">
						<input data-parsley-equalto="#password" type="password" required="" placeholder="Password" class="form-control" id="hori-pass2" data-parsley-id="21">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-primary waves-effect waves-light" onclick="checkchange(event)">Change</button>
						@if(\Auth::user() && \Auth::user()->type() == 'employee')
							<a href="/employee" class="btn btn-default waves-effect waves-light m-l-5">Cancel</a>
						@else
							<a href="/admin" class="btn btn-default waves-effect waves-light m-l-5">Cancel</a>
						@endif
					</div>
				</div>
				<input type="hidden" id="status_check">
			</form>
		</div>
	</div>
</div>
<script>
	function passwordStrength(password){
		var desc = new Array();
    	desc[0] = "Very Weak";
		desc[1] = "too weak";
		desc[2] = "medium";
		desc[3] = "strong";

		var info = new Array();
        info[0] = "bg-primary";
		info[1] = "bg-danger";
        info[2] = "bg-warning";
        info[3] = "bg-success";

		var score  = '';

		if (password.match(/[a-zA-Z]/) && password.match(/[0-9]/) && password.length == 8){
		    if(password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/)){
                score = 3;
			}else{
                score = 2;
			}
		} else if (password.match(/[a-zA-Z]/) && password.match(/[0-9]/) && password.length > 8){
		    score = 3;
		} else {
		    score = 1
		}

		$("#passwordDescription").html('Password strength: '+desc[score]);
		if($("#passwordStrength").hasClass("strength1")){
            $("#passwordStrength").removeClass("strength1");
		}
        if($("#passwordStrength").hasClass("strength2")){
            $("#passwordStrength").removeClass("strength2");
        }
        if($("#passwordStrength").hasClass("strength3")){
            $("#passwordStrength").removeClass("strength3");
        }
		$("#passwordStrength").addClass("strength" + score);

        if($("#content-dev").hasClass(info[0])){
            $("#content-dev").removeClass(info[0])
		}
        if($("#content-dev").hasClass(info[1])){
            $("#content-dev").removeClass(info[1])
        }
        if($("#content-dev").hasClass(info[2])){
            $("#content-dev").removeClass(info[2])
        }
        if($("#content-dev").hasClass(info[3])){
            $("#content-dev").removeClass(info[3])
        }
		$("#content-dev").addClass(info[score]);
		$("#status_check").val(score);
	}

	function checkchange(event){
		var score = $("#status_check").val();
		if(!score || score < 2){
			event.preventDefault();
			swal("Error!", "Passwords must be alpha-numeric (have letters and numbers) and be at least 8 characters in length", "error");
		}
	}
</script>
@append
