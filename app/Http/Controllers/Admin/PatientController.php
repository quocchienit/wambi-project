<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\CodeMaster;
use App\Patient;
use Carbon\Carbon;
use Input;
use App\PatientFamily;
use App\Survey;
use App\CarriersOnline;

class PatientController extends Controller
{
    function __construct()
    {
         \View::composers([
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\Insurance'  => ['admin.*'],
            'App\Composers\Facility'  => ['admin.*'],
             'App\Composers\ShowAllUnits'  => ['admin.*'],
        ]);
    }

    public function getIndex()
    {         
    	/*   
        $fac_id = \Session::get('current_fac');
        $unit = \Session::get('current_unit');    
        
        //$patients  = \DB::select("select p.*,sum(a.qid) total_survey from patient_details p 
         //                       left join answers a on a.pid = p.pid group by p.pid");
         
        if((\Auth::user()->type() == 'super-executive' and \Cache::get('function_amada') !=1) || $unit == 0){
            $patients = Patient::where('type','patient')->where('fac_id',$fac_id)->with('surveys')->get();
        }else{
            
            $patients = Patient::where('type','patient')->where('fac_id',$fac_id)->where('lid',$unit)->with('surveys')->get();
        }
        */
        $total_surveys = 0;
        $today_surveys = 0;
        if(\Auth::user()->type() == 'patient-manager')
        {
            $total_surveys_query = Survey::whereIn('unit_id',\Auth::user()->units);
            $total_surveys = $total_surveys_query->count();            
            $today = Carbon::now()->format('Y-m-d');
            $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
        }
        $patients = Patient::list_patient();

    	return view('admin.patient.index',compact('patients','total_surveys','today_surveys'));
    }
    public function edit($patient = null)
    {
        $carriers = \DB::table('carriers')->select('id','name','address')->get();
        if($patient !=null){
            $member_family  = PatientFamily::where('pid','=',$patient->pid)->get();
        }

        return view('admin.patient.edit',compact('patient','carriers','member_family'));
    }
    public function save(Request $request,$patient = null)
    {
        $count = $request->count_members;        
        if($patient == null){
            $patient = new Patient;            
            //$patient->ssn = rand(1000,9999);     
            //$patient->pinno = rand(1000,9999);
			 $ssn = rand(100000,999999);
            $countssn = Patient::where('ssn',$ssn)->get();
            while ( $countssn->count() > 0) {
                $countssn = Patient::where('ssn',$ssn)->get();
                $ssn = rand(100000,999999);
            }        
            $patient->ssn = $ssn;
            $patient->pinno = rand(100000,999999);
        }
        $patient->lid = Input::get('lid');
        // addition fields
        if(!\Schema::hasColumn('patient_details','email')){
            \Schema::table('patient_details',function($table){
                $table->string('email',100);
            });
        }
        if(!\Schema::hasColumn('patient_details','mobile')){
            \Schema::table('patient_details',function($table){
                $table->string('mobile',100);
            });
        }
        // end addition fields
        $patient->email = $request->email;
        if($patient->mobile != $request->mobile){
            $patient->patient_carrier = CarriersOnline::carrier($request->mobile);
        }
        $patient->mobile = $request->mobile;
        $patient->fname = Input::get('fname');
        $patient->lname = Input::get('lname');
        $patient->insurance_id = Input::get('insurance');
        
        if(Input::has('dob')) $patient->dob = Input::get('dob');
        if(Input::has('admitteddate')) $patient->admitteddate = Input::get('admitteddate');
        if(Input::has('release')) $patient->release = Input::get('release');
        
        if(\Input::get('fac_id'))
        {
        	$patient->fac_id = \Input::get('fac_id');
        }
        else
        {
        	$patient->fac_id = \Auth::user()->fac_id;
        }
        $patient->type = 'patient';
        $patient->save();
        
        $arr = [];
        $patient_family = null;
        
        for ($i=1; $i <= $count; $i++) { 
            $patient_family = new PatientFamily();
            $patient_family->pid = $patient->pid;
            $patient_family->fullname = $request['fullname'.$i];
            $patient_family->numberphone = $request['numberphone'.$i];
            $patient_family->email = $request['email'.$i];
            $check = PatientFamily::where('pid','=',$patient->pid)
                    ->where('numberphone',$patient_family->numberphone)->get();
            if($check->count() == 0)
            {
                $patient_family->carrier = CarriersOnline::carrier($patient_family->numberphone);    
                //$patient_family->carrier = $request['fcarrier'.$i];    
            }            
            //$patient_family->save();
            $arr[] =  $patient_family;
        }

        // Xoa du lieu family insert lai
        PatientFamily::where('pid','=',$patient->pid)->delete();
        foreach ($arr as $key => $value) {
            $value->save();
        }

        return redirect()->route('admin::patient::index');
    }
    public function delete($patient)
    {
        $patient->delete();
        PatientFamily::where('pid','=',$patient->pid)->delete();
        return response()->json(['success'=>true,'message'=>'Patient deleted successfully.']);
    }

    public function sendAccessCode($patient)
    {        
        $code = Patient::generate($patient->pid);
        $patient->code = $code;
        $patient->code_date = Carbon::now();
        $patient->save();
        $email = [];
        $sms = [];
        // send access code patient
        if($patient->email != "" && !is_null($patient->email))
        {
            $email[] = $patient->email;
        }
        if(($patient->mobile != "" && $patient->patient_carrier != "") && (!is_null($patient->mobile) && !is_null($patient->patient_carrier))){
            $sms[] = $patient->mobile.$patient->patient_carrier;
        }
        if(count($email) > 0){
	        \Mail::send('emails.out-patient.tooutpatient',compact('code'), function ($message) use ($email) {
	                $message->to($email)->subject('Access code!');
	            });   
		}
		if(count($sms) > 0){
	        \Mail::send('emails.out-patient.tooutpatient_sms',compact('code'), function ($message) use ($sms) {
	                $message->to($sms)->subject('Access code!');
	            });   
		}
        // Xu li member family
        $member_family = PatientFamily::where('pid','=',$patient->pid)->get();
        if($member_family->count() > 0){
            foreach ($member_family as $key) {
                $key->code = PatientFamily::generate_family($key->id);
                $key->date = Carbon::now();
                $key->save();
                if(($key->numberphone != "" && $key->carrier != "") && (!is_null($key->numberphone) && !is_null($key->carrier))){
                    \Mail::send('emails.out-patient.tooutpatient_sms',compact('code'), function ($message) use($key) {
                        $message->to([$key->numberphone.$key->carrier])->subject('Access code!');
                    });           
                }
            }
        }
        // Send number phone
        return response()->json(['success'=>true,'message'=>'Access code has send.']);        
    }

}
