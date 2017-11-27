<div class="col-lg-6">
    <div class="chart_div">
        <div class="card-box" id="performance-chart">
            <?php
            $units = DB::table('code_master')->where('type', 'unit')->whereIn('key', $employee->units)->get();
            $i = 0;
            ?>
            <ul class="nav nav-tabs navtab-bg nav-justified qa-tab">
                @foreach ($units as $key)
                    <li class="{{$i==0?'active':''}}">
                        <a class="tab_choose" data-index="{{ $i }}"
                           href="Chart<?=str_replace('.', '', str_replace(' ', '', $key->value))?>" data-toggle="tab"
                           aria-expanded="false">
                            <span>{{ $key->value }}</span>
                        </a>
                    </li>
                    <?php $i++; ?>
                @endforeach
            </ul>
            <h4 class="text-center"><b>{{ $chart_title or "Your Performance vs Unit Performance" }}</b></h4>

            <p class="text-muted m-b-30 font-13 text-center chart-title">

                {{$from_date->format("F d")}} - {{$from_date->addDays(6)->format("F d")}}

            </p>
            <div class="">
                <?php $i = 0; ?>
                @foreach ($units as $key)
                    <div id="Chart<?=str_replace('.', '', str_replace(' ', '', $key->value))?>">
                        <div id="line-smoothing-{{ $i }}" style="{{$i?'display: none':''}}"
                             class="ct-chart ct-golden-section content-tab"></div>
                    </div>
                    <?php $i++; ?>
                @endforeach
            </div>

            <div class="legend">
                <table style="margin:auto;">
                    <tbody>
                    <tr>
                        <td class="legendColorBox">
                            <div style="border:1px solid null;padding:1px">
                                <div style="width:4px;height:0;border:5px solid #fb6d9d;overflow:hidden"></div>
                            </div>
                        </td>
                        <td class="legendLabel">{{ $your_performance or "Your Performance" }}&nbsp;&nbsp;</td>
                        <td class="legendColorBox">
                            <div style="border:1px solid null;padding:1px">
                                <div style="width:4px;height:0;border:5px solid #5d9cec;overflow:hidden"></div>
                            </div>
                        </td>
                        <td class="legendLabel">Unit&nbsp;&nbsp;</td>
                        <td class="legendColorBox"></td>
                        <td class="legendLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="text-center graph-period">
                <ol class="breadcrumb">
                    <li>
                        <a href="javascript:void(0);" data-period='date'>Daily</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-period='week'>Weekly</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-period='month'>Monthly</a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-period='year'>Yearly</a>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>
<?php
$data = collect($employee->graph('date'));
$i = 0;
foreach ($data as $item){ ?>
<input type="hidden" data-data="{{json_encode($item)}}" id="data_chart_{{$i}}">
<?php
$i++;
}
?>
<input type="hidden" value="0" id="data_index_query">
@section('page-script')
    var chart = new Chartist.Line(
        '#line-smoothing-0',
            {!! json_encode($data[0]) !!},
        {
            lineSmooth: Chartist.Interpolation.simple({
                divisor: 2
            }),
            fullWidth: true,
            chartPadding: {
                right: 90
            },
            scaleMinSpace: 40,
            stretch: true,
            high: 100,
            low: 0,
            referenceValue: 5,
            plugins: [
                Chartist.plugins.tooltip()
            ]
        }
    );

    $(".graph-period").on('click', 'a', function () {
        var id = $('#data_index_query').val();
        $.getJSON("{{ url('/employee/graph/')}}/{{$employee->id}}/" + $(this).data('period'), function (data) {
            $(".chart-title").html(data[id].title);
            var chart = new Chartist.Line(
                '#line-smoothing-' + id,
                data[id],
                {
                    lineSmooth: Chartist.Interpolation.simple({
                        divisor: 2
                    }),
                    fullWidth: true,
                    chartPadding: {
                        right: 90
                    },
                    scaleMinSpace: 40,
                    stretch: true,
                    high: 100,
                    low: 0,
                    referenceValue: 5,
                    plugins: [
                        Chartist.plugins.tooltip()
                    ]
                });
        });
    });

    $(".tab_choose").on('click', function () {
        var id = $(this).data('index');
        var data = $('#data_chart_' + id).data('data');
        $('.content-tab').css('display', 'none');
        $('#line-smoothing-' + id).css('display', 'block');
        $('#data_index_query').val(id);
        var chart = new Chartist.Line(
            '#line-smoothing-' + id,
            data,
            {
                lineSmooth: Chartist.Interpolation.simple({
                    divisor: 2
                }),
                fullWidth: true,
                chartPadding: {
                    right: 90
                },
                scaleMinSpace: 40,
                stretch: true,
                high: 100,
                low: 0,
                referenceValue: 5,
                plugins: [
                    Chartist.plugins.tooltip()
                ]
            }
        );
    });
@append