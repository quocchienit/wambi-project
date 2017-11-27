<?php

namespace App\Providers;

use App\CodeMaster;
use Illuminate\Support\ServiceProvider;
use App\Shift;
use App\Award;
use App\Survey;
use App\Employee;
use Carbon\Carbon;
use App\ShortURL;
class AppServiceProvider extends ServiceProvider
{
    //function shortenUrl()
    //{       
    //    $longUrl = app('url')->to('employee',null);
    //    //dd($longUrl);
    //    $apiKey ='AIzaSyAhX3uggdKI9SydZcHLdU96KNRIFam6g5o';
    //    $postData = array('longUrl' => $longUrl, 'key' => $apiKey);
    //    $jsonData = json_encode($postData);
    //    $curlObj = curl_init();
    //    curl_setopt($curlObj, CURLOPT_URL, 'https://www.googleapis.com/urlshortener/v1/url?key='.$apiKey);
    //    curl_setopt($curlObj, CURLOPT_RETURNTRANSFER, 1);
    //    curl_setopt($curlObj, CURLOPT_SSL_VERIFYPEER, 0);
    //    curl_setopt($curlObj, CURLOPT_HEADER, 0);
    //    curl_setopt($curlObj, CURLOPT_HTTPHEADER, array('Content-type:application/json'));
    //    curl_setopt($curlObj, CURLOPT_POST, 1);
    //    curl_setopt($curlObj, CURLOPT_POSTFIELDS, $jsonData);
    //    $response = curl_exec($curlObj);
//
    //    // Change the response json string to object
    //    $json = json_decode($response);
    //    curl_close($curlObj);   
    //    //dd($json);
    //    if(isset($json->error) && count($json->error) > 0)
    //        return $longUrl;
    //   return $json->id;
    //}
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
          \View::composers([
        'App\Composers\ShiftTime'  => ['emails.shifts.created','emails.shifts.created_sms'],
        'App\Composers\JobTitle'  => ['emails.awards.created','emails.shifts.created','emails.awards.created_sms','emails.shifts.created_sms'],
        'App\Composers\Peck'  => ['emails.shifts.created','emails.shifts.created_sms'],
        'App\Composers\Unit'  => ['emails.awards.created','emails.shifts.created','emails.awards.created_sms','emails.shifts.created_sms'],
        'App\Composers\Discipline'  => ['emails.awards.created','emails.awards.created_sms'],
        'App\Composers\Period'  => ['emails.awards.created','emails.awards.created_sms'],
        ]); 
        Employee::created(function($employee){
            //https://3.basecamp.com/3469875/buckets/1177669/todos/487812058
            return;
            $system_start_date = config('system.start');
            if($employee->hiredate != ""){
                $hiredate = Carbon::createFromFormat("m/d/Y",$employee->hiredate);
            
                $today = Carbon::today();
                $tenureyear = $today->year - $hiredate->year - ($today->format("m-d")<$hiredate->format("m-d"));
                $pecks = 500;

                for($i = 0;$i<$tenureyear;$i++){
                    if($system_start_date < $today->format("Y-m-d")){
                        if($i < 5){
                            $pecks = 750;
                        }else{
                            $pecks = 1000;
                        }
                    }
                    $employee->pecks += $pecks;
                }                
            }else{
                $employee->pecks += 750;
            }
            $employee->save();              
        });
        Shift::created(function($shift){
            /* notify available shift for employees */
            Shift::notify_available($shift, $shift->shift_unit,$shift->shift_job_title);
            /* send email notification */
            //https://3.basecamp.com/3469875/buckets/1177669/todos/617985750#__recording_621848850
            $data = \DB::table('employee_master')
                // ->where('job',$shift->shift_job_title)
                ->select(\DB::raw("carrier, email,concat(mobile,carrier) sms"))
                ->whereRaw("units like '%\"$shift->shift_unit\"%'")
                ->whereRaw("disciplines like '%\"$shift->shift_discipline\"%'")
                ->where('job',$shift->shift_job_title)
                ->where('etid',2)
                ->get();
            $emails = [];
            $mobiles =[];
            
            foreach ($data as $key => $value) {
                if($value->email != '')$emails[] = $value->email;
                if($value->carrier != '')$mobiles[] = $value->sms;
            }
            //dd($emails);
            $link = ShortURL::shortenUrl();
            // send email
            if(count($emails) > 0){
	            \Mail::send('emails.shifts.created',compact('shift','link'), function ($message) use ($emails) {
	                $message->from('shifts@wambi.org');
	                $message->to($emails)->subject('Available Shift!');
	            }); 
			}
            // send sms   
            if(count($mobiles) > 0){        
	            \Mail::send('emails.shifts.created_sms',compact('shift','link'), function ($message) use ($mobiles) {
	                $message->from('shifts@wambi.org');
	                $message->to($mobiles)->subject('Available Shift!');
	            }); 
            }
        });
        Award::created(function($award){
            if(\Auth::user()->type()=='admin'){
                $unit_id = \Auth::user()->unit_id();
                $data = \DB::table('employee_master')
                        ->select(\DB::raw("units, carrier, email,concat(mobile,carrier) sms"))
                        ->whereRaw("units like '%$unit_id%'")
                        ->where('etid',4)
                        ->distinct()
                        ->get();
                $emails = [];
                $mobiles =[];
                //dd($data);
                foreach ($data as $key => $value) {
                    if($value->email != '')$emails[] = $value->email;
                    if($value->carrier != '')$mobiles[] = $value->sms;
                }    
                $user = $award->user;
                $link = ShortURL::shortenUrl();
                //\Mail::send('emails.awards.created',compact('award','user','link'), function ($message) use ($emails) {
                //    $message->to($emails)->subject('Award Request');
                //});         

                // send sms
                //dd($mobiles);
                 if(count($emails) > 0){
                     $unit = CodeMaster::where('type', 'unit')->where('key', $unit_id)->first();
	                \Mail::send('emails.awards.created',compact('award','user','link', 'unit'), function ($message) use ($emails) {
	                    $message->to($emails)->subject('Award Request');
	                });
                }
                
                if(count($mobiles) > 0){  
	                \Mail::send('emails.awards.created_sms',compact('award','user','link'), function ($message) use ($mobiles) {
	                    $message->to($mobiles)->subject('Award Request');
	                });
                }
            }/*else if(\Auth::user()->type()=='super-admin' || \Auth::user()->type()=='super-executive'){
                $data = Employee::where('id', $award->owner)->first();

                if($data->email != '')$emails = $data->email;
                if($data->carrier != '')$mobiles = $data->mobile.$data->carrier;

                $user = $award->user;
                $link = ShortURL::shortenUrl();
                // send sms
                if(isset($emails)){
                    $unit = CodeMaster::where('type', 'unit')->where('key', $data->unit_id())->first();
                    \Mail::send('emails.awards.created',compact('award','user','link', 'unit'), function ($message) use ($emails) {
                        $message->to($emails)->subject('Award Request');
                    });
                }

                if(isset($mobiles)){
                    \Mail::send('emails.awards.created_sms',compact('award','user','link'), function ($message) use ($mobiles) {
                        $message->to($mobiles)->subject('Award Request');
                    });
                }
            }*/
        });
        Survey::created(function($survey){
            if(\Cache::get('function_ambassador') != 1){
                $start_time = Carbon::now()->subMinutes(30);
                $qty = Survey::where('created_at','>=',$start_time)->where('employee_id',$survey->employee_id)->count();
                if($qty > 2){
                    $data = \DB::table('employee_master')->select(\DB::raw("carrier, email,concat(mobile,carrier) sms"))
                    		->where('etid',4)->get();
                    $emails = [];
                    $mobiles =[];
                    foreach ($data as $key => $value) {
                    	if($value->email != '')$emails[] = $value->email;                
                    	if($value->carrier != '')$mobiles[] = $value->sms;
                    }    
                    $employee = $survey->employee->name();
                    $patient = $survey->patient->name();
                    // send email
                    if(count($emails) > 0){
	                    \Mail::send('emails.surveys.multiple_survey',compact('patient','employee','qty'), function ($message) use ($emails) {
	                        $message->to($emails)->subject('Alert');
	                    }); 
                    }
                    // send email
                    if(count($mobiles) > 0){
	                    \Mail::send('emails.surveys.multiple_survey_sms',compact('patient','employee','qty'), function ($message) use ($mobiles) {
	                        $message->to($mobiles)->subject('Alert');
	                    }); 
                    }
                }
            }
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
