@if(\Cache::get('function_amada') != 1)
	<p>Available shift details: </p>
	<p></p>
	<p>Date: {{ $shift->shift_date or ''}}	</p>
	<p>Time: {{ $shift_times[$shift->shift_time]->value }}   </p>
	{{--<p>Discipline: {{ $shift->discipline_name() }} </p>--}}
	{{--<p>Job Title: {{ $job_titles[$shift->shift_job_title]->value }}   </p>--}}
@else
	<p>Date: {{ $shift->shift_date or ''}}	</p>
	<p>Time:{{ date('h:i A',strtotime($shift->shift_starttime)) .' to '.date('h:i A',strtotime($shift->shift_endtime))}}</p>
	<p>City: {{ $shift->shift_city }} </p>
	{{--<p>Discipline: {{ $shift->discipline_name() }} </p>--}}
	{{--<p>Job Title: {{ $shift->job_name() }} </p>--}}
@endif

{{--<p>Unit: {{  $shift->shift_unit() }}   </p>--}}
<p>Pecks: {{ $shift->shift_pecks_value() }}</p>
<p>Request shift on your dashboard <a href="{{ url('admin') }}">{{ url('admin') }}</a>.</p>