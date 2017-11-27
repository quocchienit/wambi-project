<?php namespace App\Composers;
use App\CodeMaster;
class Period{

    public function compose($view)
    {
    	$time_period = \Cache::rememberForever('time_period',function(){
        	return CodeMaster::get_code_master('time_period');
    	});
     	$view->with('time_period',$time_period);
    }
}