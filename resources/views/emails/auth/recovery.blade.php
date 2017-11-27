@foreach($users as $user)
    <p>User Type: {{$user->type()}}</p>
    <p>Employee ID #: {{$user->clockid}}</p>
    <p>Your new temporary password: {{$password}}</p>
    <br>
@endforeach
<p>HIPAA NOTE: This e-mail conforms to the rules and regulations of the HEALTH INSURANCE PORTABILITY ACCOUNTABILITY ACT ("HIPAA"). All client/patient information including name, address, diagnosis code or any personal identifiers must remain confidential, and may only be viewed and utilized by those legally privy. This message is for the designated recipient only and may contain privileged or confidential information. If you have received this communication in error, notify the sender at support@wambi.org or 786-671-2321, and immediately delete the communication and related attachments from your electronic device. Any other use of the email by you is prohibited.</p>
