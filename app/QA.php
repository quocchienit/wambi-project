<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class QA extends Model
{
    public $timestamps = false;
    protected $table = 'qa';
    //
    //* format datetime */
    public function getCreatedAtAttribute($value)
    {   
    	$date = Carbon::parse($value); 	
        return $date->format('m/d/Y');
    }
    
    public function getQAforUserType($type)
    {
        $qa = QA::where('utype','like','%'.$type.'%')->get();
        return $qa;
    }

    public function setutypeAttribute($value)
    {
        $this->attributes['utype'] = json_encode($value);
    }

    public function getutypeAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
}
