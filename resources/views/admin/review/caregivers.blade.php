@extends('admin.review.layout')
@section('content')
<style>
	.bio-data{
		font-weight: bold;
		font-size: 16px;
		display: block;
		max-width: 350px;
		margin: 0 auto;
	}
</style>
<div class="wrapper1"  style ="margin-top:60px !important;">
	<div class="container">
		{{-- <div class="row"> --}}
			{{-- <div class="col-lg-12"> --}}
				<div style="color:white;text-shadow: 0 0 1px #000;font-size:20px; padding:5px;">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-7">
							<ol class="discipline-filter mix-filter" style="margin: 0;padding:10px 0;">
								@if(\Cache::get('function_amada') ==  1)
								 		<li class="filter" data-filter='all'  style ="text-transform: none;">@lang('survey.all_caregivers')</li>
									@else
										<li class="filter" data-filter='all'>@lang('survey.all_caregivers')</li>
									@endif
								@foreach ($disciplines as $element)
									@if(\Cache::get('function_amada') ==  1)
										@if($element->refkey == \Session::get('unit'))
										<li class="filter" data-filter='.{{ $element->id }}' style ="text-transform: none;">{{trans($element->value) }}</li>
										@endif
									@else
										<li class="filter" data-filter='.{{ $element->id }}'>{{trans($element->value) }}</li>
									@endif
								@endforeach
							</ol>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-5">
							<div class="form-group">
								<input id='employee-search' type="text" name="q" class="form-control" placeholder="@lang("survey.search_by_caregiver's_name")">					
							</div>
							
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			{{-- </div> --}}
		{{-- </div> --}}
		<div class="row mix-grid">
		</div>
	</div> 
</div>
@stop
@section('page-script')
$(".mix-grid").mixItUp();
search();
$("#employee-search").on('keyup',function(e){
	search($(this).val());
})
$(".mix-grid").on("click",".mix-inner",function(){
	var _ = $(this);
	if($(this).data('bio')){
var bio_data = "<span class='bio-data'>"+$(this).data('bio')+"</span><br>";
	}else{
		var bio_data = "";
	}
	swal({
		html: true,
        title: $(this).data('name') + ' - ' + $(this).data('job-title'),
        text: bio_data + "@lang('survey.are_you_sure') "+$(this).data('name')+" ?",
        showCancelButton: true,
        cancelButtonClass: 'btn-white btn-md waves-effect',
        confirmButtonClass: 'btn-primary btn-md waves-effect waves-light',
        confirmButtonText: '@lang('survey.begin_survey')',
        cancelButtonText: '@lang('survey.cancel')',
        imageSize: '300x300',
        {{-- closeOnConfirm: false, --}}
        {{-- closeOnCancel: false, --}}
        imageUrl: '"'+$(this).data('image')+'"',
    }, function (isConfirm) {
        if (isConfirm) {
        	$.ajax({
	          url: '/admin/review/check',
	          type: 'post',
	          dataType: 'json',
	          data: {id:_.data('id')}
	        })
	        .done(function(response) {
	          if(response.success){
	        	location.href='/admin/review/employee/'+ _.data('id');
	          }
	          else
	          {
	          	swal("Error!", '@lang("survey.error_max_survey")', "error");
	      	  }
	        })
	        .fail(function(){
	            swal("Error!", "Problem when processing request", "error");
	        })

        }
    });
});
function search(content){
	$.ajax({
		type:'post',
		url:'/admin/review/search', 
		data:{q: content},
	}).done(function(json) {
		$(".mix-grid").mixItUp('destroy');
		$(".mix-grid").html(json).mixItUp();
	})
}

@append