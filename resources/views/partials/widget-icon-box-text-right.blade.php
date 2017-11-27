<div class="col-lg-{{ $column or 6 }}">
    <div class="card-box">
        <div class="bar-widget">
            <div class="table-box">
                <div class="table-detail">
                    <h4 class="m-t-0 m-b-5">
                        <b>{{ $value or 0 }}</b>
                    </h4>
                    <h5 class="text-muted m-b-0 m-t-0">{{ $name or '' }}</h5>
                </div>                               
                <div class="table-detail text-right">
                        <i class="{{ $icon or ''}}"></i>
                </div>
            </div>
        </div>
    </div>
</div>