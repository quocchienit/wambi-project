<p>{{ $comments->cmt_description }}</p>
<br>
<p><b>Employee information:</b></p>
<p>Name: {{ $employee_cmt->name() }}</p>
<p>Unit: {{ $employee_cmt->unitname() }}</p>
<p>Discipline: {{ $employee_cmt->disciplines() }}</p>
<p>Job title: {{ $employee_cmt->jobtitle() }}</p>
<br>
@if($comments->first_name || $comments->last_name || $comments->number_phone || $comments->email)
<p><b>Follow up requested by:</b></p>
@endif
@if($comments->first_name || $comments->last_name)
<p>Name: {{ $comments->first_name }} {{ $comments->last_name }}</p>
@endif
@if($comments->number_phone)
<p>Number Phone: {{ $comments->number_phone }}</p>
@endif
@if($comments->email)
<p>Email: {{ $comments->email }}</p>
@endif
<p>HIPAA NOTE: This e-mail conforms to the rules and regulations of the HEALTH INSURANCE PORTABILITY ACCOUNTABILITY ACT ("HIPAA"). All client/patient information including name, address, diagnosis code or any personal identifiers must remain confidential, and may only be viewed and utilized by those legally privy. This message is for the designated recipient only and may contain privileged or confidential information. If you have received this communication in error, notify the sender at support@wambi.org or 786-671-2321, and immediately delete the communication and related attachments from your electronic device. Any other use of the email by you is prohibited.</p>