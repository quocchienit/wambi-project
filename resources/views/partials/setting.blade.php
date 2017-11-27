@extends('admin.layout')
@section('content')
<div class ='row'>
	<div class="col-lg-6 col-md-8 col-lg-offset-3 col-md-offset-1">
		<div class="card-box">
			<form class="form-horizontal" role="form" data-parsley-validate="" novalidate="" method ="post">
				{!! csrf_field() !!}
				<div class="form-group">
					<label for="url" class="col-sm-4 control-label">URL*</label>
					<div class="col-sm-7">
						<input value="{{$data?$data->url:''}}" id="url" name="url" type="text" placeholder="URL" required="" class="form-control parsley-success">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
						<a href="/admin" class="btn btn-default waves-effect waves-light m-l-5">
	                        Cancel
	                    </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
@append