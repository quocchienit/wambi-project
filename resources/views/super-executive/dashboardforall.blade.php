@extends('admin.layout')
@section('content')
    @if(\Session::get('current_unit')==0)
        <style>
            svg.nvd3-svg{
                height: 85vh;
            }
        </style>
    @endif
<div class="row">
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
    	<div class="card-box">
    		<h4 class="m-t-0 m-b-20 header-title" style="text-transform: capitalize"><b>{{ $name_fac }}</b></h4>
    		<div id="chart1" class="line-chart">
        		<svg class="nvd3-svg"></svg>
    		</div>
    	</div>
    </div>
</div>
<div class="row">
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
        <div class="card-box">
            <h4 style="font-weight: 600">Wambi Ratings</h4><br>
            @include('partials.brids-eyes', ['some' => 'datarating'])
        </div>
    </div>
</div>
@if (Auth::user()->type() =='super-admin')
<div class="row">
    <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
        <div class="card-box">
            @include('partials.super-qa', ['some' => 'data', 'Qnotes' => $Qnotes])
        </div>
    </div>
</div>
@endif
<input type="hidden" value="{{ isset($status_pass)?$status_pass:0 }}" id="status_pass">
@endsection
@section('page-script')
Number.prototype.padLeft = function(base,chr){
    var  len = (String(base || 10).length - String(this).length)+1;
    return len > 0? new Array(len).join(chr || '0')+this : this;
}
// Please have the filename generated be 'Wambi-Date-time (mm.dd.yyyy-hh.mm)' -- example 'Wambi-09.01.2016-13.45.xlsx'
var currentDate = new Date();
var d = (currentDate.getMonth() + 1).padLeft() + "." + currentDate.getDate().padLeft()
+ "." + currentDate.getFullYear()
+"-"+currentDate.getHours().padLeft() + "." +currentDate.getMinutes().padLeft();
if ( $.fn.dataTable.isDataTable( '#data-table-export' ) ) {
    table = $('#data-table-export').DataTable();
    table.destroy();
}
$('#data-table-export').DataTable( {
    dom: 'lBfrtip',
    'stateSave': true,
    buttons: [
        'copy', { extend: 'csv', title: 'Wambi-'+d}, { extend: 'excel', title: 'Wambi-'+d}, { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
    ],
    columnDefs: [
        {"orderData": false, "targets": 0},
    ],
} );

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
    {{--$("<div class=\"text-center\" style =\"float:left; width: 250px; z-index: 1;\"> <h2 class=\"text-default m-t-0\">Wambi Ratings</h2></div>").insertAfter( ".dt-buttons");--}}
@append
