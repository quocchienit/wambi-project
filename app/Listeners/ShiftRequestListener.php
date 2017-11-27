<?php

namespace App\Listeners;

use App\Events\ShiftApprove;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use DB;
use App\CodeMaster;
use Carbon\Carbon;
use Auth;
use App\ShortURL;
use App\Employee;

class ShiftRequestListener
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
            ]);
    }

    /**
     * Handle the event.
     *
     * @param  ShiftApprove  $event
     * @return void
     */
    public function handle(\App\Events\ShiftRequest $event)
    {
    	$shift = $event->shift;
        $user = $shift->user;
        $emails = [];
        $mobiles = [];
        // get manager schedule of shift_unit
        $unit = $shift->shift_unit;
        $employee = Employee::where('etid','1')->whereRaw("units like '%\"$unit\"%'")->get();
        if($employee->count() > 0){
            foreach ($employee as $key) {
                if($key->email && $key->email != "")
                {
                    $emails[] = $key->email;
                }

                if($key->carrier && $key->carrier != "" && $key->mobile && $key->mobile != "")
                {
                    $mobiles[] = $key->mobile.$key->carrier;                
                }
            }
            
        }
        // send email to who cretated shift
        if($user->email && $user->email != "")
        {
            $emails[] = $user->email;        	
        }        	
        
        // send email
        if(count($emails) > 0){
            $employee = Auth::user();
            $link = ShortURL::shortenUrl();
            \Mail::send('emails.shifts.request',compact('employee','shift','shift_times','link'), function ($message) use ($user, $emails) {
                $message->to($emails)->subject('Shift Request!');
            });
        }

       if($user->carrier && $user->carrier != "")
        {
            $mobiles[] = $user->mobile.$user->carrier;
        	 
        }

        // send sms
        if(count($mobiles) > 0){
            $employee = Auth::user();
            $link = ShortURL::shortenUrl();
            \Mail::send('emails.shifts.request_sms',compact('employee','shift','shift_times','link'), function ($message) use ($user, $mobiles) {
                $message->to($mobiles)->subject('Shift Request!');
            });
        }
    }
}
