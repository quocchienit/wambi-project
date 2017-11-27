<div class="card-box" id="news">

    <h4 class="m-t-0 m-b-20 header-title"><b>News</b></h4>
    <div class="nicescroll mx-box">
        <ul class="list-unstyled transaction-list m-r-5">
            @forelse ($news as $element)
            <?php
                $element->is_current_user_like = $element->is_current_user_like;
                    foreach($element->comments as $comment) {
                        $comment->user = $comment->user;
                        $comment->user->user_avatar = $comment->user->user_avatar;
                        $comment->created_time = $comment->created_time;
                    }
                $element->likes = $element->likes;
                $element->tagged_users = $element->tagged_users;
                $element->desc = strip_tags($element->content);
            ?>
            <news-modal news="{{ json_encode($element) }}"></news-modal>
            <template id="news-modal-template">
                <li data-animation="fadein">
                    <a href="javascript:void(0);"
                        data-plugin="custommodal"
                        data-toggle="modal"
                        data-overlaySpeed="200"
                        data-overlayColor="#36404a"
                        data-target="#news-@{{ item.id }}">

                            <img v-show="item.image != null" class="thumb-lg" v-bind:src="'{{ asset('uploads/news') }}' + '/' + item.id + '/' + item.image" />
                            <img v-show="item.image == null" class="thumb-lg" v-bind:src="'{{ asset('assets/images/no-image.png') }}'"/>
                        <span class="tran-text">@{{ item.title }}</span>
                        <span class="pull-right text-muted">@{{ item.created_at }}</span>
                        <span class="clearfix"></span>
                    </a>
                    <div class="row m-t-10">
                        <div class="col-xs-12 text-right">
                            <div class="m-t-10 blog-widget-action">
                                <a href="#"
                                        v-bind:title="item.is_current_user_like ? 'unlike' : 'like'"
                                        v-on:click.prevent="toogleLike(item.is_current_user_like, item.id)">
                                        <i class="mdi md-favorite" :class="{ 'text-danger' : item.is_current_user_like }"></i></i> <span>@{{ item.likes.length }}</span>
                                    </a>
                                <a href="javascript:void(0)"
                                    data-plugin="custommodal"
                                    data-toggle="modal"
                                    data-overlaySpeed="200"
                                    data-overlayColor="#36404a"
                                    data-target="#news-@{{ item.id }}">
                                    <i class="mdi md-comment"></i> <span>@{{ item.comments.length }}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <!--  Modal content for the above example -->
                <div :id="'news-' + item.id"
                    class="modal fade permalink popupNew" tabindex="-1" role="dialog"
                    aria-labelledby="myLargeModalLabel"
                    aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
                                        <a v-bind:href="'http://www.facebook.com/share.php?u={!! url('news') !!}/' + item.id + '&title=' + item.title + '&description=' + item.desc" target="_blank" class="btn btn-facebook waves-effect waves-light">
                                           <i class="fa fa-facebook"></i>
                                        </a>
                                        <a v-bind:href="'http://twitter.com/intent/tweet?status=' + item.desc + '+' + '{!! url('news') !!}/' + item.id" target="_blank" class="btn btn-twitter waves-effect waves-light">
                                           <i class="fa fa-twitter"></i>
                                        </a>
                                        <a v-bind:href="'http://pinterest.com/pin/create/bookmarklet/?media='+ '{{ url('') }}' + '/uploads/news/' + item.id + '/' + item.image +'&url=' + '{!! url('news') !!}/' + item.id + '&is_video=false&description=' + item.desc" target="_blank" class="btn btn-pinterest waves-effect waves-light">
                                           <i class="fa fa-pinterest"></i>
                                        </a>
                                        <a v-bind:href="'https://plus.google.com/share?url=' + '{!! url('news') !!}/' + item.id" target="_blank" class="btn btn-googleplus waves-effect waves-light">
                                           <i class="fa fa-google-plus"></i>
                                        </a>
                                        <a v-bind:href="'http://www.linkedin.com/shareArticle?mini=true&url=' + '{!! url('news') !!}/' + item.id + '&title=' + item.title" target="_blank" class="btn btn-linkedin waves-effect waves-light">
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
                                                                <div v-if="isAdmin || currentUserId == comment.user.id">
                                                                    <span class="deleteComment" >
                                                                        <form class="ajax-delete-comment" action="{{ url('deleteComment') }}/@{{comment.id }}">
                                                                            {!! csrf_field() !!}                                        
                                                                            <button title='Delete' type="submit"'><i class="fa fa-remove" aria-hidden="true"></i></button>
                                                                        </form>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            @{{ comment.comment }}
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
                                            <div class="row" style="margin: 0">
                                                <div class="col-sm-10 todo-inputbar">
                                                    <input type="text" id="comment-content" name="comment-content" class="form-control" placeholder="Write a comment ...">
                                                </div>
                                                <div class="col-sm-2 todo-send">
                                                    <button @click="comment($event, item.id)" class="btn-primary btn-md btn-block btn waves-effect waves-light" type="button" id="todo-btn-submit">Send</button>
                                                </div>
                                            </div>
                                            {{-- <input type="text"
                                                    class="form-control"
                                                    placeholder="Write a comment ..."
                                                    v-on:keyup.13="comment($event, item.id)"> --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </template>
            @empty
            {{-- empty expr --}}
            @endforelse
        </ul>
    </div>
</div>
<div id="fb-root"></div>
@push('scripts')
<script src="{{ asset('assets/js/vue.min.js')}}"></script>
<script type="text/javascript">
    var currentUserId = {{\Auth::user()->id}};
    var isAdmin = ("{{\Auth::user()->isAdmin()}}")?1:0;

    Vue.component('news-modal', {
        template: "#news-modal-template",
        props: ['news'],
        data: function() {
            var begin = this.news.indexOf('font-family:');
            var end = this.news.indexOf('font-size:');
            var str = this.news.slice(begin, end);

            if(str){
                var news_str = str.replace(/\"/g, "'");
                var news_news = this.news.replace(new RegExp(str, 'g'), news_str);
                return {
                    item : $.parseJSON(news_news),
                    currentUserId: currentUserId,
                    isAdmin: isAdmin
                }
            }else{
                return {
                    item : $.parseJSON(this.news),
                    currentUserId: currentUserId,
                    isAdmin: isAdmin
                }
            }
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
                var comment = $('.modal.permalink.in #comment-content').val();
                var self = this;

                if (comment != '') {
                    $.ajax({
                        url: "{{ route('newsfeed.comment') }}",
                        type: 'POST',
                        data: {newsId: newsId, comment: comment},
                        success: function(result){
                            $('.modal.permalink.in #comment-content').val('');
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

    var news = new Vue({
        el: "#news"
    })

    $(document).ready(function() {
        $(".modal.permalink").each(function(){
            if(window.location.href.indexOf($(this).attr("id")) != -1){
                $(this).modal('show');
            }
        });

     /* ajax delete */
            $(document).on('submit','.ajax-delete-comment',function(){
              var _ = $(this);
              swal({
                  title: "Are you sure you want to delete?",
                  text: "You will not be able to recover this!",
                  type: "error",
                  showCancelButton: true,
                  confirmButtonClass: 'btn-danger',
                  confirmButtonText: "Yes, delete it!",
                  closeOnConfirm: false
              }, function () {
                $.ajax({
                  url: _.attr('action'),
                  type: 'post',
                  dataType: 'json',
                  data: _.serialize(),
                })
                .done(function(response) {
                  if(response.success){
                    _.closest('.comment').fadeOut('slow',function(){
                      swal("Deleted!", response.message, "success");
                    });
                  }
                }) 
                .fail(function(){
                    swal("Error!", "Problem when processing request", "error");
                })                   
              });                                      
              return false;
            })
    });
</script>
@endpush
