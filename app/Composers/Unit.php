<?php namespace App\Composers;
use App\CodeMaster;
class Unit
{

    public function compose($view)
    {
    	$fac = 1;
    	if(\Session::has('current_fac')){
    		$fac = \Session::get('current_fac');
    	}
        if($fac == 0){
            $fac = '%';
        }
        if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1){
            $units = CodeMaster::where('type','unit')
                            //->whereRaw("refkey like '$fac'")                            
                            ->get();
        }else{
            $units = CodeMaster::where('type','unit')
                            ->whereRaw("refkey like '$fac'")
                            ->whereIn('key',\Auth::user()->units)
                            ->get();            
        }
     	$view->with('units',$units);
    }
}