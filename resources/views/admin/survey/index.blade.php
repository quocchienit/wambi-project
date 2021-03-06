@extends('admin.layout',['survey' => 1])
@section('content')
    <div class="row">
        <div class="col-lg-12">
            @include('partials.widget-icon-box', ['value'=> $total_surveys,'name'=>'Total Reviews','column' => 6,'icon'=>'bg-inverse','graph'=>'<svg class="peity" height="48" width="120"><polygon fill="#4c5667" points="0 47.5 0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556 120 47.5"></polygon><polyline fill="none" points="0 21.38888888888889 13.333333333333334 31.833333333333336 26.666666666666668 0.5 40 16.166666666666668 53.333333333333336 21.38888888888889 66.66666666666667 0.5 80 10.944444444444443 93.33333333333334 31.833333333333336 106.66666666666667 21.38888888888889 120 37.05555555555556" stroke="#4c5667" stroke-width="1" stroke-linecap="square"></polyline></svg>'])
            @include('partials.widget-icon-box', ['value'=> $today_surveys ,'name'=>'Reviews Today','column' => 6,'icon'=>'bg-info','graph'=>'<svg class="peity" height="45" width="120"><rect fill="#34d3eb" x="0.8571428571428571" y="20" width="6.857142857142858" height="25"></rect><rect fill="#ebeff2" x="9.428571428571429" y="30" width="6.857142857142856" height="15"></rect><rect fill="#34d3eb" x="18" y="0" width="6.857142857142858" height="45"></rect><rect fill="#ebeff2" x="26.571428571428573" y="15" width="6.857142857142858" height="30"></rect><rect fill="#34d3eb" x="35.14285714285714" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="43.714285714285715" y="0" width="6.857142857142854" height="45"></rect><rect fill="#34d3eb" x="52.285714285714285" y="10" width="6.857142857142861" height="35"></rect><rect fill="#ebeff2" x="60.857142857142854" y="30" width="6.857142857142854" height="15"></rect><rect fill="#34d3eb" x="69.42857142857143" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="78" y="35" width="6.857142857142861" height="10"></rect><rect fill="#34d3eb" x="86.57142857142857" y="0" width="6.857142857142861" height="45"></rect><rect fill="#ebeff2" x="95.14285714285714" y="10" width="6.857142857142861" height="35"></rect><rect fill="#34d3eb" x="103.71428571428571" y="35" width="6.857142857142861" height="10"></rect><rect fill="#ebeff2" x="112.28571428571429" y="40" width="6.857142857142847" height="5"></rect></svg>' ])
        </div>
    </div>
    @if(\Cache::get('function_amada') != 1)
    <div class="row">
        @include('admin.partials.survey', ['questions' => $questions])
    </div>
    <!-- exit-survey-->
    <div class =  "row">
    	<div class="col-lg-12">
			<div class="portlet">
				<div class="portlet-heading bg-custom">
					<h3 class="portlet-title">
						PATIENT SATISFACTION REVIEW
					</h3>
					<div class="clearfix"></div>
				</div>
				<div id="bg-primary" class="panel-collapse collapse in">
					<div class="portlet-body">
						@foreach($questiontype as $element)
							@include('admin.partials.survey_exit', ['questions' => $question_exit[$element->key],'header' => $element->value, 'id' => $element->key])
						@endforeach							
					</div>
				</div>
			</div>
		</div>
    </div>
    @endif
@stop