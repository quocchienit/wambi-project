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
use App\CarriersOnline;
use App\Survey;

class AmbassadorController extends Controller
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
        $fac_id = \Session::get('current_fac');
        $unit = \Session::get('current_unit');
        /*
        $patients  = \DB::select("select p.*,sum(a.qid) total_survey from patient_details p
                                left join answers a on a.pid = p.pid group by p.pid");
        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $unit == 0){
            $patients = Patient::where('type','ambassador')
                ->where('fac_id',$fac_id)->with('surveys')->get();
        }else{

            $patients = Patient::where('type','ambassador')
            ->where('fac_id',$fac_id)
            ->whereRaw("units like '%\"$unit\"%'")
            ->with('surveys')->get();
        }
        */
        $query = Patient::where('type','ambassador');
        if(\Auth::user()->type()=='super-executive' and $fac_id != 0 )
        {
        	$query  = $query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }

        if(\Auth::user()->type() !='super-executive' and $unit != 0 )
        {
        	$query  = $query->whereRaw("units like '%\"$unit\"%'");
        }
        $patients = $query->with('surveys')->get();

        $total_surveys = 0;
        $today_surveys = 0;
        if(\Auth::user()->type() == 'patient-manager')
        {
            $total_surveys_query = Survey::whereIn('unit_id',\Auth::user()->units);
            $total_surveys = $total_surveys_query->count();
            $today = Carbon::now()->format('Y-m-d');
            $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
        }
    	return view('admin.ambassador.index',compact('patients','total_surveys','today_surveys'));
    }
    public function edit($patient = null)
    {
        $carriers = \DB::table('carriers')->select('id','name','address')->get();

        return view('admin.ambassador.edit',compact('patient','carriers','member_family'));
    }
    public function save(Request $request,$patient = null)
    {
        $count = $request->count_members;
        $type ='patient';
        if($patient == null){
            $patient = new Patient;
            $rules = [
                'fname'=>'required|unique:patient_details,fname,'.$type.',type',
                'email'=>'unique:patient_details,email,'.$type.',type',
                'mobile'=>'unique:patient_details,mobile,'.$type.',type'
            ];
            $message = [
                'fname.required' => 'The Ambassador ID is required',
                'fname.unique' => 'The Ambassador ID has already been taken',
                'email.unique' => "The Ambassador's email has already been taken",
                'mobile.unique' => "The Ambassador's number phone has already been taken",
            ];

            $validator = \Validator::make($request->all(),$rules,$message);
            if($validator->fails()){
                return redirect()->back()->withErrors($validator)->withInput();
            }
            // $this->validate($request,[
            //     'fname'=>'required|unique:patient_details,fname,$type,type',
            //     'email'=>'unique:patient_details,email,$type,type',
            //     'mobile'=>'unique:patient_details,mobile,$type,type'
            // ]);
            $ssn = rand(100000,999999);
            $countssn = Patient::where('ssn',$ssn)->get();
            while ( $countssn->count() > 0) {
                $countssn = Patient::where('ssn',$ssn)->get();
                $ssn = rand(100000,999999);
            }
            $patient->ssn = $ssn;
            $patient->pinno = rand(100000,999999);
        }

        if(\Input::get('units')[0]=='all'){
            $units_item = \Input::get('unit_array');
            $units_array = explode(',', $units_item);
            $patient->units = $units_array;
        }else{
            $patient->units = Input::get('units');
        }
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

        $mobile = $request->mobile;
        $mobile = str_replace('(','',$mobile);
        $mobile = str_replace(')','',$mobile);
        $mobile = str_replace('-','',$mobile);
        $mobile = str_replace('+','',$mobile);
        $mobile = str_replace(' ','',$mobile);
        // end addition fields

        $patient->email = $request->email;
        if($patient->mobile != $mobile || !$patient->patient_carrier){
            $patient->patient_carrier = CarriersOnline::carrier($mobile);
        }
        $patient->mobile = $mobile;
        $patient->fname = Input::get('fname');
        $patient->lname = Input::get('lname');
        $patient->type = 'ambassador';

        if(\Input::get('fac_id'))
        {
        	$patient->fac_id = \Input::get('fac_id');
        }
        else
        {
        	$patient->fac_id = \Auth::user()->fac_id;
        }
        $patient->save();
        return redirect()->route('admin::ambassador::index');
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
        $emails = [];
        $sms = [];
        // send access code patient
        if($patient->email != "" && !is_null($patient->email))
        {
            $emails[] = $patient->email;
        }
        if(($patient->mobile != "" && $patient->patient_carrier != "")
            && (!is_null($patient->mobile) && !is_null($patient->patient_carrier))){
            $sms[] = $patient->mobile.$patient->patient_carrier;
        }
        if(count($emails) > 0){
	        \Mail::send('emails.out-patient.tooutpatient',compact('code'), function ($message) use ($emails) {
	                $message->to($emails)->subject('Access code!');
	            });
        }
        if(count($sms) > 0){
	        \Mail::send('emails.out-patient.tooutpatient_sms',compact('code'), function ($message) use ($sms) {
	                $message->to($sms)->subject('Access code!');
	            });
        }

        // Send number phone
        return response()->json(['success'=>true,'message'=>'Access code has send.']);
    }

}
