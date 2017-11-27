<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class ConfigPeck extends Model
{
	public $timestamps = false;
	protected $table = 'config_peck';

	//* users_to_receive */
    public function getUsersToReceiveAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setUsersToReceiveAttribute($value)
    {
        $this->attributes['users_to_receive'] = json_encode($value);
    }


	//* eidalert */
    public function getEidAlertAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setEidAlertAttribute($value)
    {
        $this->attributes['eidalert'] = json_encode($value);
    }

    //* eidFollow */
    public function getEidFollowAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setEidFollowAttribute($value)
    {
        $this->attributes['eidfollow'] = json_encode($value);
    }

    //* eidRedem */
    public function getEidRedemAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setEidRedemAttribute($value)
    {
        $this->attributes['eidredem'] = json_encode($value);
    }    
}