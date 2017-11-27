<div class="row">
    <div class="col-lg-12">
        @if (Auth::user()->can('reward-add'))
            <a href="{{ route('admin::reward::add') }}"
               class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Post
                Reward</a>
        @endif
    </div>
</div>
<div class="row">
    <div id="grid" data-columns>
        @foreach($rewards as $element)
            <div style="padding:10px;" class="item-wrapper">
                <div class="gift-card">
                    <img src="{{$element->photo()}}">
                    <div class="giftcard-pecks">{{$element->pecks}} pecks</div>
                    @if(Auth::user()->etid == 4 || Auth::user()->etid == 7)
                        <div class="btn-giftcard-actions text-center">
                            <a href="{{route("admin::reward::edit",['reward'=>$element->id])}}"
                               class="btn btn-primary btn-link"><span class="icon-pencil"></span></a>
                            <form class="ajax-delete2" style="display: inline-block;"
                                  action="{{route('admin::reward::delete',['reward'=>$element->id])}}">
                                {!! csrf_field() !!}
                                <button type="submit" class="btn btn-danger"><span class="icon-trash"></span>
                                </button>
                            </form>
                        </div>
                    @else
                        <div class="text-center">
                            <div class="btn-redeem-wrappers">
                                <form class="ajax-redeem" action="{{ route('employee::reward::redeem',['reward'=>$element->id]) }}">
                                    {!! csrf_field() !!}
                                    <button type="submit" class="btn btn-success btn-redeem">Redeem</button>
                                </form>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        @endforeach
    </div>
</div>
@section('page-script')
    /* ajax request */
    var confirm = false;
    $(".ajax-redeem").on('submit',function(){        
        var _ = $(this);
        swal({
            title: "Are you sure?",
            // text: "You will not be able to recover this!",
            type: "info",
            showCancelButton: true,
            confirmButtonClass: 'btn-info',
            // confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function () {
            if(confirm) return;
            confirm = true;
            $.ajax({
                url: _.attr('action'),
                type: 'post',
                dataType: 'json',
                data: _.serialize(),
            })
            .done(function(response) {
                if(response.success){
                    swal("Success!", response.message, "success");
                    $("#employee-pecks").fadeOut('slow',function(){
                        $(this).text(response.pecks).fadeIn();
                    });
                }else{
                    swal("Error!", response.message, "error");
                }
                confirm = false;
            })
            .fail(function(){
                swal("Error!", "Problem while processing request", "error");
                confirm = false;
            })
        });
        return false;
    })
@append