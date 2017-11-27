<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NewsFeedLike extends Model
{
    protected $table = 'newsfeed_likes';
    protected $fillable = [
    	'news_id',
    	'user_id'
    ];

    public $timestamps = false;
}
