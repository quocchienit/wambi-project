@foreach ($employees as $element)
<div class="col-lg-2 col-md-3 col-sm-4 col-xs-4 mix {{ $element->disciplines_id()}}">
	<div class="mix-inner" data-bio="{{ $element->bio }}" data-id={{ $element->id }} data-name='{{ $element->name() }}' data-image='{{ url($element->photo()) }}' data-job-title='{{ $element->jobtitle() }}'>
		<img class="img-responsive img-circle thumb-lg" src="{{ $element->photo() }}" alt="">
		<div class="mix-details">
			<h4>{{ $element->name() }}</h4>
		</div>
	</div>
</div>
@endforeach
