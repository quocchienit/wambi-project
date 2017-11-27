@if(\Cache::get('function_amada') != 1)
The shift you have requested  for {{ $shift->shift_date }} at {{ $shift_times[$shift->shift_time]->value }} has been filled by another employee. Thank you for your request.
	@else
The shift you have requested  for {{ $shift->shift_date }} at {{ $shift->shift_starttime.' to '.$shift->shift_endtime }} has been filled by another employee. Thank you for your request.
@endif