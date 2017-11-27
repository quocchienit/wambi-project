<div class="card-box">
    <a href="{{ route('admin::news::add') }}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Add Newsfeed</a>
    <h4 class="text-dark m-t-0">Newsfeed</h4>
    <p class="text-muted m-b-30 font-13">
    </p>
    <table class="table table-striped table-hover table-responsive data-table">
        <thead>
            <tr>
                <th>Image</th>
                <th>Title</th>
                <th>Content</th>
                <th>Date</th>
                <th> Actions </th>
            </tr>
        </thead>
        <tbody>
            @foreach ($news as $item)
            <tr>
                <td>
                    <a href="{{ route('admin::news::edit',['news'=>$item->id]) }}" title="">
                        @if(!empty($item->image))
                            <img src="{{asset('/uploads/news')."/$item->id/".$item->image}}" class="thumb-lg" alt="">
                        @else
                            <img src="{{asset('/assets/images')."/no-image.png"}}" class="thumb-lg" alt="">
                        @endif
                    </a>
                </td>
                <td>{{$item->title}}</td>
                <td>{{str_limit(strip_tags($item->content),20)}}</td>
                <td>{{Carbon\Carbon::parse($item->created_at)->format('m/d/Y')}}</td>
                <td>
                    <form class="ajax-delete" action="{{route('admin::news::delete',['news'=>$item->id])}}">
                        {!! csrf_field() !!}                                        
                        <a href="{{route("admin::news::edit",['news'=>$item->id])}}" title='Edit' class="btn btn-primary btn-xs"><i class='icon-pencil'></i></a>
                        <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>