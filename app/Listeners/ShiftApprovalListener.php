<?php

namespace App\Listeners;

use App\Events\ShiftApprove;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use DB;
use App\Notification;
use App\CodeMaster;
use Carbon\Carbon;
use App\Shift;
use Auth;
use App\ConfigPeck;
class ShiftApprovalListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
       \View::composers([
        'App\Composers\ShiftTime'  => ['emails.shifts.*'],
        'App\Composers\JobTitle'  => ['emails.shifts.*'],
        'App\Composers\Peck'  => ['emails.shifts.*'],
        'App\Composers\Unit'  => ['emails.shifts.*'],
        ]);
    }

    /**
     * Handle the event.
     *
     * @param  ShiftApprove  $event
     * @return void
     */
    public function handle(ShiftApprove $event)
    {
        $shift = $event->shift;
        $user = $shift->employee;        

        
        // config peck for shift
        /* notify pecks for taking shift */
        $pecks = $shift->shift_pecks_value();
        $user->pecks += $pecks;
        $user->save();
        /* notification for employee */
        $shift_time = CodeMaster::get_code_by_type_and_key('shift_time', $shift->shift_time);
        $shift_unit = CodeMaster::get_code_by_type_and_key('unit', $shift->shift_unit);
        $user->notifications()->attach(1,['content'=>"{\"peck\":$pecks, \"shift_time\":\"$shift_time\", \"shift_date\":\"$shift->shift_date\", \"shift_unit\":\"$shift_unit\"}",'created_at'=>Carbon::now()]);
        /* notify available shift for all employees */
        Shift::notify_available($shift, $shift->shift_unit,$shift->shift_job_title);
        // send email and sms to this employee
        if($user->email && $user->email != "")
        {
	        \Mail::send('emails.shifts.approval',compact('shift'), function ($message) use ($user) {
	            $message->to($user->email)->subject('Shift Request!');
	        });
        }
        if($user->carrier && $user->carrier != "")
        {
	        \Mail::send('emails.shifts.approval_sms',compact('shift'), function ($message) use ($user) {
	            $message->to($user->mobile.$user->carrier)->subject('Shift Request!');
	        });
        }
        // send email to all other employees
        // where other user approval
        $employees = \DB::table('employee_master')
            ->where('id','<>',$shift->employee_id)
            ->where('id','<>',$user->id)
            ->where('etid',2)
            //->where('mobile','<>','')
            //->where('carrier','<>','')
            ->whereRaw("units like '%\"$shift->shift_unit\"%'")
            ->whereRaw("disciplines like '%\"$shift->shift_discipline\"%'")
            ->where('job',$shift->shift_job_title)
            ->select(DB::raw("id, carrier, email,concat(mobile,carrier) sms"))
            ->distinct()
            ->get();

        $employees_request = \DB::table('employee_shift')
            ->where('shift_id',$shift->id)
            ->get();
        $emails = [];//dd($employees);
        $sms = [];
        foreach ($employees as $key => $value) {
            foreach ($employees_request as $item){
                if($value->id == $item->employee_id){
                    if($value->email != '')$emails[] = $value->email;
                    if($value->carrier != '')$sms[] = $value->sms;
                }
            }
        }
        // send email
        if(count($emails) > 0){
	        \Mail::send('emails.shifts.accepted',compact('shift'), function ($message) use ($emails) {
	            $message->to($emails)->subject('Shift filled!');
	        }); 
        }  
        // send sms
        if(count($sms) > 0){
	        \Mail::send('emails.shifts.accepted_sms',compact('shift'), function ($message) use ($sms) {
	            $message->to($sms)->subject('Shift filled!');
	        }); 
        }  
        /* Scheduling manager and admin for that unit - after a shift has been "accepted"on the admin or scheduling manager dashboard for that particular employee, ONLY that  manager user that accepted the shift should get an email notification that says: 
"Here's a reminder. You have accepted the shift for_______________ (job title),  _________________(Employee first name and last name), on ________ (date DD/MM/YY ) at _______________(time HH:MM AM/PM) . 

This is important so that the manager can remember who they accepted the shift for, since there is currently no where to see that.
https://3.basecamp.com/3469875/buckets/1177669/todos/603214227
	*/
       	$manager = Auth::user();
        // send cc email to manager
        if($manager->email && $manager->email != ""){
	        \Mail::send('emails.shifts.cctomanager',compact('shift','manager','user'), function ($message) use ($manager) {
	            $message->to($manager->email)->subject('Here\'s a reminder!');
	        }); 
        }  
        
         if($manager->carrier && $manager->carrier != ""){
	        \Mail::send('emails.shifts.cctomanager_sms',compact('shift','manager','user'), function ($message) use ($manager) {
	            $message->to($manager->mobile.$manager->carrier)->subject('Here\'s a reminder!');
	        }); 
        } 
            
    }
}
