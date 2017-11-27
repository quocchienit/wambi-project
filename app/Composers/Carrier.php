<?php namespace App\Composers;
use App\CodeMaster;
class Carrier
{

    public function compose($view)
    {
    	$carriers = \Cache::rememberForever('carriers',function(){
        	return \DB::table('carriers')->select('id','name','address')->get();
    	});
     	$view->with('carriers',$carriers);
    }
}