<div class="card-box">
    <h4 class="text-dark m-t-0">Available Shifts</h4>
    <p class="text-muted m-b-30 font-13"></p>

    <div class="table-responsive">
        <table class="table table-hover table-striped data-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Job Title</th>
                    <th>Unit</th>
                    <th>Pecks</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($available_shifts as $item)
                <tr>
                    <td>{{ $item->shift_date }}</td>
                    <td>{{ $shift_times[$item->shift_time]->value }}</td>
                    <td>
                        @if(\Cache::get('function_amada') == 1)
                              {{ $item->job_name() }}
                        @else
                            {{ $job_titles[$item->shift_job_title]->value }}
                        @endif
                        </td>
                    <td>{{ $units[$item->shift_unit]->value }}</td>
                    <td>{{ $pecks[$item->shift_pecks]->display_name }}</td>
                    <td>
                    @if ($item->employee_id == null)
                        <form class="ajax-request" action="{{ route('employee::shift::request',['shift_request'=>$item->id,'employee_id'=>Auth::user()->id]) }}">
                            {!! csrf_field() !!}            
                            <button  type="submit" class="btn btn-xs btn-primary">Request</button>
                        </form>
                    @else
                        @if ($item->status=='Accepted')
                            @if (Auth::user()->id==$item->employee_id)
                                <button type="button" disabled class="btn btn-xs btn-success">Accepted</button>
                            @else
                                <button type="button" disabled class="btn btn-xs btn-danger">Taken</button>
                            @endif
                        @else
                            <button class="btn btn-xs disabled btn-{{ Config::get('css.'.$item->status) }}">
                                {{ $item->status }}                                    
                            </button>
                        @endif
                    @endif
                    </td>

                </tr>
                @empty
                {{-- empty expr --}}
                @endforelse
            </tbody>
        </table>
    </div>
</div>
