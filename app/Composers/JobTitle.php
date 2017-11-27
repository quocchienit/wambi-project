<?php namespace App\Composers;
use App\CodeMaster;
class JobTitle
{

    public function compose($view)
    {
    	
    	//return CodeMaster::get_code_master('job_title');
    	$data = [];
    	if(\Cache::get('function_amada') == 1){
    		$code_master = CodeMaster::where('type','job_title')->get();
    		$i = 1;
    		foreach ($code_master as $key) {
    			$data[$i] = $key;
    			$i++;
    		}
    	}
		else{
    		$data = CodeMaster::get_code_master('job_title');
    	}
    	
     	$view->with('job_titles',$data);
    }
}