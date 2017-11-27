<?php namespace App\Composers;
use App\Shift;
use Carbon\Carbon;
use Auth;
class ShiftRequests
{

    public function compose($view)
    {   
    	$user = \Auth::user();
        $fac_id = \Session::get('current_fac');
        $unit = \Session::get('current_unit');
        $query = Shift::has('requests');
                // ->where('status','<>','Accepted')
        		// ->whereDate('shift_date','>=',Carbon::now()->format('Y-m-d'));
        //if($user->id == 2)
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
        $shift_requests = $query->with('employee','requests','user')->get();
        
        //dd($shift_requests);
      $view->with('shift_requests',$shift_requests);
    }
}