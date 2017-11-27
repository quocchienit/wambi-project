<?php namespace App\Composers;
use App\CodeMaster;
use App\ConfigPeck;
class Peck
{

    public function compose($view)
    {
    	/*
    	$value = CodeMaster::get_code_master('shift_pecks');
        if(\Session::has('current_unit') && \Session::get('current_unit') != 0){
            $unit_id = \Session::get('current_unit');
        }else{
            $unit_id = \Auth::user()->units[0];
        }
		$peck = ConfigPeck::where('unit_id',$unit_id)->get();        
		$peck = $peck[0];		
		$value[1]->display_name = $value[1]->display_name.$peck->urgent;
		$value[2]->display_name = $value[2]->display_name.$peck->v_urgent;
		$value[3]->display_name = $value[3]->display_name.$peck->e_urgent;
		
		$value[1]->value = $peck->urgent;
		$value[2]->value = $peck->v_urgent;
		$value[3]->value = $peck->e_urgent;
		*/
		//$data = \Cache::rememberForever('shift_pecks',function(){
        //	return CodeMaster::get_code_master('shift_pecks');
    	//});
    	$shift_pecks = CodeMaster::get_code_master('shift_pecks');
       	$value = [];
		$pecks = ConfigPeck::get();        	

		foreach  ($pecks as $peck )	
		{
			$p=clone $shift_pecks[1];
			$p->display_name = $p->display_name.$peck->urgent;
			$p->value = $peck->urgent;
			$p->notes = $peck->unit_id;
			$value[]=$p;
			
			$p=clone $shift_pecks[2];
			$p->display_name = $p->display_name.$peck->v_urgent;
			$p->value = $peck->v_urgent;
			$p->notes = $peck->unit_id;
			$value[]=$p;
			
			$p=clone $shift_pecks[3];
			$p->display_name = $p->display_name.$peck->e_urgent;
			$p->value = $peck->e_urgent;
			$p->notes = $peck->unit_id;
			$value[]=$p;
						
		}

    	$data = $value;
    	//dd($data);
     	$view->with('pecks',$data);
    }
}