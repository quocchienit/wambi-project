     
        <div class="card-box">
            <a href="{{route('admin::faqs::add')}}" class="pull-right btn btn-default btn-sm waves-effect waves-light"><i class="icon-plus"></i> Add Question</a>
            <h4 class="text-dark m-t-0">Question and Answers</h4>
            <p class="text-muted m-b-30 font-13">
            </p>
            <table class="table table-striped table-hover table-responsive data-table">
                <thead>
                    <tr>
                        <th>FAQs ID</th>
                        <th>Content</th>
                        <th>User Type</th>
                        <th>Create User</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($faqs as $detailQa)
                    <tr>                        
                        <td>
                             <a href ="javascript:void(0);" data-animation="fadein" data-plugin="custommodal"
                             data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                             data-target="#{{$detailQa->qaid}}">{{$detailQa->qaid}}</a>                            

                             <!--  Modal content for the above example -->
                            <div id="{{$detailQa->qaid}}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title">Answers for {{$detailQa->qaid}}</h4>
                                        </div>
                                        <div class="modal-body" style ="overflow :auto;">
                                          <p> {{str_limit(strip_tags($detailQa->anwser),20)}}</p>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->
                        </td>
                        <td>
                            {{str_limit(strip_tags($detailQa->question),20)}}
                        </td>             
                        <td>                            
                            {{--*/ $type = $detailQa->utype /*--}}
                            @if (is_array($type))
                            @foreach($type as $key=>$s)
                                {{--*/ $type[$key] = $utype[$s-1]->name /*--}}
                            @endforeach
                            @endif
                            {{@implode('; ',$type)}}
                        </td>           
                        <td>{{$detailQa->firstname." ".$detailQa->lastname}}</td>                        
                        <td>                            
                            <form class="ajax-delete" action="{{route('admin::faqs::delete',['faqs'=>$detailQa->qaid])}}">                                
                                {!! csrf_field() !!}
                                <a href="{{ route("admin::faqs::edit",['faqs'=>$detailQa->qaid]) }}" title='Edit' class='btn btn-primary btn-xs'><i class='icon-pencil'></i></a>
                                <button title='Delete' type="submit" class='btn btn-danger btn-xs'><i class='icon-trash'></i></button>
                            </form>
                        </td>                                                
                    </tr>            
                    @endforeach
                </tbody>
            </table>
        </div> 
