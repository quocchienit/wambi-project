<div class="col-md-6 col-lg-{{ $column or 3 }}">
	<div class="widget-panel widget-style-2 bg-white">
		<i class="{{ $icon or '' }}"></i>
		<h2 class="m-0 text-dark counter font-600">{{ $value or 0 }}</h2>
		<div class="text-muted m-t-5">{{ $name or '' }}</div>
	</div>
</div>