<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Auth;
use App\User;

class News extends Model
{
    protected $table = 'newsfeed';
    //
    //* format datetime */
    public function getCreatedAtAttribute($value)
    {   
    	$date = Carbon::parse($value); 	
        return $date->format('m/d/Y');
    }
    // public function setCreatedAtAttribute($value)
    // {
    // 	$date = Carbon::parse($value); 	
    //     $this->attributes['shift_date'] = $date::format('Y-m-d');
    // }
     
    public function likes()
    {
        return $this->hasMany('App\NewsFeedLike');
    }

    public function getTotalLikesAttribute()
    {
        return $this->hasMany('App\NewsFeedLike')->count();
    }

    public function comments()
    {
        return $this->hasMany('App\NewsFeedComment');
    }

    public function getTotalCommentsAttribute()
    {
        return $this->hasMany('App\NewsFeedComment')->count();
    }

    public function tag()
    {
        return $this->hasOne('App\NewsFeedTag');
    }

    public function getTaggedUsersAttribute()
    {
        if (empty($this->tag)) {
            return [];
        }

        return User::whereIn('id', explode(',', $this->tag->users_id))->get();
    }

    public function getIsCurrentUserLikeAttribute()
    {
        $user = Auth::user();
        $likes = $this->likes()->get()->pluck('user_id')->toArray();
        return in_array($user->id , $likes);
    }

    //* units */
    public function getUnitsAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setUnitsAttribute($value) 
    {
        $this->attributes['units'] = json_encode($value);
    }
}
