<?php namespace App\Composers;
use App\CodeMaster;
class Facility
{

    public function compose($view)
    {
    	//$units = \Cache::rememberForever('units',function(){
        //	return CodeMaster::get_code_master('unit');
    	//});    	
    	$facs = CodeMaster::get_code_master('facility');    	    	
     	$view->with('facs',$facs);
    }
}