<p>{{ $user->name() }} has requested to give the following Award:</p>
@if ($award->type=='unit_award')
	{{--<p>Unit: {{ $units[$award->owner]->value }}</p>--}}
	<p>Unit: {{ $unit?$unit->value:'' }}</p>
@endif
@if ($award->type=='employee_award')
	{{--Discipline: {{ $award->employee->disciplines() }}--}}
	<p>Employee Name:  {{ $award->employee->name() }}</p>
	<p>Job Title: {{ $award->job_title()}}</p>
	<p>Type of Award: {{ $award->type() }}</p>
@endif
<p>Time Period: {{ $time_period[$award->period]->value }}</p>
<p>Pecks: {{ $award->peck or '' }}</p>
<p>If you would like to accept this Award Request, click <a href="{!! $link or null !!}" title="">here</a> to login to your Wambi account, and click "Accept" in the Award Requests table.</p>
<p>HIPAA NOTE: This e-mail conforms to the rules and regulations of the HEALTH INSURANCE PORTABILITY ACCOUNTABILITY ACT ("HIPAA"). All client/patient information including name, address, diagnosis code or any personal identifiers must remain confidential, and may only be viewed and utilized by those legally privy. This message is for the designated recipient only and may contain privileged or confidential information. If you have received this communication in error, notify the sender at support@wambi.org or 786-671-2321, and immediately delete the communication and related attachments from your electronic device. Any other use of the email by you is prohibited.</p>