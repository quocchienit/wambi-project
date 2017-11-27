<?php

namespace App\Listeners;

use App\Events\ShiftApprove;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use DB;
use App\CodeMaster;
use App\Employee;
use Carbon\Carbon;
use Auth;
use App\ConfigPeck;
class RedeemListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Handle the event.
     *
     * @param  ShiftApprove  $event
     * @return void
     */
    public function handle(\App\Events\Redeem $event)
    {
        $reward = $event->reward;
        $employee = Auth::user();
        $confirm_code = mt_rand(100000,999999);
        if($employee->email && $employee->email != "")
        {
	        \Mail::send('emails.rewards.to_employee',compact('employee','reward','confirm_code'), function ($message) use ($employee,$reward) {
	            $message->to([$employee->email])
	                ->subject('Reward!')
	                ->bcc('rewards@wambi.org','Wambi')
	                ->attach($reward->attachment())
	                ;
	        });
        }
        // send sms
        if($employee->carrier && $employee->carrier != "")
        {
	        \Mail::send('emails.rewards.to_employee_sms',compact('employee'), function ($message) use ($employee) {
	            $message->to([$employee->mobile.$employee->carrier])
	                ->subject('Reward!')
	                ->bcc('rewards@wambi.org','Wambi')
	                ;
	        });
		}
        \Mail::send('emails.rewards.to_wambi',compact('employee','reward','confirm_code'), function ($message) use ($employee,$reward) {
            $message->to('rewards@wambi.org')
                ->subject('Reward!')
                ->attach($reward->attachment())
                ;
        });

        // Check config follow
        $lsteid = ConfigPeck::whereIn('unit_id',$employee->units)->get();
        $emails = [];
        if($lsteid->count() > 0){
            foreach ($lsteid as $key) {
                $eid = Employee::whereIn('id',$lsteid[0]->eidredem)
                                ->where('email','<>','')
                                ->get();    
                foreach ($eid as $value) {
                	if($value->email != '')$emails[] = $value->email;
                }
            }
            if(count($emails) > 0){
                \Mail::send('emails.rewards.to_wambi_follow',compact('employee','reward'), function ($message) use ($emails,$employee,$reward) {
                    $message->to($emails)
                        ->subject('Wambi Reward Redemption Notification!');
                });                
            }            
        }
    }
}
