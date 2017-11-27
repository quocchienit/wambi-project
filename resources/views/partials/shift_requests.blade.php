        <div class="card-box">
            <h4 class="text-dark m-t-0">Shift Requests</h4>
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Job Title</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Unit</th>
                            <th>Pecks</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach ($shift_requests as $item)
                        <tr>
                            <td><img src="{{ url('')."/uploads/profiles/".$item->employee->clockid."/".$item->employee->image }}" class="thumb-md thumb-sm" alt=""></td>
                            <td>{{ $item->employee->firstname.' '.$item->employee->lastname}}</td>
                            <td>@if(\Cache::get('function_amada') == 1)
                                  {{ $item->job_name() }}
                                @else
                                    {{ $job_titles[$item->employee->job]->value}}
                                @endif
                                </td>
                            <td>{{ $item->shift_date}}</td>
                            @if(\Cache::get('function_amada') != 1)
                            <td>{{ $shift_time[$item->shift_time]->value }}</td>
                            @else
                                <td>{{ $item->shift_starttime.' to '.$item->shift_endtime }}</td>
                            @endif
                            <td>{{ $item->shift_unit() }}</td>
                            <td>{{ $shift_pecks[$item->shift->shift_pecks]->value }}</td>
                            <td>
                                <a href="" class="btn btn-xs btn-primary">Accept</a>
                                <a href="" class="btn btn-xs btn-danger">Reject</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
