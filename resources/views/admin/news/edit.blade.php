@extends('admin.layout')
@section('content')
<style>
    .attention_btn{
        border: 1px solid #888;
        border-radius: 50%;
        padding: 2px 10px;
        font-weight: bold;
        background-color: #f2f2f2;
        margin-left: 5px;
    }
    .tooltip-inner{
        color: #000000;
        background-color: #ffffff;
        border: 1px solid #888888;
        border-radius: 8px;
        text-align: left;
        padding: 12px;
        font-size: 13px;
    }
</style>
    <div class="row">
        <div class="col-lg-8 col-md-10 col-lg-offset-2 col-md-offset-1">
            <div class="card-box">
                <h4 class="m-t-0 header-title">Create Newsfeed</h4>
                <form action="{{ isset($news)?route("admin::news::edit",['news'=>$news->id]):'' }}" method="post"
                      enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    @if (session('message'))
                        <div class="alert alert-info">
                            {{ session('message') }}
                        </div>
                    @endif
                    <div class="form-group m-b-0">
                        <label class="control-label">Image</label>
                        <img src="{{ (isset($news))?url("/uploads/news/$news->id/$news->image"):'' }}"
                             class="thumb-lg img-responsive" alt="">
                        <input type="file" class="filestyle" data-input="false" data-placeholder="Select image"
                               name="image">
                    </div>
                    <div class="form-group">
                        <label>Title*</label>
                        <input value="{{ $news->title or '' }}" parsley-trigger="change" required name="title"
                               placeholder="Enter title" class="form-control">
                    </div>

                    {{--@if(isset($news->type) && $news->type=='employee')--}}
                    {{--<input type="hidden" value="{{ str_replace('"','',$news->units[0]) }}" name="unit_array">--}}
                    {{--<div class="form-group">--}}
                    {{--<h5 class="m-t-30">Employee*</h5>--}}
                    {{--<select name="units" class="employee_ajax_search" data-placeholder="Search Employee"  parsley-trigger="change" required >--}}
                    {{--<option value="123" selected="selected"></option>--}}
                    {{--</select>--}}
                    {{--</div>--}}
                    {{--@else--}}
                    <?php
                    $units_array = array();
                    foreach ($units as $element) {
                        $units_array[] = $element->key;
                    }
                    $units_item = implode($units_array, ',');
                    ?>
                    <input type="hidden" value="{{ $units_item }}" name="unit_array">
                    <div class="form-group">
                        <label>Unit*</label>
                        <select id='unit' name="units[]" parsley-trigger="change" required
                                class="form-control select2 select2-multiple" multiple
                                data-placeholder="Select Unit ...">
                            {{--*/ $i = 0 /*--}}
                            @if(\Cache::get('function_amada') != 1 || \Auth::user()->type() == 'super-executive')
                                <option value="all">All</option>
                                {{--*/ $i = 1 /*--}}
                            @endif
                            @foreach ($units as $element)
                                <option value="{{ $element->key }}" {{ (isset($news)&&in_array($element->key,$news->units)) || (!isset($news)&& $i == 0) ?"selected":"" }}>{{ $element->value }}</option>
                                {{--*/ $i = 1 /*--}}
                            @endforeach
                        </select>
                    </div>
                    {{--@endif--}}
                    <div class="form-group">
                        <label>Tag people to this Newsfeed <span class="btn btn-secondary attention_btn" data-toggle="tooltip" data-placement="top" title="Those tagged in the post will be notified via text/email">!</span></label>
                        <select id="tags-select" class="form-control select2" name="tags[]" multiple="multiple">
                            @foreach($users as $user)
                                <option value="{{ $user->id }}">{{ $user->firstname.' '.$user->lastname }}</option>
                            @endforeach
                        </select>
                    </div>
                    {{--                 <div class="form-group">
                                        <label>Excerpt</label>
                                        <textarea name="excerpt" class="form-control" rows="2" placeholder="Enter excerpt.">{{ $news->excerpt or '' }}</textarea>
                                    </div>
                     --}}
                    <div class="form-group">
                        <label>Content*</label>
                        <textarea name="content" class="form-control summernote" parsley-trigger="change" required
                                  rows="4" placeholder="Enter content.">{!! $news->content or '' !!}</textarea>
                    </div>
                    <div class="form-group text-right m-b-0">
                        <div style="display: inline-block;float: left;">
                            <input type="checkbox" class="form-check-input" name="accept-send-mail">
                            Send SMS and Email notification to <b>all</b> employees
                        </div>
                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                            Submit
                        </button>
                        <a href="{{ route('admin::news::index') }}"
                           class="btn btn-default waves-effect waves-light m-l-5">
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop
@push('scripts')
    <script type="text/javascript">
        var selectedValues = "{!! $taggedUsers !!}".split(',');
        $("#tags-select").val(selectedValues);
    </script>
@endpush
@section('page-script')
    var data_user =  {!! json_encode($users) !!};
    $("#unit").change(function () {
        var val = $(this).val();
        var option = "";
        if (val && val[0] == "all") {
            for (var j = 0; j <= Object.keys(data_user).length - 1; j++) {
                var item = data_user[j];
                if (item) {
                    option += "<option value=\"" + item['id'] + "\">" + item['firstname'] + ' ' + item['lastname'] + "</option>"
                }
            }
        } else {
            if (val != null) {
                for (var i = 0; i < val.length; i++) {
                    for (var j = 0; j <= Object.keys(data_user).length - 1; j++) {
                        var item = data_user[j];
                        if (item) {
                            if (item["units"].includes(val[i])) {
                                option += "<option value=\"" + item['id'] + "\">" + item['firstname'] + ' ' + item['lastname'] + "</option>"
                            }
                        }
                    }
                    break;
                }
            }
        }
        $("#tags-select").html(option);
        $("#tags-select").val(selectedValues);
    });
    window.onload = $("#unit").change();
@append