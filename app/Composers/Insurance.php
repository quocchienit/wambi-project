<?php namespace App\Composers;
use App\CodeMaster;
class Insurance
{

    public function compose($view)
    {
    	$insurance = CodeMaster::get_code_master('insurance');
    	
     	$view->with('insurance',$insurance);
    }
}