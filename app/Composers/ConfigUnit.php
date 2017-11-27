<?php namespace App\Composers;
use App\ConfigPeck;
use App\CodeMaster;
class ConfigUnit
{

    public function compose($view)
    {
    	$current_unit = null;
        //dd(\Session::get('current_unit'));
    	if(\Session::has('current_unit') && \Session::get('current_unit') != 0){
            //dd(1);
    		$current_unit = \Session::get('current_unit');
        }
    	else{
            $current_fac = \Session::get('current_fac');
            if($current_fac == 0){
                $current_fac = '%';
            }
            $units = CodeMaster::where('type','unit')->whereRaw("refkey like '$current_fac'")->get();
            if($units->count() > 0){
                $current_unit = $units[0]->key;
            }
            //dd($units);
        }
    	$config_unit = ConfigPeck::where('unit_id','=',$current_unit)->take(1)->get();
        $Qnotes = CodeMaster::where('type','=','qa_notes')->get();
        if($config_unit->count() == 0)
        {
            $config_unit = ConfigPeck::take(1)->get();
            $Qnotes[0]->value = $config_unit[0]->from_need.'%-'.$config_unit[0]->to_need.'%';
            $Qnotes[1]->value = $config_unit[0]->from_sactisfactory.'%-'.$config_unit[0]->to_sactisfactory.'%';
            $Qnotes[2]->value = $config_unit[0]->from_good.'%-'.$config_unit[0]->to_good.'%';
            $Qnotes[3]->value = $config_unit[0]->from_excellent.'%-'.$config_unit[0]->to_excellent.'%';
            $Qnotes[4]->value = $config_unit[0]->from_exceptional.'%-'.$config_unit[0]->to_exceptional.'%';
        }else {        	
        	$Qnotes[0]->value = $config_unit[0]->from_need.'%-'.$config_unit[0]->to_need.'%';
        	$Qnotes[1]->value = $config_unit[0]->from_sactisfactory.'%-'.$config_unit[0]->to_sactisfactory.'%';
        	$Qnotes[2]->value = $config_unit[0]->from_good.'%-'.$config_unit[0]->to_good.'%';
        	$Qnotes[3]->value = $config_unit[0]->from_excellent.'%-'.$config_unit[0]->to_excellent.'%';
        	$Qnotes[4]->value = $config_unit[0]->from_exceptional.'%-'.$config_unit[0]->to_exceptional.'%';
        }
     	$view->with('Qnotes',$Qnotes);
    }
}