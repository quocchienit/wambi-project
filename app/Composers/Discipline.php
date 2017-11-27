<?php namespace App\Composers;
use App\CodeMaster;
class Discipline{

    public function compose($view)
    {   
    	$disciplines = [];
    	if(\Cache::get('function_amada') == 1){
    		$code_master = CodeMaster::where('type','discipline')->get();
    		$i = 1;
    		foreach ($code_master as $key) {
    			$disciplines[$i] = $key;
    			$i++;
    		}
    	}
		else{
			$disciplines = CodeMaster::get_code_master('discipline');
		}

     	$view->with('disciplines',$disciplines);
    }
}