<!-- Footer -->
<footer class="footer text-right">
    <div class="container">
         <div class="row">
            <div class="col-xs-6">
                <!--© 2016. All rights reserved.-->
            </div>
            <div class="col-xs-6">
                <ul class="pull-right list-inline m-b-0">
                    {{--<li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Help</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>--}}
                    <li>
                        <a href ="javascript:void(0);" id="btnTerm" data-animation="fadein" data-plugin="custommodal"
                                     data-toggle="modal" data-overlaySpeed="200" data-overlayColor="#36404a" 
                                     data-target="#accordion-modal-help">Help</a>

                        <!--Help modal-->                        
                        <div id="accordion-modal-help" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content p-0">
                                        <div class="panel-group panel-group-joined" id="accordion-test">
                                            @foreach($qa as $item)
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion-test" href="#{{$item->qaid}}" class="collapsed">
                                                                {{strip_tags($item->question)}}
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="{{$item->qaid}}" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            {{strip_tags($item->anwser)}}
                                                        </div>
                                                    </div>
                                                </div>
                                                @endforeach
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                        <!--Help modal-->
                    </li>
                </ul>
            </div>
        </div> 
    </div>
</footer>
<!-- End Footer -->
