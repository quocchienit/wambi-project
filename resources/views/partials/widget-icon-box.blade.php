<div class="col-lg-{{ $column or 6 }}">
    <div class="card-box">
        <div class="bar-widget">
            <div class="table-box">
                <div class="table-detail" style = "width:400px;">
                    <div class="iconbox {{ $icon or 'bg-inverse' }}">
                        <i class="icon-layers"></i>
                    </div>
                </div>
                <div class="table-detail" style = "width:400px;">
                     <h4 class="m-t-0 m-b-5"><b>{{ $value or '' }}</b></h4>
                     <h5 class="text-muted m-b-0 m-t-0">{{ $name or '' }}</h5>
                </div>
                <div class="table-detail text-right" style = "width:400px;">
                {!! $graph or '' !!}
                </div>
            </div>
        </div>
    </div>
</div>
