<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class NewsFeedComment extends Model
{
    protected $table = 'newsfeed_comments';
    protected $fillable = [
    	'news_id',
    	'user_id',
    	'comment'
    ];

    public function user() {
	    return $this->belongsTo('App\User');
	}

	public function getCreatedTimeAttribute() {
		if ($this->created_at->ne(Carbon::now()->subDays(2))) {
            return 'about '.Carbon::createFromTimeStamp(strtotime($this->created_at))->diffForHumans();
        } else {
            return $this->created_at->format("F d \\at H:i a");
        }
	}
}
