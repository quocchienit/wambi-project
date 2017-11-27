@if($award->type == 'unit_award')
    <p>{{ $user->name() }} has requested to give a Unit Award. </p>
    <p>To accept, sign onto your Wambi dashboard {{ $link }}. </p>
@else
    <p>{{ $user->name() }} has requested to give an employee an Award. </p>
    <p>To accept, sign onto your Wambi dashboard {{ $link }}. </p>
@endif