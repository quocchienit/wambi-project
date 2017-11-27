<?php

namespace App\Http\Controllers\Admin;

use App\Employee;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use View;
use App\Http\Requests;
use App\News;
use App\Http\Controllers\Controller;
use App\NewsFeedLike;
use App\NewsFeedComment;
use App\NewsFeedTag;
use App\User;
use Carbon\Carbon;
use Auth;

class NewsController extends Controller
{
    function __construct()
    {
        View::composers([
            'App\Composers\Unit' => ['admin.*'],
            'App\Composers\Help' => ['partials.footer'],
            'App\Composers\Facility' => ['admin.*'],
            'App\Composers\ShowAllUnits'  => ['admin.*'],
        ]);

    }

    public function getIndex()
    {
        $fac_id = \Session::get('current_fac');
        $unit = \Session::get('current_unit');
        if ((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $unit == 0) {
            $news = News::where('fac_id', $fac_id)
                ->orderBy('created_at', 'desc')->get();
        } else {

            $news = News::whereRaw("units like '%\"$unit\"%'")
                ->where('fac_id', $fac_id)
                ->orderBy('created_at', 'desc')->get();
        }
        return view('admin.news.index', compact('news'));
    }

    public function edit($news = null)
    {
        $users = User::where('etid', 2)->orderBy('firstname')->get();
        $taggedUsers = '';
        if (!empty($news)) {
            $newsTag = NewsFeedTag::where('news_id', $news->id)->first();
            $taggedUsers = $newsTag ? $newsTag->users_id : '';
        }

        return view('admin.news.edit', compact('news', 'users', 'taggedUsers'));
    }

    public function show($news = null)
    {
        $users = User::all();
        $taggedUsers = '';
        if (!empty($news)) {
            $newsTag = NewsFeedTag::where('news_id', $news->id)->first();
            $taggedUsers = $newsTag ? $newsTag->users_id : '';
            $news->is_current_user_like = $news->is_current_user_like;
            foreach ($news->comments as $comment) {
                $comment->user = $comment->user;
                $comment->user->user_avatar = $comment->user->user_avatar;
                $comment->created_time = $comment->created_time;
            }
            $news->likes = $news->likes;
            $news->tagged_users = $news->tagged_users;
            $news->desc = strip_tags($news->content);
        }

        return view('admin.news.show', compact('news', 'users', 'taggedUsers'));
    }

    public function save(Request $request ,$news = null)
    {
        $isCreate = false;
        if ($news == null) {
            $news = new News;
            $news->created_at = time();
            $isCreate = true;
        }
        $news->title = \Input::get('title');
        $news->excerpt = \Input::get('excerpt');
        $news->content = \Input::get('content');
        $news->fac_id = \Session::get('current_fac');

        if (\Input::get('units')[0] == 'all') {
            $units_item = \Input::get('unit_array');
            $units_array = explode(',', $units_item);
            $news->units = $units_array;
        } else {
            $news->units = \Input::get('units');
        }

        $message = "NewsFeed could not been created";
        if ($news->save()) {

            $message = "News has been saved";

            // Add Newsfeed tag
            if (!empty(\Input::get('tags'))) {
                $tags = NewsFeedTag::updateOrCreate(
                    ['news_id' => $news->id],
                    ['users_id' => implode(',', \Input::get('tags'))]
                );

                if ($isCreate) {
                    $employees = User::whereIn('id', \Input::get('tags'))->get();
                    // Add notification to each employee
                    foreach ($employees as $employee) {
                        //$content = ['link' => '/admin/news/edit/'.$news->id];
                        $content = ['link' => '/news/' . $news->id];
                        $employee->notifications()->attach(9, [
                            'content' => json_encode($content),
                            'created_at' => Carbon::now()
                        ]);
                        if($employee->email){
                            $email = $employee->email;
                            \Mail::send('emails.news.created',compact('news'), function ($message) use ($email) {
                                $message->from('news@wambi.org');
                                $message->to($email)->subject("You've been tagged in a post!");
                            });
                        }
                        if($employee->mobile && $employee->carrier){
                            $mobile = $employee->mobile.$employee->carrier;
                            \Mail::send('emails.news.created_sms',compact('news'), function ($message) use ($mobile) {
                                $message->from('news@wambi.org');
                                $message->to($mobile)->subject("You've been tagged in a post!");
                            });
                        }
                    }

                    $accept_send_mail = \Input::get('accept-send-mail');
                    if($accept_send_mail == 'on') {
                        $users_string = '';
                        if (count($news->units) > 0) {
                            foreach ($news->units as $unit) {
                                $users = Employee::where('etid', 2)->whereNotIn('id', \Input::get('tags'))->where('units', 'like', "%$unit%")->select('id')->distinct()->get();
                                if (count($users) > 0) {
                                    foreach ($users as $user) {
                                        if (strpos($users_string, $user->id . ',') == false) {
                                            $users_string .= $user->id . ',';
                                        }
                                    }
                                }
                            }
                        }

                        if (strlen($users_string) > 0) {
                            $users_id_array = explode(',', $users_string);
                            array_pop($users_id_array);
                            $users_id_array = array_unique($users_id_array);
                            sort($users_id_array);
                        } else {
                            $users_id_array = array();
                        }

                        if (count($users_id_array) > 0) {
                            $tags = NewsFeedTag::updateOrCreate(
                                ['news_id' => $news->id],
                                ['users_id' => implode(',', $users_id_array)]
                            );
                            foreach ($users_id_array as $user_id) {
                                $user = Employee::find($user_id);
                                if ($user && $user->email) {
                                    $email = $user->email;
                                    \Mail::send('emails.news.all_notification', compact('news'), function ($message) use ($email) {
                                        $message->from('news@wambi.org');
                                        $message->to($email)->subject('Newsfeed Announcement!');
                                    });
                                }
                                if ($user && $user->mobile && $user->carrier) {
                                    $mobile = $user->mobile . $user->carrier;
                                    \Mail::send('emails.news.all_notification_sms', compact('news'), function ($message) use ($mobile) {
                                        $message->from('news@wambi.org');
                                        $message->to($mobile)->subject('Newsfeed Announcement!');
                                    });
                                }
                            }
                        }
                    }
                }
            }else{
                if ($isCreate) {
                    $accept_send_mail = \Input::get('accept-send-mail');
                    if($accept_send_mail == 'on') {
                        $users_string = '';
                        if (count($news->units) > 0) {
                            foreach ($news->units as $unit) {
                                $users = Employee::where('etid', 2)->where('units', 'like', "%$unit%")->select('id')->distinct()->get();
                                if (count($users) > 0) {
                                    foreach ($users as $user) {
                                        if (strpos($users_string, $user->id . ',') == false) {
                                            $users_string .= $user->id . ',';
                                        }
                                    }
                                }
                            }
                        }

                        if (strlen($users_string) > 0) {
                            $users_id_array = explode(',', $users_string);
                            array_pop($users_id_array);
                            $users_id_array = array_unique($users_id_array);
                            sort($users_id_array);
                        } else {
                            $users_id_array = array();
                        }

                        if (count($users_id_array) > 0) {
                            $tags = NewsFeedTag::updateOrCreate(
                                ['news_id' => $news->id],
                                ['users_id' => implode(',', $users_id_array)]
                            );
                            foreach ($users_id_array as $user_id) {
                                $user = Employee::find($user_id);
                                if ($user && $user->email) {
                                    $email = $user->email;
                                    \Mail::send('emails.news.all_notification', compact('news'), function ($message) use ($email) {
                                        $message->from('news@wambi.org');
                                        $message->to($email)->subject('Newsfeed Announcement!');
                                    });
                                }
                                if ($user && $user->mobile && $user->carrier) {
                                    $mobile = $user->mobile . $user->carrier;
                                    \Mail::send('emails.news.all_notification_sms', compact('news'), function ($message) use ($mobile) {
                                        $message->from('news@wambi.org');
                                        $message->to($mobile)->subject('Newsfeed Announcement!');
                                    });
                                }
                            }
                        }
                    }
                }
            }

            if(isset($request->new_status) && $request->new_status=='comment'){
                if (\Input::hasFile('image')) {
                    if (\Input::file('image')->isValid()) {
                        $image = \Input::file('image')->getClientOriginalName();
                        \Input::file('image')->move(public_path() . "/uploads/news/$news->id", $image);
                        $news->image = $image;
                        $news->save();
                        return redirect(route('admin::comments'))->with('message', $message);
                    } else {
                        $message = "Image could not been uploaded";
                    }
                }else{
                    if($request->cpc_status == 1){
                        $avatar = url('/assets/images/cpc_status.png');
                        if($avatar) {
                            if (!is_dir('uploads/news/' . $news->id)) {
                                mkdir('uploads/news/' . $news->id);
                            }
                            $file = Image::make($avatar)->save('uploads/news/' . $news->id . '/cpc_status.png');
                            $news->image = '/cpc_status.png';
                            $news->save();
                        }
                    }else{
                        $avatar = $request->file_old;
                        if($avatar) {
                            if (!is_dir('uploads/news/' . $news->id)) {
                                mkdir('uploads/news/' . $news->id);
                            }
                            $file = Image::make('uploads/profiles/' . $avatar)->save('uploads/news/' . $news->id . '/' . $avatar);
                            $news->image = $avatar;
                            $news->save();
                        }
                    }
                    return redirect(route('admin::comments'))->with('message', $message);
                }
            }else{
                if (\Input::hasFile('image')) {
                    if (\Input::file('image')->isValid()) {
                        $image = \Input::file('image')->getClientOriginalName();
                        \Input::file('image')->move(public_path() . "/uploads/news/$news->id", $image);
                        $news->image = $image;
                        $news->save();
                        return redirect(route('admin::news::index'))->with('message', $message);
                    } else {
                        $message = "Image could not been uploaded";
                    }
                }
            }
        }
        if(isset($request->new_status) && $request->new_status=='comment') {
            return redirect(route('admin::comments::index'))->with('message', $message);
        }else{
            return redirect(route('admin::news::index'))->with('message', $message);
        }
        //return redirect(route('admin::news::edit',['news'=>$news->id]))->with('message',$message);
    }

    public function delete($news)
    {
        $news->delete();
        return response()->json(['success' => true, 'message' => 'News deleted successfully.']);
    }

    public function likeNews(Request $request)
    {
        $user = Auth::user();

        $like = NewsFeedLike::create([
            'news_id' => $request->get('newsId'),
            'user_id' => $user->id
        ]);

        return $this->reloadNewsItem($request);
    }

    public function unLikeNews(Request $request)
    {
        $user = Auth::user();

        $like = NewsFeedLike::where([
            'news_id' => $request->get('newsId'),
            'user_id' => $user->id
        ])->delete();

        return $this->reloadNewsItem($request);
    }

    public function addComment(Request $request)
    {
        $user = Auth::user();

        $comment = NewsFeedComment::create([
            'news_id' => $request->get('newsId'),
            'user_id' => $user->id,
            'comment' => $request->get('comment')
        ]);

        return $this->reloadNewsItem($request);
    }

    private function reloadNewsItem($request)
    {
        $news = News::with('likes', 'comments')->where('id', $request->get('newsId'))->first();
        foreach ($news->comments as $comment) {
            $comment->user = $comment->user;
            $comment->user->user_avatar = $comment->user->user_avatar;
            $comment->created_time = $comment->created_time;
        }
        $news->is_current_user_like = $news->is_current_user_like;
        $news->tagged_users = $news->tagged_users;

        return $news;
    }

      public function deleteNewsFeedComment($commentId)
    {
        $NewsFeedComment = NewsFeedComment::find($commentId);
        if (Auth::user()->isAdmin() || $NewsFeedComment->user_id == Auth::user()->id) {
          NewsFeedComment::where('id','=',$commentId)->delete();
            return response()->json(['success'=>true,'message'=>'Comment deleted successfully.']);
        }

        return response()->json(['success'=>false,'message'=>'Error.']);
    }
}

