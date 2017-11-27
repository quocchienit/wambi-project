<?php
$utype = \DB::select("SELECT name  FROM employee_type");
?>
<style>
    .content{
        margin-left: 200px;
        margin-right: 200px;
        border: 1px solid #ddd;
        padding: 20px;
    }
    .performance-report-md,
    .individual-report-md{
        z-index: 20000;
    }
    .dt-button:hover{
        cursor: pointer;
    }
</style>
<div class="card-box">
    @if (!isset($hide_add_button))
    <a href="{{ route('admin::employee::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Add Employee</a>
    @endif
    <h4 class="text-dark m-t-0">Employees</h4>
    <p class="text-muted m-b-30 font-13">
    </p>
    {{--<table class="table table-striped table-hover table-responsive" id="employees-table">--}}
    <form type="get" id="filter-form">
        <table class="table table-striped table-hover table-responsive table-condensed table-filter" id="data-table-export">
            <thead>
                <tr>
                    <td style="display: none">Order By</td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Wambi Rating</a>
                            <div class="dropdown-menu dropdown-table">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="all" <?php if(isset($request_data['rating']) && $request_data['rating'][0] == 'all') echo 'checked'; ?>>Select All</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="0-50" <?php if(isset($request_data['rating']) && in_array('0-50',$request_data['rating'])) echo 'checked'; ?>>0%-50%</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="51-60" <?php if(isset($request_data['rating']) && in_array('51-60',$request_data['rating'])) echo 'checked'; ?>>51%-60%</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="61-70" <?php if(isset($request_data['rating']) && in_array('61-70',$request_data['rating'])) echo 'checked'; ?>>61%-70%</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="71-80" <?php if(isset($request_data['rating']) && in_array('71-80',$request_data['rating'])) echo 'checked'; ?>>71%-80%</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="81-90" <?php if(isset($request_data['rating']) && in_array('81-90',$request_data['rating'])) echo 'checked'; ?>>81%-90%</li>
                                    <li class="list-group-item"><input type="checkbox" name="rating[]" value="91-100" <?php if(isset($request_data['rating']) && in_array('91-100',$request_data['rating'])) echo 'checked'; ?>>91%-100%</li>
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Name
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 250px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="name[]" value="all" <?php if(isset($request_data['name']) && $request_data['name'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($employees as $element)
                                        <li class="list-group-item"><input type="checkbox" name="name[]" value="{{ $element->id }}" <?php if(isset($request_data['name']) && in_array($element->id,$request_data['name'])) echo 'checked'; ?>><img src="{{ url($element->photo()) }}" class="img-circle" alt="">{{ $element->name() }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    @if (Auth::user()->type() =='super-executive')
                        <td>
                            <div class="dropdown">
                                <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Facility
                                </a>
                                <div class="dropdown-menu dropdown-table">
                                    <ul class="list-group">
                                        <li class="list-group-item"><input type="checkbox" name="facility[]" value="all" <?php if(isset($request_data['facility']) && $request_data['facility'][0]=='all') echo 'checked'; ?>>Select All</li>
                                        @foreach($facility as $element)
                                            <li class="list-group-item"><input type="checkbox" name="facility[]" value="{{ $element->key }}" <?php if(isset($request_data['facility']) && in_array($element->key,$request_data['facility'])) echo 'checked'; ?>>{{ $element->value }}</li>
                                        @endforeach
                                    </ul>
                                    <a class="btn btn-default button-submit">Submit</a>
                                </div>
                            </div>
                        </td>
                    @endif
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Unit
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 200px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="unit[]" value="all" <?php if(isset($request_data['unit']) && $request_data['unit'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($units as $unit)
                                        <li class="list-group-item"><input type="checkbox" name="unit[]" value="{{ $unit->key }}" <?php if(isset($request_data['unit']) && in_array($unit->key,$request_data['unit'])) echo 'checked'; ?>>{{ $unit->value }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Discipline
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 200px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="discipline[]" value="all" <?php if(isset($request_data['discipline']) && $request_data['discipline'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($disciplines as $discipline)
                                        <li class="list-group-item"><input type="checkbox" name="discipline[]" value="{{ $discipline->key }}" <?php if(isset($request_data['discipline']) && in_array($discipline->key,$request_data['discipline'])) echo 'checked'; ?>>{{ $discipline->value }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Job Title
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 200px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="job_title[]" value="all" <?php if(isset($request_data['job_title']) && $request_data['job_title'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($job_titles as $job_title)
                                        <li class="list-group-item"><input type="checkbox" name="job_title[]" value="{{ $job_title->key }}" <?php if(isset($request_data['job_title']) && in_array($job_title->key,$request_data['job_title'])) echo 'checked'; ?>>{{ $job_title->value }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Shift
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 200px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="shift[]" value="all" <?php if(isset($request_data['shift']) && $request_data['shift'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($shifts as $shift)
                                        <li class="list-group-item"><input type="checkbox" name="shift[]" value="{{ $shift->key }}" <?php if(isset($request_data['shift']) && in_array($shift->key,$request_data['shift'])) echo 'checked'; ?>>{{ $shift->value }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                User Type
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 200px;">
                                <ul class="list-group">
                                    <li class="list-group-item"><input type="checkbox" name="employees_type[]" value="all" <?php if(isset($request_data['employees_type']) && $request_data['employees_type'][0]=='all') echo 'checked'; ?>>Select All</li>
                                    @foreach($employees_types as $employees_type)
                                        <li class="list-group-item"><input type="checkbox" name="employees_type[]" value="{{ $employees_type->id }}" <?php if(isset($request_data['employees_type']) && in_array($employees_type->id,$request_data['employees_type'])) echo 'checked'; ?>>{{ $employees_type->name }}</li>
                                    @endforeach
                                </ul>
                                <a class="btn btn-default button-submit">Submit</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Employee ID
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Pecks
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 180px;">
                                <div class="btn-group" role="group" aria-label="">
                                    <input type="hidden" name="pecks" id="input_pecks">
                                    <input readonly class="btn btn-white button-pecks" style="width: 60px;" value="Min">
                                    <input readonly class="btn btn-white button-pecks" style="width: 60px;" value="Max">
                                    <input readonly class="btn btn-default button-pecks" style="width: 60px;" value="Go">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Total # of Reviews
                            </a>
                            <div class="dropdown-menu dropdown-table" style="min-width: 180px;">
                                <div class="btn-group" role="group" aria-label="">
                                    <input name="total" class="btn btn-white" style="width: 60px;" value="Min">
                                    <input name="total" class="btn btn-white" style="width: 60px;" value="Max">
                                    <input name="total" class="btn btn-default" style="width: 60px;" value="Go">
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Actions
                            </a>
                        </div>
                    </td>
                </tr>
            </thead>
            <tbody>
                <?php
                if(isset($employees_data)) $employees = $employees_data;
                else  \Session::put('employees_data', $employees);
                ?>
                @foreach($employees as $item)
                <tr>
                    <td  style="display: none">{{$item->rating_view($item->units)}}</td>
                    <td>
                        <a href="{{ route('admin::employee::view',['employee'=>$item->id]) }}" title="{{ $item->rating_view($item->units) }}">
                            <div class="inline">
                                <div class="chart easy-pie-chart-with-image" data-percent="{{ $item->rating_view($item->units) }}">
                                    <div class="thumb-xl">
                                        <img src="{{ url($item->photo()) }}" class="img-circle" alt="">
                                        <div class ="text-center">
                                            {{ $item->rating_view($item->units) }}%
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </td>
                    <td data-order= ="{{$item->name()}}">
                        <a href="{{ route('admin::employee::view',['employee'=>$item->id]) }}" title="{{$item->name()}}">
                            {{$item->name()}}
                        </a>
                    </td>
                    @if (Auth::user()->type() =='super-executive')
                        <td>
                            {{$item->facility_name()}}
                        </td>
                    @endif
                     <td>{{$item->unitname()}}</td>
                    <td>{{ $item->disciplines() }}</td>
                    <td>
                        @if(\Cache::get('function_amada') == 1)
                            {{ $item->job_name() }}
                        @elseif(array_has($job_titles,$item->job))
                            {{$job_titles[$item->job]->value}}
                        @endif
                    </td>
                    <td>
                        {{$item->shift_times()}}
                    </td>
                    <td>@if(array_has($utype,$item->etid-1)) {{$utype[$item->etid - 1]->name}} @endif</td>
                    <td>{{$item->clockid}}</td>
                    <td>{{$item->pecks}}</td>
                    <td> {{ $item->totalpeck() }} </td>
                    <td>
                        <form class="ajax-delete" action="{{route('admin::employee::delete',['employee'=>$item->id])}}">
                            {!! csrf_field() !!}
                            <a href="{{ route('admin::employee::edit',['employee'=>$item->id]) }}" title='Edit' class='btn btn-primary btn-xs'><i class='icon-pencil'></i></a>
                            <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                        </form>
                    </td>

                </tr>
                @endforeach
            </tbody>
        </table>
    </form>
</div>
<input type="hidden" id="txt-employees" value="{{ isset($request_data)?json_encode($request_data):'' }}">
<div class="modal fade performance-report-md" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <img src="{{ url('assets/images/preloader.png') }}" style="height: 130px;display: block;margin: 0 auto;">
            <h1 class="text-center">Performance Report</h1>

            <div class="content">
                <h4 style="text-decoration: underline;text-align: center;"><a href="{{ url('admin/employee/export-xls') }}">Report Details</a></h4>
                <p>Discipline(s):
                    @if(isset($request_data['discipline']))
                        @foreach($disciplines as $item)
                            @if(isset($request_data['discipline']) && in_array($item->key,$request_data['discipline'])) {{ $item->value }} @endif
                        @endforeach
                    @else
                        all
                    @endif
                </p>
                <p>Job Title(s):
                    @if(isset($request_data['job_title']))
                        @foreach($job_titles as $item)
                            @if(isset($request_data['job_title']) && in_array($item->key,$request_data['job_title'])) {{ $item->value }} @endif
                        @endforeach
                    @else
                        all
                    @endif
                </p>
                <p>Unit(s):
                    @if(isset($request_data['unit']))
                        @foreach($units as $item)
                            @if(isset($request_data['unit'])&& in_array($item->key,$request_data['unit'])) {{ $item->value }} @endif
                        @endforeach
                    @else
                        all
                    @endif
                </p>
                <p>Shift(s):
                    @if(isset($request_data['shift']))
                        @foreach($shifts as $item)
                            @if(isset($request_data['shift']) && in_array($item->key,$request_data['shift'])) {{ $item->value }} @endif
                        @endforeach
                    @else
                        all
                    @endif
                </p>
            </div>
        </div>
    </div>
</div>
@section('page-script')
    Number.prototype.padLeft = function (base, chr) {
        var len = (String(base || 10).length - String(this).length) + 1;
        return len > 0 ? new Array(len).join(chr || '0') + this : this;
    }
    var currentDate = new Date();
    var d = (currentDate.getMonth() + 1).padLeft() + "." + currentDate.getDate().padLeft()
        + "." + currentDate.getFullYear()
        + "-" + currentDate.getHours().padLeft() + "." + currentDate.getMinutes().padLeft();
    $('#data-table-export').dataTable({
        "aoColumnDefs": [
            { 'bSortable': false, 'aTargets': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] },
        ],
        dom: 'lBfrtip',
        //'stateSave': true,
        'order': [0, 'desc'],
        buttons: [
            {extend: 'csv', title: 'Wambi-' + d},
            {{--{extend: 'pdf', title: 'Wambi-' + d},--}}
            {{--{extend: 'print', title: 'Wambi-' + d},--}}
            {
                extend: 'collection',
                text: 'Report',
                buttons: [
                    {
                        text: 'Overall Employee Report',
                        action: function () {
                            console.log('Overall Employee Report');
                            $('.performance-report-md').modal('show');
                        }
                    },
                    {
                        text: 'Individual Employee Report',
                        action: function () {
                            console.log('Individual Employee Report');
                            window.location.href = '/admin/employee/print-view/'+{{ \Auth::user()->id }}
                        }
                    },
                ]
            }
        ],
    });

    $('.button-submit').on('click', function(){
        $('#filter-form').submit();
    });

    $('.button-pecks').on('click', function(){
        $('#input_pecks').val($(this).val());
        $('#filter-form').submit();
    });

    $('.buttons-csv').on('click',function(e){
        e.preventDefault();
        console.log('test');
    });
@append