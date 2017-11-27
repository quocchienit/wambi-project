@extends('admin.layout')

@section('content')
    @include('partials.reward')
@endsection
@section('contents')
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
                            <div class="btn-redeem-wrapper">
                                <button type="button" class="btn btn-success btn-redeem">Redeem</button>
                            </div>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection