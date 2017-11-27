<?php 
namespace App\Composers;
use Auth;
use App\Award;
class AwardRequests
{

    public function compose($view)
    {   
    	// TODO tanphuqn comment
        $unit = \Session::get('current_unit');
        $fac_id = \Session::get('current_fac');
        //$status = '';
        $query = Award::whereRaw("(status is null or status = '')");
        if(\Auth::user()->type()=='super-executive' and $fac_id != 0 )
        {
        	$query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        
        if(\Auth::user()->type() !='super-executive' and $unit != 0 )
        {
        	$query->whereRaw("((type ='unit_award' and owner like '%$unit%') 
               					OR (type ='employee_award' and owner in (SELECT id from employee_master WHERE units like '%$unit%')))");
        }
        
        $award_requests = $query->orderBy('date_created','desc')->get();
    	/*
    	$current_unit = \Session::get('current_unit');
    	$current_fac = \Session::get('current_fac');    
    	 // TODO tanphuqn comment
        if(Auth::user()->type()=='admin' || 
            Auth::user()->type()=='super-executive')
        {
            $current_unit='%';
        }
         if($current_unit == 0){
            $current_unit = '%';
        }
        if($current_unit == '%' || config("customerindex.santaanita") == \Cache::get('current_index')){
        	
            $award_requests = \App\Award::whereRaw("(status is null or status = '')")
                                        ->where('fac_id',$current_fac)
            							->orderBy('date_created','desc') 
            							->get();
        }
        else {
            $award_requests = \App\Award::whereRaw("(status is null or status = '') and ((type ='unit_award' and owner like '%$current_unit%') 
            					OR (type ='employee_award' and owner in (SELECT id from employee_master WHERE units like '%$current_unit%')))")
            						->where('fac_id',$current_fac)
        							->orderBy('date_created','desc')  
        							->get();
        }
        //dd($award_requests);
        */
     	$view->with('award_requests',$award_requests);
    }
}