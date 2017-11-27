<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class NotificationController extends Controller
{
    public function mark_read(Request $request)
    {
    	$employee_id = \Auth::user()->id;
    	$query = \DB::table('employee_notification');
    	if($request->has('id')){
    		$query->where('id',$request->id)
    			->update(['status'=>null]);
    	}else if($request->has('read')){
            $query->where('employee_id',$employee_id)       
                ->delete();            
        }
        else{
    		$query->where('employee_id',$employee_id)  		
    			->where('status','NOT_SEEN')    		
    			->update(['status'=>'SEEN_BUT_UNREAD']);
    	}
    	return response()->json(['success'=>true]);
    }
}
