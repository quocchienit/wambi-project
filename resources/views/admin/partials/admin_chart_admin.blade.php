<div class="col-lg-6">
    <div class="chart_div">
        <div class="card-box" id="admin_chart">
        	@if(config("customerindex.santaanita") == \Cache::get('current_index'))
        		<h4 class="text-center"><b>R.N vs. C.N.A vs. L.V.N</b></h4>
        	@elseif(\Cache::get('function_amada') == 1)
            	<h4 class="text-center"><b>Performance Comparison Graph</b></h4>
            @else
                <h4 class="text-center"><b>Specialty Comparison</b></h4>
        	@endif
            @if(\Cache::get('function_amada') == 1)
            <p class="text-muted font-13 text-center chart-title">
                {{$from_date->format("F d")}} - {{$from_date->addDays(7)->format("F d")}}
            </p>
            @else
            <p class="text-muted m-b-30 font-13 text-center chart-title">
                {{$from_date->format("F d")}} - {{$from_date->addDays(7)->format("F d")}}
            </p>
            @endif

            @if(\Cache::get('function_amada') == 1)
                {{--<div class="legend">--}}
                    {{--<table style="margin:auto;  text-align: center;">--}}
                        {{--<tbody>--}}
                        {{--<tr>--}}
                            {{--{!! App\Survey::graph_series_labels_admin() !!}--}}
                        {{--</tr>--}}
                        {{--</tbody>--}}
                    {{--</table>--}}
                {{--</div>--}}
                <div id="chart1" class="ct-chart ct-golden-section">
                    <svg class="nvd3-svg"></svg>
                </div>
            @else
            <div id="chart1" class="ct-chart ct-golden-section">
                <svg class="nvd3-svg"></svg>
            </div>
            {{--<div class="legend">--}}
                {{--<table style="margin:auto;  text-align: center;">--}}
                    {{--<tbody>--}}
                    {{--<tr>--}}
                		{{--@if(config("customerindex.santaanita") == \Cache::get('current_index'))--}}
                		 {{--<td class="legendColorBox">--}}
                            {{--<div style="border:1px solid;padding:1px">--}}
                                {{--<div style="width:4px;height:0;border:5px solid #5d9cec;overflow:hidden"></div>--}}
                            {{--</div>--}}
                        {{--</td>--}}
                		{{--<td class="legendLabel">R.N&nbsp;&nbsp;</td>--}}
                		 {{--<td class="legendColorBox">--}}
                            {{--<div style="border:1px solid;padding:1px">--}}
                                {{--<div style="width:4px;height:0;border:5px solid #fb6d9d;overflow:hidden"></div>--}}
                            {{--</div>--}}
                        {{--</td>--}}
                		 {{--<td class="legendLabel">C.N.A&nbsp;&nbsp;</td>--}}
                		{{--<td class="legendColorBox">--}}
                            {{--<div style="border:1px solid;padding:1px">--}}
                                {{--<div style="width:4px;height:0;border:5px solid #34d3eb;overflow:hidden"></div>--}}
                            {{--</div>--}}
                        {{--</td>--}}
                		{{--<td class="legendLabel">L.V.N&nbsp;&nbsp;</td>--}}
                		{{--@else--}}
                            {{--{!! App\Survey::graph_series_labels_admin() !!}--}}
                		{{--@endif--}}
                        {{--<td class="legendLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--}}
                    {{--</tr>--}}
                    {{--</tbody>--}}
                {{--</table>--}}
            {{--</div>--}}
            @endif
            {{--<div class="text-center graph-period">--}}
                {{--<ol class="breadcrumb">--}}
                    {{--<li>--}}
                        {{--<a href="javascript:void(0);" data-period='date'>Daily</a>--}}
                    {{--</li>--}}
                    {{--<li>--}}
                        {{--<a href="javascript:void(0);" data-period='week'>Weekly</a>--}}
                    {{--</li>--}}
                    {{--<li>--}}
                        {{--<a href="javascript:void(0);" data-period='month'>Monthly</a>--}}
                    {{--</li>--}}
                    {{--<li>--}}
                        {{--<a href="javascript:void(0);" data-period='year'>Yearly</a>--}}
                    {{--</li>--}}
                {{--</ol>--}}
            {{--</div>--}}
        </div>
    </div>
</div>
@section('page-script')
    {{--var chart = new Chartist.Line('#admin-chart',--}}
        {{--{!! collect(App\Survey::graph_admin('date'))->toJson() !!},--}}
        {{--{--}}
            {{--lineSmooth: Chartist.Interpolation.simple({--}}
                {{--divisor: 2--}}
            {{--}),--}}
            {{--fullWidth: true,--}}
                {{--chartPadding: {--}}
                {{--right: 90--}}
            {{--},--}}
            {{--stretch: true,--}}
            {{--high:100,--}}
            {{--low:0,--}}
            {{--plugins: [--}}
                {{--Chartist.plugins.tooltip()--}}
            {{--]--}}
        {{--}--}}
    {{--);--}}
    {{--$(".graph-period").on('click','a',function(){--}}
    {{--$.getJSON("{{ url('/admin/graph')}}/"+$(this).data('period'),function(data){--}}
    {{--$(".chart-title").html(data.title);--}}
    {{--chart.update(data);--}}
    {{--});--}}
    {{--});--}}
    {{--<script>--}}
        var data = {!! json_encode($data) !!};
        var arr_x = {!! json_encode($arr_x) !!};
        nv.addGraph(function() {
            var chart = nv.models.lineChart();
            var fitScreen = true;
            var width = 600;
            var height = 300;
            var zoom = 1.5;

            chart.useInteractiveGuideline(true);
            chart.xAxis
            {{--.axisLabel('Date')            --}}
                .tickFormat(function(d) { return arr_x[d]; });
            //.tickFormat(function(d) { return d3.time.format('%b %d')(new Date(d)); })

            chart.lines.dispatch.on("elementClick", function(evt) {
                console.log(evt);
            });

            chart.options({
                showXAxis: true,
                showYAxis: true,
                interpolate: 'basis' //<== this line here
            });

            chart.yAxis
                .axisLabel('Wambi Rating (%)')
                .tickFormat(d3.format(',02f'));

            d3.select('#chart1 svg')
                .attr('perserveAspectRatio', 'xMinYMid')
                .attr('width', width)
                .attr('height', height)
                .datum(data);

            setChartViewBox();
            resizeChart();

            nv.utils.windowResize(resizeChart);

            function setChartViewBox() {
                var w = width * zoom,
                    h = height * zoom;

                chart
                    .width(w)
                    .height(h);

                d3.select('#chart1 svg')
                    .attr('viewBox', '0 0 ' + w + ' ' + h)
                    .transition().duration(500)
                    .call(chart);
            }

            // This resize simply sets the SVG's dimensions, without a need to recall the chart code
            // Resizing because of the viewbox and perserveAspectRatio settings
            // This scales the interior of the chart unlike the above
            function resizeChart() {
                var container = d3.select('#chart1');
                var svg = container.select('svg');

                if (fitScreen) {
                    // resize based on container's width AND HEIGHT
                    var windowSize = nv.utils.windowSize();
                    svg.attr("width", windowSize.width);
                    svg.attr("height", windowSize.height);
                } else {
                    // resize based on container's width
                    var aspect = chart.width() / chart.height();
                    var targetWidth = parseInt(container.style('width'));
                    svg.attr("width", targetWidth);
                    svg.attr("height", Math.round(targetWidth / aspect));
                }
            }
            return chart;
        });

        function sinAndCos() {
            return data;
        }
    {{--</script>--}}
@append