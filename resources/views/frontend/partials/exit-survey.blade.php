@if(is_array($questions))
<table class="table table-bordered table-hover exit-survey">
  <thead>
    <tr>
    <th class="header">@lang("exit_questions.$header")</th>
      <th class="answers">@lang('POOR')</th>
      <th class="answers">@lang('FAIR')</th>
      <th class="answers">@lang('OK')</th>
      <th class="answers">@lang('GOOD')</th>
      <th class="answers">@lang('GREAT')</th>
    </tr>
  </thead>
  <tbody>
    @if(!empty($questions))
    {{--*/ $j = $value /*--}}
    @foreach ($questions as $key => $question)
    <tr>
      <td class="questions">
      @if(trans("exit_questions.$question") == "exit_questions.$question")
        {{$question}}
      @else
        {{trans("exit_questions.$question") }}
      @endif
      </td>
      @for($i=4;$i>=0;$i--)
      <td class="selections">
        <div class="checkbox checkbox-success checkbox-circle">
          <input type="checkbox" name="{{ 'q'."$j"}}" value="{{ 5-$i }}">
          <label></label>
        </div>
      </td>
      @endfor
    </tr>
    {{--*/ $j = $j + 1 /*--}}
    @endforeach

    @endif
  </tbody>
</table>
@endif