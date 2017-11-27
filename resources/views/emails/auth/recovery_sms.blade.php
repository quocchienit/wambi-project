@foreach($users as $user)
    <p>User Type: {{$user->type()}}</p>
    <p>Employee ID #: {{$user->clockid}}</p>
    <p>Your new temporary password: {{$password}}</p>
    <br>
@endforeach