<div class="col-md-6 col-lg-{{ $column or 3 }}">
	<div class="widget-panel widget-style-2 bg-white">
		<div class="text-center employee-reward-box">
			<div>
				<span class="fa fa-gift fa-3x"></span>
			</div>
			<a href="{{route('employee::reward::index')}}" class="btn btn-info">REWARDS</a>
		</div>
		<h2 id="employee-pecks" class="m-0 text-dark counter font-600">{{ $value or 0 }}</h2>
		<div class="text-muted m-t-5">{{ $name or '' }}</div>
	</div>
</div>