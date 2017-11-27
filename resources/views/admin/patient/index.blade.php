@extends('admin.layout')
@section('content')
@if(\Auth::user()->type() == 'patient-manager')
<div class="row">
   	<!--
	@include('partials.widget-icon-box-text-right', ['column'=>'4','name' => 'Pecks','value'=>Auth::user()->pecks,'icon'=>'icon-target'])
	@include('partials.widget-icon-box', ['value'=> $total_surveys,'name'=>'Total Reviews','column' => 4,'icon'=>'bg-inverse','graph'=>'<svg class="peity" height="48" width="120"><polygon fill="#4c5667" points="0 47.5 0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556 120 47.5"></polygon><polyline fill="none" points="0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556" stroke="#4c5667" stroke-width="1" stroke-linecap="square"></polyline></svg>'])
    @include('partials.widget-icon-box', ['value'=> $today_surveys ,'name'=>'Reviews Today','column' => 4,'icon'=>'bg-info','graph'=>'<svg class="peity" height="45" width="120"><rect fill="#34d3eb" x="0.8571428571428571" y="20" width="6.857142857142858" height="25"></rect><rect fill="#ebeff2" x="9.428571428571429" y="30" width="6.857142857142856" height="15"></rect><rect fill="#34d3eb" x="18" y="0" width="6.857142857142858" height="45"></rect><rect fill="#ebeff2" x="26.571428571428573" y="15" width="6.857142857142858" height="30"></rect><rect fill="#34d3eb" x="35.14285714285714" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="43.714285714285715" y="0" width="6.857142857142854" height="45"></rect><rect fill="#34d3eb" x="52.285714285714285" y="10" width="6.857142857142861" height="35"></rect><rect fill="#ebeff2" x="60.857142857142854" y="30" width="6.857142857142854" height="15"></rect><rect fill="#34d3eb" x="69.42857142857143" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="78" y="35" width="6.857142857142861" height="10"></rect><rect fill="#34d3eb" x="86.57142857142857" y="0" width="6.857142857142861" height="45"></rect><rect fill="#ebeff2" x="95.14285714285714" y="10" width="6.857142857142861" height="35"></rect><rect fill="#34d3eb" x="103.71428571428571" y="35" width="6.857142857142861" height="10"></rect><rect fill="#ebeff2" x="112.28571428571429" y="40" width="6.857142857142847" height="5"></rect></svg>' ])

	-->
    @include('partials.widget-icon-box', ['value'=> $total_surveys,'name'=>'Total Reviews','column' => 6,'icon'=>'bg-inverse','graph'=>'<svg class="peity" height="48" width="120"><polygon fill="#4c5667" points="0 47.5 0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556 120 47.5"></polygon><polyline fill="none" points="0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556" stroke="#4c5667" stroke-width="1" stroke-linecap="square"></polyline></svg>'])
    @include('partials.widget-icon-box', ['value'=> $today_surveys ,'name'=>'Reviews Today','column' => 6,'icon'=>'bg-info','graph'=>'<svg class="peity" height="45" width="120"><rect fill="#34d3eb" x="0.8571428571428571" y="20" width="6.857142857142858" height="25"></rect><rect fill="#ebeff2" x="9.428571428571429" y="30" width="6.857142857142856" height="15"></rect><rect fill="#34d3eb" x="18" y="0" width="6.857142857142858" height="45"></rect><rect fill="#ebeff2" x="26.571428571428573" y="15" width="6.857142857142858" height="30"></rect><rect fill="#34d3eb" x="35.14285714285714" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="43.714285714285715" y="0" width="6.857142857142854" height="45"></rect><rect fill="#34d3eb" x="52.285714285714285" y="10" width="6.857142857142861" height="35"></rect><rect fill="#ebeff2" x="60.857142857142854" y="30" width="6.857142857142854" height="15"></rect><rect fill="#34d3eb" x="69.42857142857143" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="78" y="35" width="6.857142857142861" height="10"></rect><rect fill="#34d3eb" x="86.57142857142857" y="0" width="6.857142857142861" height="45"></rect><rect fill="#ebeff2" x="95.14285714285714" y="10" width="6.857142857142861" height="35"></rect><rect fill="#34d3eb" x="103.71428571428571" y="35" width="6.857142857142861" height="10"></rect><rect fill="#ebeff2" x="112.28571428571429" y="40" width="6.857142857142847" height="5"></rect></svg>' ])

</div>
@endif
<div class="row">
    <div class="col-lg-12">
        @include('admin.partials.patients')
    </div>	
</div>
@stop
@section('page-script')
var currentDate = new Date();
var d = (currentDate.getMonth() + 1) + "." + currentDate.getDate() 
+ "." + currentDate.getFullYear()
+"-"+currentDate.getHours() + "." +currentDate.getMinutes();

if ( $.fn.dataTable.isDataTable( '#data-table-export' ) ) {
    table = $('#data-table-export').DataTable();
    table.destroy();
}

$('#data-table-export').DataTable( {
    dom: 'lBfrtip',
    'stateSave': true,
    buttons: [
        'copy', { extend: 'csv', title: 'Wambi-'+d}, { extend: 'pdf', title: 'Wambi-'+d}, { extend: 'print', title: 'Wambi-'+d},
    ],
    "columnDefs": [
    { "orderData": [  6 ],    "targets": 0 },
    ],        
} );
@append