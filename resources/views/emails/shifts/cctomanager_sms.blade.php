@if(\Cache::get('function_amada') != 1)
You have accepted the shift for {{ $job_titles[$shift->shift_job_title]->value }}, {{ $user->firstname or '' }} {{ $user->lastname or '' }}, on {{ $shift->shift_date }} at {{ $shift_times[$shift->shift_time]->value }}.
@else
You have accepted the shift for {{ $shift->job_name() }}, {{ $user->firstname or '' }} {{ $user->lastname or '' }}, on {{ $shift->shift_date }}  at {{ $shift->shift_starttime.' to '.$shift->shift_endtime }}. 
@endif