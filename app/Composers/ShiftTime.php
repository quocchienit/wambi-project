<?php namespace App\Composers;
use App\CodeMaster;
class ShiftTime
{

    public function compose($view)
    {
    	$data = \Cache::rememberForever('shift_times',function(){
        	return CodeMaster::get_code_master('shift_time');
    	});
     	$view->with('shift_times',$data);
    }
}