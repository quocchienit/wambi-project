<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NewsFeedTag extends Model
{
    protected $table = 'newsfeed_tags';
    protected $fillable = [
    	'news_id',
    	'users_id'
    ];
}
