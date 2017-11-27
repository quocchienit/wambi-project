@if(\Cache::get('function_amada') != 1)
    {{ $employee->firstname or '' }} {{ $employee->lastname or '' }} requested the shift on {{ $shift->shift_date }} at {{ $shift_times[$shift->shift_time]->value }}. To accept, visit your Wambi dashboard @if($link)<a href="{!! $link !!}">click here</a>@endif.
@else
    {{ $employee->firstname or '' }} {{ $employee->lastname or '' }} requested the shift on {{ $shift->shift_date }} at {{ $shift->shift_starttime.' to '.$shift->shift_endtime }}. To accept, visit your Wambi dashboard @if($link)<a href="{!! $link !!}">click here</a>@endif.
@endif