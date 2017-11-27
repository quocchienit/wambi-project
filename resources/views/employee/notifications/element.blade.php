        <a href="@if(isset($content->link)){{$content->link}}@if(isset($content->unit)){{'?unit='.$content->unit.'#awards_request'}}@endif
                 @else 
                    {{'javascript:void(0)'}}
                 @endif" 
            class="list-group-item {{ $element->pivot->status or '' }} @if($element->pivot->notification_id == 8) award_request_notification @endif"  
            data-id="{{ $element->id or null }}"
            data-unit="{{ $content->unit or null }}">
            <div class="media">
                <div class="pull-left p-r-10">
                    <em class="{{ $element->pivot->content==='0'?'icon-close':$element->icon }} {{ $element->css_class or "text-primary" }}"></em>
                </div>
                <div class="media-body">
                    <h5 class="media-heading">
                        @include("employee.notifications.$element->name")
                    </h5>
                    <p class="m-0">
                        <small>{{ $element->pivot->created_at->diffForHumans() }}</small>
                    </p>                                            
                </div>
            </div>
        </a>