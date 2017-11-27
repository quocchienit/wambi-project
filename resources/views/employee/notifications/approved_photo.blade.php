<a href="{{route('admin::employee::index')}}" class="list-group-item SEEN_BUT_UNREAD}" data-id="">
    <div class="media">
        <div class="pull-left p-r-10">
            <em class="icon-note text-info"></em>
        </div>
        <div class="media-body">
            <h5 class="media-heading">
                {{ $notifications_photo or ''}} new photo upload.
            </h5>
            <p class="m-0">
                <small>{{ $notifications_photo_date->diffForHumans() }}</small>
            </p>                                            
        </div>
    </div>
</a>