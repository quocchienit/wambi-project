<div class="col-lg-6">
	<div class="chart_div">
		<div class="card-box" id="performance-chart">
            <?php
            $units = DB::table('code_master')->where('type','unit')->whereIn('key',$employee->units)->get();
            $i=0;
            ?>
			<ul class="nav nav-tabs navtab-bg nav-justified qa-tab">
				@if(count($units) > 1)
				<li class="active">
					<a class="tab_choose_all" data-toggle="tab" aria-expanded="false">
						<span>All</span>
					</a>
				</li>
				@endif
				@foreach ($units as $key)
					@if(count($units) > 1)
		            	<li class="">
		            @else
		            	 <li class="{{ $i==0?'active':'' }}">
		            @endif
						<a class="tab_choose" data-index="{{ $i }}" href="Chart<?=str_replace('.', '', str_replace(' ', '', $key->value))?>" data-toggle="tab" aria-expanded="false">
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
				@if(count($units) > 1)
				<div id="Chart_all">
					<div id="line-smoothing-all" style="display: block" class="ct-chart ct-golden-section content-tab">
						<svg class="nvd3-svg"></svg>
					</div>
				</div>
				@endif
				<?php $i = 0; ?>
				@foreach ($units as $key)
					<div id="Chart<?=str_replace('.', '', str_replace(' ', '', $key->value))?>">
						@if(count($units) > 1)
						<div id="line-smoothing-{{ $i }}" style="display: none" class="ct-chart ct-golden-section content-tab">
							<svg class="nvd3-svg"></svg>
						</div>
						@else
						<div id="line-smoothing-{{ $i }}" style="{{ $i?'display: none':'' }}"  class="ct-chart ct-golden-section content-tab">
							<svg class="nvd3-svg"></svg>
						</div>
						@endif
					</div>
					<?php $i++; ?>
				@endforeach
			</div>

			{{--<div class="legend">--}}
				{{--<table style="margin:auto;">--}}
					{{--<tbody>--}}
						{{--<tr>--}}
							{{--<td class="legendColorBox">--}}
								{{--<div style="border:1px solid null;padding:1px">--}}
									{{--<div style="width:4px;height:0;border:5px solid #fb6d9d;overflow:hidden"></div>--}}
								{{--</div>--}}
							{{--</td>--}}
							{{--<td class="legendLabel">{{ $your_performance or "Your Performance" }}&nbsp;&nbsp;</td>--}}
							{{--<td class="legendColorBox">--}}
								{{--<div style="border:1px solid null;padding:1px">--}}
									{{--<div style="width:4px;height:0;border:5px solid #5d9cec;overflow:hidden"></div>--}}
								{{--</div>--}}
							{{--</td>--}}
							{{--<td class="legendLabel">Unit&nbsp;&nbsp;</td>--}}
							{{--<td class="legendColorBox"></td>--}}
							{{--<td class="legendLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>--}}
						{{--</tr>--}}
					{{--</tbody>--}}
				{{--</table>--}}
			{{--</div>--}}
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

<?php
	$i = 0;
	foreach ($data as $item){ ?>
        <input type="hidden" data-data="{{json_encode($item)}}" id="data_chart_{{$i}}">
	<?php
	$i++;
	}
	?>
	<input type="hidden" data-data="{{json_encode($data_all[0])}}" id="data_chart_all">
	@if(count($units) > 1)
		<input type="hidden" value="all" id="data_index_query">
	@else
		<input type="hidden" value="1" id="data_index_query">
	@endif
	@section('page-script')
	@if(count($units) > 1)
		var data = {!! json_encode($data_all[0]) !!};
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

			d3.select('#line-smoothing-all svg')
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

				d3.select('#line-smoothing-all svg')
					.attr('viewBox', '0 0 ' + w + ' ' + h)
					.transition().duration(500)
					.call(chart);
			}

			// This resize simply sets the SVG's dimensions, without a need to recall the chart code
			// Resizing because of the viewbox and perserveAspectRatio settings
			// This scales the interior of the chart unlike the above
			function resizeChart() {
				var container = d3.select('#line-smoothing-all');
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
@else
	var data = {!! json_encode($data[0]) !!};
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

		d3.select('#line-smoothing-0 svg')
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

			d3.select('#line-smoothing-0 svg')
				.attr('viewBox', '0 0 ' + w + ' ' + h)
				.transition().duration(500)
				.call(chart);
		}

		// This resize simply sets the SVG's dimensions, without a need to recall the chart code
		// Resizing because of the viewbox and perserveAspectRatio settings
		// This scales the interior of the chart unlike the above
		function resizeChart() {
			var container = d3.select('#line-smoothing-0');
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
@endif
	$(".tab_choose_all").on('click', function(){
		$('.content-tab').css('display','none');
		var data = $('#data_chart_all').data('data');
		$('#line-smoothing-all').css('display','block');
		$('#data_index_query').val('all');

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

            d3.select('#line-smoothing-all svg')
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

                d3.select('#line-smoothing-all svg')
                    .attr('viewBox', '0 0 ' + w + ' ' + h)
                    .transition().duration(500)
                    .call(chart);
            }

            // This resize simply sets the SVG's dimensions, without a need to recall the chart code
            // Resizing because of the viewbox and perserveAspectRatio settings
            // This scales the interior of the chart unlike the above
            function resizeChart() {
                var container = d3.select('#line-smoothing-all');
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
	});

	$(".tab_choose").on('click', function(){
		var id = $(this).data('index');
		var data = $('#data_chart_'+id).data('data');
		$('.content-tab').css('display','none');
		$('#line-smoothing-'+id).css('display','block');
		$('#data_index_query').val(id);

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

            d3.select('#line-smoothing-'+id+' svg')
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

                d3.select('#line-smoothing-'+id+' svg')
                    .attr('viewBox', '0 0 ' + w + ' ' + h)
                    .transition().duration(500)
                    .call(chart);
            }

            // This resize simply sets the SVG's dimensions, without a need to recall the chart code
            // Resizing because of the viewbox and perserveAspectRatio settings
            // This scales the interior of the chart unlike the above
            function resizeChart() {
                var container = d3.select('#line-smoothing-'+id);
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
	});
@append
