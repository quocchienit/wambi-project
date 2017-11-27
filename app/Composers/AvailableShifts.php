<?php namespace App\Composers;
use App\Shift;
use Carbon\Carbon;
class AvailableShifts
{

    public function compose($view)
    {
    	$user = \Auth::user();
    	$unit = \Session::get('current_unit');
        $fac_id = \Session::get('current_fac');
        //$status = '';
        //dd($user->disciplines);
        $query = Shift::whereDate('shift_date','>=',Carbon::now()->format('Y-m-d'));

        if($user->type()=='super-executive' and $fac_id != 0 )
        {
        	$query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        
        if($user->type() !='super-executive' and $unit != 0 )
        {
        	if($user->type() == 'employee')
        	{
        		$query->whereIn('shift_unit',$user->units);
            	$query->whereIn('shift_discipline',$user->disciplines);
            	$query->where('shift_job_title',$user->job);
            }
            else{
            	$query->where('shift_unit',$unit);
        	}
        }
        /*
        $fac_id = $user->fac_id;        
        $query = Shift::whereDate('shift_date','>=',Carbon::now()->format('Y-m-d'))
                        ->where('fac_id',$fac_id);
        //if($user->id == 2)
        
        if(($user->type()=='super-executive'|| $user->type() == 'super-admin') && \Session::get('current_unit') != 0){
            $query->where('shift_unit',\Session::get('current_unit'));
        }
        else{
        	$query->whereIn('shift_unit',$user->units);
        	 if($user->type() == 'employee')
            	$query->whereIn('shift_discipline',$user->disciplines);
        }
        */
        $available_shifts = $query->with('employee','requests','user')->get();
       	//dd($query);
        $view->with('available_shifts',$available_shifts);
    }
}