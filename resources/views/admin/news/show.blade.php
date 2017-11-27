@extends('admin.layout')
@section('title', $news->title)
@section('meta')
    <meta property="og:title" content="{{ $news->title }}"/>
    <meta property="og:image" content="{{ url('')  . '/uploads/news/' . $news->id . '/' . $news->image }}"/>
    <meta property="og:site_name" content="Wambi"/>
    <meta property="og:description" content="{{ $news->content }}"/>
@endsection
@section('content')
<div class="row">
    <div class="col-lg-8 col-md-10 col-lg-offset-2 col-md-offset-1">
        <div class="card-box">
                <!--  Modal content for the above example -->
                <div id="newsfeed-detail">
                    <div class="">
                        <div class="">
                            <div class="">
                                <h4 class="modal-title">@{{ item.title }}</h4>
                            </div>
                            <div class="modal-body">
                              @{{{ item.content }}}
                              <p v-if="item.tagged_users.length">
                                — with <a href="#">@{{ item.tagged_users[0].firstname + ' ' + item.tagged_users[0].lastname }}</a>
                                <template v-if="item.tagged_users.length == 2">
                                    and <a href="#">@{{ item.tagged_users[1].firstname + ' ' + item.tagged_users[1].lastname }}</a>
                                </template>
                                <template v-if="item.tagged_users.length > 2">
                                    and <a href="#" data-toggle="tooltip" data-placement="bottom" data-html="true" title="" v-bind:data-original-title="otherTagUsers">@{{ item.tagged_users.length - 1 }} others</a>
                                </template>
                              </p>
                            </div>
                            <hr class="m-b-5 m-t-5">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="blog-widget-action">
                                        <a href="#"
                                            v-bind:title="item.is_current_user_like ? 'unlike' : 'like'"
                                            v-on:click.prevent="toogleLike(item.is_current_user_like, item.id)">
                                            <i class="mdi md-favorite" :class="{ 'text-danger' : item.is_current_user_like }"></i></i> <span>@{{ item.likes.length }}</span>
                                        </a>
                                        <a href="javascript:void(0)">
                                            <i class="mdi md-comment"></i> <span>@{{ item.comments.length }}</span>
                                        </a>
                                           {{--
                                        <a v-bind:href="'http://www.facebook.com/share.php?u={!! url()->current() !!}' + '&title=' + item.title + '&description=' + item.desc" target="_blank" class="btn btn-facebook waves-effect waves-light">
                                           <i class="fa fa-facebook"></i>
                                        </a>
                                        <a v-bind:href="'http://twitter.com/intent/tweet?status=' + item.desc + '+' + '{!! url()->current() !!}'" target="_blank" class="btn btn-twitter waves-effect waves-light">
                                           <i class="fa fa-twitter"></i>
                                        </a>
                                        <a v-bind:href="'http://pinterest.com/pin/create/bookmarklet/?media='+ '{{ url('') }}' + '/uploads/news/' + item.id + '/' + item.image +'&url=' + '{!! url()->current() !!}' + '&is_video=false&description=' + item.desc" target="_blank" class="btn btn-pinterest waves-effect waves-light">
                                           <i class="fa fa-pinterest"></i>
                                        </a>
                                        <a v-bind:href="'https://plus.google.com/share?url=' + '{!! url()->current() !!}'" target="_blank" class="btn btn-googleplus waves-effect waves-light">
                                           <i class="fa fa-google-plus"></i>
                                        </a>
                                        <a v-bind:href="'http://www.linkedin.com/shareArticle?mini=true&url=' + '{!! url()->current() !!}' + '&title=' + item.title" target="_blank" class="btn btn-linkedin waves-effect waves-light">
                                           <i class="fa fa-linkedin"></i>
                                        </a>
                                        --}}
                                    </div>
                                </div>
                            </div>


                            <div class="row" v-if="item.comments.length">
                                <div class="col-sm-12">
                                    <div class="card-box m-b-0">
                                        <div class="comment-box" style="max-height: 250px; overflow-y: scroll">
                                            <template v-for="comment in item.comments">
                                                <div class="comment">
                                                    <img v-bind:src="comment.user.user_avatar" alt="" class="comment-avatar">
                                                    <div class="comment-body">
                                                        <div class="comment-text">
                                                            <div class="comment-header">
                                                                <a href="#" title="">@{{ comment.user.firstname + ' ' +  comment.user.lastname }}</a><span>@{{ comment.created_time }}</span>
                                                            </div>
                                                            @{{{ comment.comment }}}
                                                        </div>
                                                    </div>
                                                </div>
                                            </template>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="comment">
                                        <img src="{{ Auth::user()->photo() }}" alt="" class="comment-avatar">
                                        <div class="comment-body">
                                            <input type="text"
                                                    class="form-control"
                                                    placeholder="Write a comment ..."
                                                    v-on:keyup.13="comment($event, item.id)">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
        </div>
    </div>
</div>  
@stop
@section('page-script')
@append

@push('scripts')
<script src="{{ asset('assets/js/vue.js')}}"></script>
<script type="text/javascript">
    var news = '{!! !empty($news) ? json_encode($news, JSON_HEX_APOS) : "[]" !!}';
    new Vue({
        el: "#newsfeed-detail",
        data: {
            item : $.parseJSON(news)
        },
        methods: {
            toogleLike: function(liked, newsId) {
                if (liked) {
                    this.unlike(newsId);
                } else {
                    this.like(newsId);
                }
            },
            like: function(newsId) {
                var self = this;
                $.ajax({
                    url: "{{ route('newsfeed.like') }}",
                    type: 'POST',
                    data: {newsId: newsId},
                    success: function(result){
                        self.item = result;
                    }
                });
            },
            unlike: function(newsId) {
                var self = this;
                $.ajax({
                    url: "{{ route('newsfeed.unlike') }}",
                    type: 'POST',
                    data: {newsId: newsId},
                    success: function(result){
                        self.item = result;
                    }
                });
            },
            comment: function(e, newsId) {
                var comment = e.target.value;
                var self = this;

                if (comment != '') {
                    $.ajax({
                        url: "{{ route('newsfeed.comment') }}",
                        type: 'POST',
                        data: {newsId: newsId, comment: comment},
                        success: function(result){
                            e.target.value = '';
                            $('.comment-box').animate({scrollTop: $('.comment-box').prop("scrollHeight")}, 500);
                            self.item = result;
                        }
                    });
                }

            }
        },
        computed: {
            otherTagUsers: function() {
                users = this.item.tagged_users;

                result = '';
                for (var i = 1; i < users.length; i++) {
                    result += users[i].firstname + ' ' + users[i].lastname + '<br>';
                }
                return result;
            }
        },
        created: function() {
            $('[data-toggle="tooltip"]').tooltip();
        }
    });
</script>
@endpush
