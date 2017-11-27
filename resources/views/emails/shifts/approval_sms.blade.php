@if(\Cache::get('function_amada') != 1)
<p>Your request has been accepted to take the following shift: </p>
<p></p>            
<p>Date: {{ $shift->shift_date or ''}}</p>
<p>Time:  	{{ $shift_times[$shift->shift_time]->value }} </p>
<p>Discipline: {{ $shift->discipline_name() }} </p>
<p>Job Title: {{ $job_titles[$shift->shift_job_title]->value }} </p>
<p>Unit: {{ $shift->shift_unit() }}   </p>
<p> </p>
<p>Congratulations! You will receive {{ $shift->shift_pecks_value() }} pecks for taking this shift!</p>
@else

<p>Your request has been accepted to take the following shift: </p>
<p></p>            
<p>Date: {{ $shift->shift_date or ''}}</p>
<p>Time: {{ $shift->shift_starttime.' to '.$shift->shift_endtime }} </p>
<p>Discipline: {{ $shift->discipline_name() }} </p>
<p>Job Title: {{ $shift->job_name() }} </p>
<p>Unit: {{ $shift->shift_unit() }}   </p>
<p> </p>
<p>Congratulations! You will receive {{ $shift->shift_pecks_value() }} pecks for taking this shift!</p>
@endif