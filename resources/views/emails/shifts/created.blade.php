<p>Earn Pecks by picking up this shift!</p>
<p>Available shift details: </p>
<p></p>
<p>Date: {{ $shift->shift_date or ''}}	</p>
@if(\Cache::get('function_amada') != 1)
<p>Time: {{ $shift_times[$shift->shift_time]->value }}   </p>
{{--<p>Discipline: {{ $shift->discipline_name() }} </p>--}}
{{--<p>Job Title: {{ $job_titles[$shift->shift_job_title]->value }}   </p>--}}
@else
<p>Time:{{ date('h:i A',strtotime($shift->shift_starttime)) .' to '.date('h:i A',strtotime($shift->shift_endtime))}}</p>
{{--<p>Discipline: {{ $shift->discipline_name() }} </p>--}}
<p>City: {{ $shift->shift_city }} </p>
{{--<p>Job Title: {{ $shift->job_name() }} </p>--}}
@endif

{{--<p>Unit: {{  $shift->shift_unit() }}   </p>--}}
<p>Pecks: {{ $shift->shift_pecks_value() }}</p>
<p>Notes: {{ $shift->shift_notes }} </p>
<p>Request shift on your dashboard <a href="{{ url('admin') }}">{{ url('admin') }}</a>.</p>
<p>Thank you!</p>
<p>HIPAA NOTE: This e-mail conforms to the rules and regulations of the HEALTH INSURANCE PORTABILITY ACCOUNTABILITY ACT ("HIPAA"). All client/patient information including name, address, diagnosis code or any personal identifiers must remain confidential, and may only be viewed and utilized by those legally privy. This message is for the designated recipient only and may contain privileged or confidential information. If you have received this communication in error, notify the sender at support@wambi.org or 786-671-2321, and immediately delete the communication and related attachments from your electronic device. Any other use of the email by you is prohibited.</p>