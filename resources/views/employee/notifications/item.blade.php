@if (isset($notifications))
    @foreach ($notifications as $element)
        @include('employee.notifications.element', ['content' => @json_decode($element->pivot->content)])
    @endforeach                                
@endif

@if (Auth::user()->type() =='super-admin' && isset($notifications_photo) && $notifications_photo > 0)                
	@include('employee.notifications.approved_photo', ['notifications_photo' => $notifications_photo])
@endif