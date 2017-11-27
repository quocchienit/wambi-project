<?php

namespace App\Http\Controllers\Admin;
use Config;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use View;
use Event;
use App\Events\ShiftApprove;
use App\CodeMaster;
use App\Shift;
use App\ShiftRequest;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class ShiftController extends Controller
{
    function __construct()
    {
        View::composers([
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\AvailableShifts'  => ['partials.available_shifts'],
            'App\Composers\ShiftRequests'  => ['admin.partials.shift_requests'],
            'App\Composers\ShiftTime'  => ['admin.partials.shift_requests','partials.available_shifts','admin.shift.add_edit'],
            'App\Composers\JobTitle'  => ['admin.partials.shift_requests','partials.available_shifts','admin.shift.add_edit'],
            'App\Composers\Peck'  => ['admin.partials.shift_requests','partials.available_shifts','admin.shift.add_edit'],
            'App\Composers\Discipline'  => ['admin.shift.add_edit'],
            'App\Composers\HourlyRate'  => ['admin.shift.add_edit'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\Facility'  => ['admin.*'],
            'App\Composers\ShowAllUnits'  => ['admin.*'],
            ]);
    }
    public function save(Request $request,$shift_master=null)
    {
        if($shift_master==null){
            $shift_master = new Shift;
            $shift_master->user_id = \Auth::user()->id;
            $shift_master->created_at = Carbon::now();
            // $shift_master->hourly_rate()->attach($request->shift_hourly_rate);
        }
        $shift_master->shift_unit = \Input::get('shift_unit');
        $shift_master->shift_discipline = \Input::get('shift_discipline');
        $shift_master->shift_job_title = \Input::get('shift_job_title');
        $shift_master->shift_date = \Input::get('shift_date');
        $shift_master->shift_time = \Input::get('shift_time');
        $shift_master->shift_pecks = \Input::get('shift_pecks');
        $shift_master->shift_notes = \Input::get('shift_notes');
        if(\Input::get('shift_city')) {
            $shift_master->shift_city = \Input::get('shift_city');
        }
        if(\Input::get('fac_id'))
        {
        	$shift_master->fac_id = \Input::get('fac_id');
        }
        else
        {
        	$shift_master->fac_id = \Auth::user()->fac_id;
        }
        
        $shift_master->shift_starttime = date('G:i',strtotime(\Input::get('shift_starttime')));
        $shift_master->shift_endtime = date('G:i',strtotime(\Input::get('shift_endtime')));
        $shift_master->save();
        $shift_hourly_rate = [];          
        $shift_hourly_rate = $request->shift_hourly_rate ? $request->shift_hourly_rate : [];
        $shift_master->hourly_rate()->sync($shift_hourly_rate);
        return Redirect::to('admin/shift');

    }
    public function edit($shift_master=null)
    {        
        return view('admin.shift.add_edit',compact('shift_master'));
    }
    public function getIndex()
    {
        return view('admin.shift.index');
    }
    public function delete($shift_master)
    {
        $shift_master->delete();
        return response()->json(['success'=>true,'message'=>'Shift deleted successfully.']);
    }
    public function approve($shift_master,$employee_id)
    {
        $shift_master->status = 'Accepted';
        $shift_master->employee_id = $employee_id;
        if($shift_master->save()){
            event(new ShiftApprove($shift_master));
            return response()->json(['success'=>true,'cssClass'=>Config::get("css.$shift_master->status"),'message'=>'Shift accepted successfully.','status'=>$shift_master->status]);
        }
        return response()->json(['success'=>false,'cssClass'=>'danger','message'=>'Shift accepted unsuccessfully.','status'=>'Error']);
    }
    public function reject($shift_master)
    {
        $shift_master->status = 'Rejected';
        $shift_master->save();
        return response()->json(['success'=>true,'message'=>'Shift rejected.','cssClass'=>Config::get("css.$shift_master->status"),'status'=>$shift_master->status]);
    }
}
