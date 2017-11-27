<?php namespace App\Composers;
use App\CodeMaster;
class HourlyRate
{

    public function compose($view)
    {
    	$data = \Cache::rememberForever('hourly_rates',function(){
        	return \App\HourlyRate::all();
    	});
     	$view->with('hourly_rates',$data);
    }
}