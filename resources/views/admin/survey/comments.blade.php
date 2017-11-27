@extends('admin.layout')
@section('content')
    <style>
        .attention_btn {
            border: 1px solid #888;
            border-radius: 50%;
            padding: 2px 10px;
            font-weight: bold;
            background-color: #f2f2f2;
            margin-left: 5px;
        }

        .tooltip-inner {
            color: #000000;
            background-color: #ffffff;
            border: 1px solid #888888;
            border-radius: 8px;
            text-align: left;
            padding: 12px;
            font-size: 13px;
        }
    </style>
    @if (session('message'))
        <div class="col-lg-12">
            <div class="alert alert-info">
                {{ session('message') }}
            </div>
        </div>
    @endif
    <div class="col-lg-12">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#all" data-toggle="tab" aria-expanded="true">
				<span class="visible-xs"><i class="fa fa-home"></i>
				</span>
                    @if(\Cache::get('function_amada') != 1)
                        <span class="hidden-xs">ALL CARE PROVIDERS</span>
                    @else
                        <span class="hidden-xs">ALL</span>
                    @endif
                </a>
            </li>

            @foreach($disciplines as $item)
                <li class="">
                    <a href="#{{'discipline'.$item->key}}" data-toggle="tab" aria-expanded="false">
					<span class="visible-xs"><i class="fa fa-user"></i>
					</span> <span class="hidden-xs">{{$item->value}}</span></a>
                </li>
            @endforeach
            @if(\Cache::get('function_amada') != 1)
                <li class=""><a href="#other" data-toggle="tab" aria-expanded="false">
                        <span class="visible-xs"><i class="fa fa-cog"></i></span>
                        <span class="hidden-xs">OVERALL EXPERIENCE</span></a>
                </li>
            @endif
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="all">
                <table class="table table-striped" id="data-table-export">
                    <thead>
                    <tr>
                        <th></th>
                        <th class="text-center">Carepostcard</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($cmtall as $element)
                        <tr>
                            <td>
                                <div class="comments">
                                    <div class="cmt-img">
                                        <img src="{{ $element->image != '' && \File::exists(public_path("uploads/profiles/$element->image")) ? url("uploads/profiles/$element->image") : url("/assets/images/users/avatar-1.jpg") }}"
                                             class="img-circle" alt="">
                                    </div>
                                    <div class="cmt-content">
                                        <div class="cmt-name">{{ $element->firstname.' '.$element->lastname}}</div>
                                        <b>{{ $element->job_title }} </b><br>
                                        <b>{{$element->insurance}} </b><br>
                                        <p>{{ $element->cmt_description }}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center" style="vertical-align: middle">
                                @if($element->cpc_status)
                                    <img src="{{url('assets/images/cpc_status.png')}}" data-toggle="tooltip"
                                         data-placement="top"
                                         title="This logo indicates that this comment was publically posted on carepostcard.com"
                                         style="height: 90px;">
                                @endif
                            </td>
                            <td class="text-center" style="vertical-align: middle">
                                <a data-jobtitle="{{$element->job_title}}" data-id="{{$element->cm_id}}" class="btn btn-success post-newsfeed" style="background-color: #5fbeaa !important;border-color: #5fbeaa !important;">Post on Newsfeed</a>
                            </td>
                            <td style="vertical-align: middle;">
                                <div class="cmt-date">
                                    {{ $element->date }}
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>

            @foreach($disciplines as $item)
                <div class="tab-pane" id="{{'discipline'.$item->key}}">
                    <table class="table table-striped" id="data-table-export{{$item->key}}">
                        <thead>
                        <tr>
                            <th></th>
                            <th class="text-center">Carepostcard</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data[$item->key] as $element)
                            <tr>
                                <td>
                                    <div class="comments">
                                        <div class="cmt-img">
                                            <img src="{{ $element->image != '' && \File::exists(public_path("uploads/profiles/$element->image")) ? url("uploads/profiles/$element->image") : url("/assets/images/users/avatar-1.jpg") }}"
                                                 class="img-circle" alt="">
                                        </div>
                                        <div class="cmt-content">
                                            <div class="cmt-name">{{ $element->firstname.' '.$element->lastname}}</div>
                                            <b>{{ $element->job_title }} </b><br>
                                            <b>{{$element->insurance}} </b><br>
                                            <p>{{ $element->cmt_description }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center" style="vertical-align: middle">
                                    @if($element->cpc_status)
                                        <img src="{{url('assets/images/cpc_status.png')}}" data-toggle="tooltip"
                                             data-placement="top"
                                             title="This logo indicates that this comment was publically posted on carepostcard.com"
                                             style="height: 90px;">
                                    @endif
                                </td>
                                <td class="text-center" style="vertical-align: middle">
                                    <a data-jobtitle="{{$element->job_title}}" data-id="{{$element->cm_id}}" class="btn btn-success post-newsfeed" style="background-color: #5fbeaa !important;border-color: #5fbeaa !important;">Post on Newsfeed</a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <div class="cmt-date">
                                        {{ $element->date }}
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            @endforeach
            @if(\Cache::get('function_amada') != 1)
                <div class="tab-pane" id="other">
                    <table class="table table-striped" id="data-table-exportother">
                        <thead>
                        <tr>
                            <th></th>
                            <th class="text-center">Carepostcard</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($cmtother as $element)
                            <tr>
                                <td>
                                    <div class="comments">
                                        <div class="cmt-content">
                                            <div class="cmt-name">
                                                {{ $element->insurance }}
                                            </div>
                                            <p>{{ $element->cmt_description }}</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center" style="vertical-align: middle">
                                    @if($element->cpc_status)
                                        <img src="{{url('assets/images/cpc_status.png')}}" data-toggle="tooltip"
                                             data-placement="top"
                                             title="This logo indicates that this comment was publically posted on carepostcard.com"
                                             style="height: 90px;">
                                    @endif
                                </td>
                                <td class="text-center" style="vertical-align: middle">
                                    <a data-id="{{$element->cm_id}}" class="btn btn-success post-newsfeed" style="background-color: #5fbeaa !important;border-color: #5fbeaa !important;">Post on Newsfeed</a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <div class="cmt-date">
                                        {{ $element->date }}
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            @endif
        </div>
    </div>

    <div class="modal fade modalNewsfeed" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <h4 class="m-t-0 header-title">Create Newsfeed</h4>
                <form action="{{ route("admin::news::add") }}" method="post"
                      enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    <div class="form-group m-b-0">
                        <label class="control-label">Image</label>
                        <img src="" class="thumb-lg img-responsive img-avatar" alt="">
                        <input type="file" class="filestyle" data-input="false" data-placeholder="Select image" name="image">
                        <input type="hidden" name="file_old" value="" class="file_old">
                    </div>
                    <div class="form-group">
                        <label>Title*</label>
                        <input value="" parsley-trigger="change" required name="title"
                               placeholder="Enter title" class="form-control title">
                    </div>

                    <?php
                    $units_array = array();
                    foreach ($units as $element) {
                        $units_array[] = $element->key;
                    }
                    $units_item = implode($units_array, ',');
                    $current_unit = \Session::get('current_unit');
                    ?>
                    <input type="hidden" value="{{ $units_item }}" name="unit_array">
                    <div class="form-group">
                        <label>Unit*</label>
                        <select id='unit' name="units[]" parsley-trigger="change" required
                                class="form-control select2 select2-multiple" multiple
                                data-placeholder="Select Unit ...">
                            @if(\Cache::get('function_amada') != 1 || \Auth::user()->type() == 'super-executive')
                                <option value="all">All</option>
                            @endif
                            @foreach ($units as $element)
                                <option value="{{ $element->key }}">{{ $element->value }}</option>
                            @endforeach
                        </select>
                    </div>
                    {{--@endif--}}
                    <div class="form-group">
                        <label>Tag people to this Newsfeed <span class="btn btn-secondary attention_btn" data-toggle="tooltip" data-placement="top" title="Those tagged in the post will be notified via text/email">!</span></label>
                        <select id="tags-select" class="form-control select2" name="tags[]" multiple="multiple">
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Content*</label>
                        <textarea name="content" class="form-control summernote content" parsley-trigger="change"
                                  rows="4" placeholder="Enter content."></textarea>
                    </div>
                    <div class="form-group text-right m-b-0">
                        <div style="display: inline-block;float: left;">
                            <input type="checkbox" class="form-check-input" name="accept-send-mail">
                            Send SMS and Email notification to <b>all</b> employees
                        </div>
                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                            Submit
                        </button>
                        <a class="btn btn-default waves-effect waves-light m-l-5 cancel">
                            Cancel
                        </a>
                    </div>
                    <input type="hidden" value="comment" name="new_status">
                    <input type="hidden" value="" name="cpc_status" id="cpc_status">
                </form>
            </div>
        </div>
    </div>
@stop
@section('page-script')
    Number.prototype.padLeft = function (base, chr) {
        var len = (String(base || 10).length - String(this).length) + 1;
        return len > 0 ? new Array(len).join(chr || '0') + this : this;
    }
    // Please have the filename generated be 'Wambi-Date-time (mm.dd.yyyy-hh.mm)' -- example 'Wambi-09.01.2016-13.45.xlsx'
    var currentDate = new Date();
    var d = (currentDate.getMonth() + 1).padLeft() + "." + currentDate.getDate().padLeft()
        + "." + currentDate.getFullYear()
        + "-" + currentDate.getHours().padLeft() + "." + currentDate.getMinutes().padLeft();

    @foreach($disciplines as $item)
    $('#data-table-export{{$item->key}}').DataTable({
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            {extend: 'pdf', title: 'Wambi-' + d}, {extend: 'print', title: 'Wambi-' + d},
        ],
        "columnDefs": [
            {"orderData": false, "targets": 0},
        ],
    });
    @endforeach
    $('#data-table-export').DataTable({
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            {extend: 'pdf', title: 'Wambi-' + d}, {extend: 'print', title: 'Wambi-' + d},
        ],
        "columnDefs": [
            {"orderData": false, "targets": 0},
            // { "orderData": [ 0], "targets": 0 }
            //{ "orderable": false, "targets": 0 },
            //{ "visible": false, "targets": 0 },
        ],
    });

    $('#data-table-exportother').DataTable({
        dom: 'lBfrtip',
        'stateSave': true,
        buttons: [
            {extend: 'pdf', title: 'Wambi-' + d}, {extend: 'print', title: 'Wambi-' + d},
        ],
        "columnDefs": [
            {"orderData": false, "targets": 0},
            // { "orderData": [ 0], "targets": 0 }
            //{ "orderable": false, "targets": 0 },
            //{ "visible": false, "targets": 0 },
        ],
    });

    $('.tab-content').on('click', '.post-newsfeed', function () {
        var id = $(this).data('id');
        var job_title = $(this).data('jobtitle');
        {{--<script>--}}
        $.ajax({
            url		: 'load-data-comment',
            type	: 'POST',
            data	: {
                id: id
            },
            success	: function(data){
                if(data.status == 200){

                    var result = data.data;
                    if(data.data.cpc_status){
                        $('.img-avatar').attr('src','/assets/images/cpc_status.png');
                    }else{
                        $('.img-avatar').attr('src','/uploads/profiles/'+result.employee.image);
                    }
                    $('#cpc_status').val(data.data.cpc_status);
                    $('.file_old').val(result.employee.image);
                    $('.title').val('"'+job_title+'" Spotlight: '+result.employee.firstname+' '+result.employee.lastname);
                    var content = '<p>Congrats to '+result.employee.firstname+' '+result.employee.lastname+' for going above and beyond!</p>' +
                        '<p>Comment from a patient/family:<br>' +
                        '"'+result.cmt_description+'"</p>' +
                        '<p><b>Keep up the fantastic work '+result.employee.firstname+' '+result.employee.lastname+'!</b></p>';
                    $('.note-editable').html(content);
                    $('.content').html(content);
                    $("#unit").select2('val',result.employee.units);
                    $('#tags-select').html('<option value="'+result.employee.id+'" selected>'+result.employee.firstname+' '+result.employee.lastname+'</option>');
                }else{

                }
            }
        });
    $(".modalNewsfeed").modal('show');
    });

    $('.cancel').click(function(){
        $(".modalNewsfeed").modal('hide');
    });
    $('.alert.alert-info').delay(3000).slideUp();
@append