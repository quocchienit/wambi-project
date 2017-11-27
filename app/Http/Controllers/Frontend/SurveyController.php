<?php

namespace App\Http\Controllers\Frontend;

use App\Setting;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Patient;
use App\Answer;
use App\Survey;
use App\Employee;
use App\Question;
use App\CodeMaster;
use App\CustomerIndex;
use App\Comments;
use App\ExitSurvey;
use App\QuestionExit;
use App\ConfigPeck;
use App\PatientFamily;
use App\Http\Controllers\Admin;
use Session, Response;

class SurveyController extends Controller
{
     function __construct()
    {
         \View::composers([
            'App\Composers\Discipline'  => ['frontend.*'],
        ]);
         $this->middleware('locale');
    }
    public function getIndex()
    {
        $qa = \App\QA::where('UType','like','%7%')->get();
    	return view('frontend.index',compact('qa'));
    }
    public function getLogin()
    {
        if(\Session::has('patient'))
            return redirect('survey/caregivers');
        return view('frontend.login');
    }
    public function getRecover()
    {
    	return view('frontend.recover');
    }
    public function postLogin(Request $request)
    {
    	if($patient = Patient::validate($request->username,$request->password)){
            \Session::set('patient',$patient);
    		\Session::set('user_type',$request->type);
            //dd(\Session::get('exit_survey'));
            if(\Session::get('exit_survey') == 1)
                return back();
            else
    		  return redirect('survey/caregivers');
    	}
    	return back();
    }
    public function getCaregivers()
    {
        $patient = \Session::get('patient');
        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit');
//    	$employees = Employee::where('fac_id',$patient->fac_id)
//                        //->where('units', 'like', '%'.$unit.'%')
//            			->whereRaw("units like '%\"$unit\"%'")
//        				->where('etid','=',2)
//        				->orderByRaw("concat(firstname,lastname)")
//        				->get();

    	return view('frontend.caregivers',compact('qa'));
    }
    public function survey($employee)
    {
        \Session::put('employee',$employee);
    	$unit = \Session::get('unit');
    	$answers = CodeMaster::get_code_master('pecks_for_answer');
    	$questions = Question::where('fac_id',$employee->fac_id)
                        ->where(['unit_id'=>$unit])
            			->where('enabled','=',1)
            			->orderBy('orderby', 'asc')
        				->get();

        $qa = \App\QA::where('UType','like','%7%')->get();
        $patient = \Session::get('patient');
        $insurance = CodeMaster::where('type','insurance')->get();
        $isSend = CodeMaster::where('type','=','unit')
                                ->where('key','=', $unit)->get();
        //dd($isSend);
        if($isSend->count() > 0 && $isSend[0]->notes == '1')
        {
            $isSend = 1;
        }else{
            $isSend = 0;
        }
        $enable_insurance_payor = 0;
        /*
        if(\Session::get('user_type') == 'ambassador'){
            $enable_insurance_payor = 1;
        }
        */
        $qids ="";
        foreach($questions as $q)
        {
        	$qids=$qids.$q->qid.';';
        }
        $qids =  substr($qids,0,-1);
        //dd($qids);
    	return view('frontend.survey',compact('employee','questions','answers','qa','isSend','insurance','enable_insurance_payor','qids'));
    }
    public function postSearch(Request $request)
    {
        //dd($request);
        $patient = \Session::get('patient');
        $unit = \Session::get('unit');
    	$results = Employee::searchSurvey($request->q, $unit, $patient);
    	$employees = $results['items'];
        //dd($employees);
    	return view('frontend._employee',compact('employees'))->render();
    }
    public function save($employee,Request $request)
    {
    	// duplicate new function.
    	/*
        $data_request = $request->answers;
        $i = 0;
        foreach ($data_request as $key=>$item){
            if($item == 'great'){
                $i++;
            }
        }
        if($i == 5){
            if($employee->email){
                $email = $employee->email;
                \Mail::send('emails.news.reviews', compact('data_request'), function ($message) use ($email) {
                    $message->from('news@wambi.org');
                    $message->to($email)->subject("You have received a perfect score!");
                });
            }
            if($employee->mobile && $employee->carrier){
                $mobile = $employee->mobile.$employee->carrier;
                \Mail::send('emails.news.reviews_sms', compact('data_request'), function ($message) use ($mobile) {
                    $message->from('news@wambi.org');
                    $message->to($mobile)->subject("You have received a perfect score");
                });
            }
        }
		*/
		
        $arrquestion_poor = null;
        // Luu thong tin Employee cho comment
        \Session::set('employee_comment',$employee);
        $patient = \Session::get('patient');
        $survey = new Survey;
        $survey->created_at = Carbon::now();
        $survey->employee_id = $employee->id;
        $survey->type = \Session::get('user_type');
        $survey->patient_id = $patient->pid;
        $survey->unit_id = \Session::get('unit');
        $survey->discipline = $employee->disciplines[0];
        $survey->fac_id = $patient->fac_id;

        if(\Session::get('user_type') == 'ambassador'){
            $survey->insurance_id = $request->insurance_id;
        }else{
            $survey->insurance_id = $patient->insurance_id;
        }

        if(config("customerindex.out_patient") == \Cache::get('current_index')){
            $survey->code = \Session::get('code');
        }
        //$survey->save();
        $answers = $request->answers;
        $total_rate = 0;

        // Config peck for survey
        $config_peck = ConfigPeck::
                            where('unit_id','=',$survey->unit_id)
                            ->get();
        $config_peck = $config_peck[0];
        $i = 0;
        $qids = explode(";", $request->qids);
        //dd( $request->qids);
        foreach ($answers as $key => $value) {
            $q = 'q'.($i + 1);

            $code = CodeMaster::where('type','=','pecks_for_answer')->where('key','=',$value)->first();
            if(isset($code))
            	$survey[$q] = $code->notes;
            $answer = new Answer;
            //$answer->qid = $key+1;
            $answer->qid = $qids[$i];
            $i++;
            $answer->peck = $config_peck[$value];
            $answer->answer_id = $survey[$q];
            $total_rate += $answer->answer_id;
            $answer->date = Carbon::now();
            $answer->eid = $employee->id;
            $answer->etid = $employee->etid;
            $answer->pid = $patient->pid;
            $answer->user_type = \Session::get('user_type');
            $answer->unit_id =  \Session::get('unit');
            $answer->catid = $employee->disciplines[0];
            $answer->survey_id =  $survey->id;
            $survey->total += $answer->peck;
            $answer->fac_id = $patient->fac_id;
            $answer->save();
            //echo $answer->answer_id;
            // store value of poor then this system will send email with alerts
            if($answer->answer_id == 1){
                $arrquestion_poor[] = $i;
            }
        }
        $survey->q_count = $i;
        $survey->avg = $survey->total/count($answers);
        $survey->avg_rating = ($total_rate/(count($answers) * 5)) * 100;
        if($survey->save()){
            /* notify employee */
            $employee = $survey->employee;
            $employee->pecks+=$survey->total;
            $employee->save();
            $employee->notifications()->attach(3,['content'=>'{\"peck\":$survey->total,\"survey_id\":$survey->id}','created_at'=>Carbon::now()]);
            // fix bug https://3.basecamp.com/3469875/buckets/1177669/todos/507344438
            $peck = config("survey.fill_out_peck");
            $unit=  $survey->unit_id;
            // https://3.basecamp.com/3469875/buckets/1177669/todos/507344438
            // Admin will receive 1 peck per survey NOT 15 (which is the value it is at now)
            //$sql = "update employee_master set pecks = pecks + 1 where etid in (3,5) and units like '%\"$unit\"%' and fac_id = '$employee->fac_id'";
            // only admin received 1 peck https://3.basecamp.com/3469875/buckets/1177669/todos/599531899
            $sql = "update employee_master set pecks = pecks + 1 where etid in (3) and units like '%\"$unit\"%' and fac_id = '$employee->fac_id'";
            //dd($sql);
            \DB::update($sql );
        }

        if(count($arrquestion_poor) > 0){
            $this->service_recovery_sendmail(0, $arrquestion_poor, $employee);
        }
       	// SERVICE RECOGNITION: Send mail follow up a 100% scores survey result
       	if($survey->avg_rating = 100)
       		$this->service_recognition_sendmail($employee);
        
    	return response()->json([$request->answers]);
    }
    public function getComplete($value='')
    {

        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit');
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $setting = Setting::first();
//        $tags = file_get_contents ($setting->url.'/api/tag');
//        if($tags){
//            $speciality = json_decode($tags)->tags;
//        }
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $employee = \Session::get('employee');

        if(config("customerindex.out_patient") == \Cache::get('current_index')){
            $isAmbassador = 0;
            if(\Session::get('user_type') == 'ambassador'){
                $isAmbassador = 1;
            }
            return view('frontend.out-patient.thanks2')->with([
                'qa'    => $qa,
                'isAmbassador'  => $isAmbassador,
                'unit_data'  => (isset($unit_data)?$unit_data:''),
//                'speciality' => (isset($speciality)?$speciality:''),
                'employee'  => (isset($employee)?$employee:''),
                'page'  => 'comment'
            ]);
        }
        else
            return view('frontend.thank',compact('qa'));
    }
    public function getExit()
    {
        \Session::forget('patient');
        \Session::forget('type');
    }
    public function exit_survey()
    {
        if(!\Session::has('patient'))
        {
            \Session::set('exit_survey', 1);
            return view('frontend.login');
        }

        $patient = \Session::get('patient');
        $exit_type = CodeMaster::where('type','=','exit_survey')->get();
        $unit = \Session::get('unit');
        $data = [];
        foreach ($exit_type as $element) {
            // question
            $question = QuestionExit::where('fac_id',$patient->fac_id)
                            ->where('unit_id','=',$unit)
				            ->where('type','=',$element->key)
				            ->where('enabled','=','1')
				            ->orderBy('orderby', 'asc')
				            ->get();
            if($question->count() > 0){
                $data[$element->key - 1]['name'] = $element->notes;
                $data[$element->key - 1]['header'] = $element->value;
                foreach ($question as $q) {
                    $data[$element->key - 1]['questions'][] = $q->question;
                }
            }
        }

        $qa = \App\QA::where('UType','like','%7%')->get();
        $insurance = CodeMaster::where('type','insurance')->get();
        $enable_insurance_payor = 0;
        /*
        if(\Session::get('user_type') == 'ambassador'){
            $enable_insurance_payor = 1;
        }
        */
        return view('frontend.exit-survey',compact('data','qa','enable_insurance_payor','insurance'));
    }
    public function save_exit_survey(Request $request)
    {
        //dd($request);
        $unit = \Session::get('unit');
        $arrquestion_poor = null;
        $patient = \Session::get('patient');
        $type = \Session::get('user_type');
        $exit_survey = new ExitSurvey();
        $exit_survey->pid = $patient->pid;
        for ($i=0; $i < 30; $i++) {
            # code...
            $q = 'q'.($i + 1);
            $value = $request[$q];
             if($value != null)
            	$exit_survey->qcount = $i + 1;
            $exit_survey[$q] = $value ? $value: 0 ;

            if($value == 1){
                $arrquestion_poor[] = $i + 1;
            }
        }
		//dd($request);
        //$exit_survey->qcount = $request->request->count() - 1;

        $exit_survey->fac_id = $patient->fac_id;
        $exit_survey->type = $type;
        $exit_survey->date = Carbon::now();
        $exit_survey->unit_id = $unit;
        if(\Session::get('user_type') == 'ambassador'){
            $exit_survey->insurance_id = $request->insurance;
        }else{
            $exit_survey->insurance_id = $patient->insurance_id;
        }
        $exit_survey->save();
        //return redirect('/survey/complete');
        $qa = \App\QA::where('UType','like','%7%')->get();
        $title = "title_experience";
        $patient = \Session::get('patient');
        $isSend = CodeMaster::where('type','=','unit')
                                ->where('key','=', $unit)->get();
        if(count($arrquestion_poor) > 0){
            $this->service_recovery_sendmail(1, $arrquestion_poor);
        }
        if($isSend->count() > 0 && $isSend[0]->notes == '1')
        {
            return view('frontend.comment',compact('qa','title'));
        }else{
            if(config("customerindex.out_patient") == \Cache::get('current_index')){
                $isAmbassador = 0;
                if(\Session::get('user_type') == 'ambassador'){
                    $isAmbassador = 1;
                }
                return view('frontend.out-patient.thanks',compact('qa','isAmbassador'));
            }
            else
                return view('frontend.thank',compact('qa'));
        }

    }
    public function getLogout()
    {
        \Session::forget('patient');
        \Session::forget('user_type');
        \Session::forget('exit_survey');
        \Session::forget('code');
        return redirect('/');
    }

    public function getIndexOutPatient()
    {
        if(\Session::has('patient') && \Session::has('code'))
        {
            return redirect('survey');
        }
        else
        {
            $qa = \App\QA::where('UType','like','%7%')->get();
            return view('frontend.out-patient.index',compact('qa'));
        }
    }

	public function getPhoneNumberOrEmail()
    {
        $qa = \App\QA::where('UType','like','%7%')->get();
        return view('frontend.out-patient.phonenumberoremail',compact('qa'));
    }

     public function postPhoneNumberOrEmail(Request $request)
    {
        $arr_value = array(' ', '(' ,')','-');
        $numberphone = str_replace($arr_value, "", $request->numberphone);
        $email_request = $request->email;
        if($numberphone == "" && $email_request == "")
        {
        	return response()->json(['success'=>false,'message'=>'Please enter your Phone number or Email!']);
        }
        if($patient = Patient::checkPhoneAndEmail($numberphone, $email_request)){

            \Session::set('patient',$patient);
            \Session::set('numberphone',$numberphone);
            \Session::set('email',$email_request);
            \Session::set('user_type',$patient->type);
            $qa = \App\QA::where('UType','like','%7%')->get();

            if($patient->type == 'ambassador'){
                // Send code
                $code = Patient::generate($patient->pid);
                $patient->code = $code;
                $patient->code_date = Carbon::now();
                $patient->save();
                $email = [];
                $sms = [];
                // send access code patient
                if($patient->email != "" && !is_null($patient->email) && $email_request != "")
                {
                    $email[] = $patient->email;
                }
                if(($patient->mobile != "" && $patient->patient_carrier != "")
                    && (!is_null($patient->mobile)
                    && !is_null($patient->patient_carrier))
                     && $numberphone  != ""){
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
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>true]);
            }else{
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>false]);
            }

            //dd($numberphone);
           // return view('frontend.out-patient.selectunit',compact('qa'));
        }
        if(\Cache::get('function_amada') == 1 )
        	return response()->json(['success'=>false,'message'=>'Looks like your phone number is not authorized in our system.
        													Speak with the office to add your number or email info@wambi.org']);
        else
        	return response()->json(['success'=>false,'message'=>'Looks like your phone number is not authorized in our system.
        													Speak with your case manager to add your number or email info@wambi.org']);
    }

	public function getSelectUnit()
    {
    	$numberphone = \Session::get('numberphone');
    	$email = \Session::get('email');
    	$patient = \Session::get('patient');
    		//dd($numberphone);
    			//dd($email);
        if($patient->type == 'ambassador'){
            $units = CodeMaster::where('type','unit')
                                ->whereIn('key',$patient->units)
                                ->select('refkey as fac', 'key as fname','value')
                                ->get();
        }else{
            if($numberphone !="")
            {
                $units = Patient::join('code_master','key','=','lid')
                                ->where('mobile',$numberphone)
                                ->where('code_master.type','unit')
                                ->select('code_master.value','code_master.key as fname','code_master.refkey as fac')->distinct()->get();
            }
            else
            {
                $units = Patient::join('code_master','key','=','lid')
                                ->where('email',$email)
                                ->where('code_master.type','unit')
                                ->select('code_master.value','code_master.key as fname','code_master.refkey as fac')->distinct()->get();
            }
        }

        $qa = \App\QA::where('UType','like','%7%')->get();
        return view('frontend.out-patient.selectunit',compact('qa','units'));
    }

    public function postSelectUnit(Request $request)
    {
        $patient = \Session::get('patient');
        //return response()->json(['success'=>false,'message'=>$patient->type == 'ambassador']);
        if($patient->type == "ambassador"){
        	$unit = $request->unit;

            if($unit == ''){
                return response()->json(['success'=>false,'message'=>'Please select Unit!']);
            }else{
                \Session::set('unit',$unit);
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>true]);
            }
        }else{
         	$unit = $request->unit;
            //dd($unit);
        	//$patient = \Session::get('patient');

            //dd($numberphone);
            if($unit <> ''){
            	//dd($request->unit);
	        	$numberphone = \Session::get('numberphone');
	        	$email_request = \Session::get('email');
            	\Session::set('unit',$unit);
                // Lay thong tin patient theo unit vua chon ( id unit ~ patient_id)
                 if($numberphone !="")
	            {
	                $patient = Patient::where('lid',$unit)
                					->where('mobile',$numberphone)
                					->get();
	            }
	            else
	            {
	                $patient = Patient::where('lid',$unit)
                					->where('email',$email_request)
                					->get();
	            }

                //dd($patient);
                if($patient->count() > 0){
                    $patient = $patient[0];
                }else{
                    $patient = new Patient();
                }
                \Session::set('patient',$patient);
                \Session::set('numberphone',$numberphone);
                \Session::set('email',$email_request);
                \Session::set('user_type',$patient->type);

                $code = Patient::generate($patient->pid);
    	        $patient->code = $code;
    	        $patient->code_date = Carbon::now();
    	        $patient->save();
    	        $email = [];
    	        $sms = [];
    	        // send access code patient
    	        if($patient->email != "" && !is_null($patient->email) && $email_request != "")
    	        {
    	            $email[] = $patient->email;
    	        }
    	        if(($patient->mobile != "" && $patient->patient_carrier != "")
    	        	&& (!is_null($patient->mobile)
    	        	&& !is_null($patient->patient_carrier))
    	        	 && $numberphone  != ""){
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
                $qa = \App\QA::where('UType','like','%7%')->get();
                //dd(\Session::has('patient'));
                //return view('frontend.out-patient.code',compact('qa'));
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>false]);
            }
            return response()->json(['success'=>false,'message'=>'Please select Unit!']);
        }
    }

    public function getCode()
    {
        $qa = \App\QA::where('UType','like','%7%')->get();
        //Patient::validateoutpatient('5661');
        return view('frontend.out-patient.code',compact('qa'));
    }

    public function postCode(Request $request)
    {
        $code = $request->digit0.$request->digit1.$request->digit2.$request->digit3;
        //dd(\Session::get('unit'));
        // Code ambassador
        if($patient = Patient::validateoutpatient($code)){
            \Session::set('patient',$patient);
            \Session::set('code',$code);
            \Session::set('user_type',$patient->type);
            //dd($patient);
            $qa = \App\QA::where('UType','like','%7%')->get();
            //dd(\Session::has('patient'));
            //return view('frontend.index',compact('qa'));
            if($patient->type == 'ambassador')
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>true]);
            else
                return response()->json(['success'=>true,'message'=>'Success.','ambassador'=>false]);
        }
        return response()->json(['success'=>false,'message'=>'Code missmatch. Please check again!']);
    }

    public function comments()
    {
       	$qa = \App\QA::where('UType','like','%7%')->get();
        $title = "title_caregiver";
        $unit = \Session::get('unit');
        $setting = Setting::first();
//        $tags = file_get_contents($setting->url.'/api/tag');
//        if($tags){
//            $speciality = json_decode($tags)->tags;
//        }
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $employee = \Session::get('employee');
        return view('frontend.comment2')->with([
            'qa'    => $qa,
            'title' => $title,
            'unit_data'  => (isset($unit_data)?$unit_data:''),
//            'speciality' => (isset($speciality)?$speciality:''),
            'employee'  => (isset($employee)?$employee:''),
            'page'  => 'comment'
        ]);
    }

    public function postComment(Request $request)
    {
        //dd($request);
        if($request->comment == ""){
            \Session::forget('employee_comment');
            return redirect('/survey/complete');
        }
        $employee_cmt = \Session::get('employee_comment');
        $patient = \Session::get('patient');
        $unit = \Session::get('unit');
        $comments = new Comments();
        //dd($request->contact);
        $comments->cmt_description = $request->comment;
        $comments->date = Carbon::now();
        $comments->employee_id = $employee_cmt != null ? $employee_cmt->id : null;
        $comments->patient_id = $patient->pid;
        $comments->number_phone = $request->phonenumber;
        $comments->email = $request->email;
        $comments->first_name = $request->firstname;
        $comments->last_name = $request->lastname;
        // if($request->cpc_status && $request->cpc_status == 1){
        //     $comments->cpc_status = 1;
        // }else{
        $comments->cpc_status = 0;
        // }
        $comments->save();
        //dd($employee_cmt->clockid);
              // Check send mail config follow up field notes in code_master = 1 then send mail else not send

        $isSend = CodeMaster::where('type','=','unit')
                                ->where('key','=', "$unit")->get();

        if($isSend->count() > 0 && $isSend[0]->notes == '1')
        {
            $mail = [];
            $listeid = ConfigPeck::where('unit_id',$unit)->get();
            if($listeid->count() > 0){
                $employee = Employee::whereIn('id',$listeid[0]->eidfollow)
                                ->where('email','<>','')
                                ->get();
                foreach ($employee as $key) {
                    if($key->email != '')$mail[] = $key->email;
                }
                if(count($mail) > 0){
                    if(!$employee_cmt) {
                        return redirect('survey/caregivers');
                    }
                    
                    if($comments->first_name)
                    {
                    	\Mail::send('emails.surveys.comments',compact('comments','employee_cmt'), function ($message) use ($mail) {
                       		$message->to($mail)->subject('Follow up requested from Wambi Review!');
                    	});
                    }
                    else
                    {	
	                    \Mail::send('emails.surveys.comments',compact('comments','employee_cmt'), function ($message) use ($mail) {
	                       $message->to($mail)->subject('Comment from a Wambi Review!');
	                    });
                    }
                }
            }
        }

        \Session::forget('employee_comment');
        return redirect('/survey/complete');
    }

    public function postRecovercode(Request $request)
    {
        $number_phone = $request->numberphone;
        $patient = Patient::where('mobile','=',$number_phone)->get();
        //dd($patient);
        $patient_family = PatientFamily::
                            where('numberphone','=',$number_phone)->get();
        $code = SurveyController::generate();
        if($patient->count() > 0)
        {
            $patient = $patient[0];
            $patient->code_date = Carbon::now();
            $patient->code = $code;
            $patient->save();
            if($patient->mobile != '' && $patient->patient_carrier != '')
            {
                \Mail::send('emails.out-patient.tooutpatient',compact('code'), function ($message) use ($patient) {
                    $message->to($patient->email)->subject('Access code!');
                });

                \Mail::send('emails.out-patient.tooutpatient_sms',compact('code'), function ($message) use ($patient) {
                    $message->to($patient->mobile.$patient->patient_carrier)->subject('Access code!');
                });
                echo "<script>
                        alert('Code has been sent ".$patient->email."!');
                        window.location.href='/code';
                    </script>";
            }
            echo "<script>
                alert('Number Phone missmatch!');
                window.location.href='/';
                </script>";
        } elseif ($patient_family->count() > 0) {
            $patient_family = $patient_family[0];
            $patient_family->code = $code;
            $patient_family->date = Carbon::now();
            if($patient_family->numberphone && $patient_family->carrier){
                \Mail::send('emails.out-patient.tooutpatient_sms',compact('code'), function ($message) use ($patient) {
                    $message->to([$patient_family->mobile.$patient_family->patient_carrier])->subject('Access code!');
                });

                echo "<script>
                        alert('Code has send!');
                        window.location.href='/code';
                    </script>";
            }
            echo "<script>
                alert('Number Phone missmatch!');
                window.location.href='/';
                </script>";
        }
        else
        {
            echo "<script>
                alert('Number Phone missmatch!');
                window.location.href='/';
                </script>";
        }

    }

    public function postCheck()
    {
        $patient = \Session::get('patient');
        $code = \Session::get('code');
        $employee = \Input::get('id');
        $count = 0;
        if(\Session::get('user_type')!='ambassador'){
            if(config("customerindex.out_patient") == \Cache::get('current_index')){
                $count = Survey::where('patient_id','=',$patient->pid)
                ->where('employee_id','=',$employee)
                ->whereDate('created_at','=',Carbon::today())
                ->where('code','=',$code)
                ->count();
            }else{
                $count = Survey::where('patient_id','=',$patient->pid)
                ->where('employee_id','=',$employee)
                ->whereDate('created_at','=',Carbon::today())
                ->count();
            }
        }
        if($count >= 2)
        {
            return response()->json(['success'=>false,'message'=>'Error.']);
        }
        else
            return response()->json(['success'=>true,'message'=>'Success']);
    }

    private function generate()
    {
        $code = rand(0,9).rand(0,9).rand(0,9).rand(0,9);
        // check validate
        $date = Carbon::now()->subHours(24);
        $count = Patient::leftjoin('patient_family','patient_details.pid','=','patient_family.pid')
                        ->where('patient_details.code',$code)
                        ->orwhere('patient_family.code',$code)
                        ->where('code_date','>=',$date)->count();
        if($count > 0)
            generate();
        return $code;
    }

    // SERVICE RECOVERY: Send mail follow up a "Poor" survey result
    private function service_recovery_sendmail($type, $arrquestion, $employee_data = null){
        $patient = \Session::get('patient');
        $unit_id = \Session::get('unit');
        //dd($patient);
        $employee = \Session::get('employee_comment');
        // Alert survey
        if($type == 0){
            $mail = [];
            $mobile = [];
            $listeid = ConfigPeck::where('unit_id',$unit_id)->get();
            $unit = CodeMaster::where('type','unit')->where('key',$unit_id)->get();
            $unit = $unit[0];
            $content = "";
            $content_sms = "";

            $questions = Question::where(['unit_id'=>$unit_id])->where('enabled','=',1)->get();
            for ($i=0; $i < count($arrquestion); $i++) {
                $content = $content ."Question ".$arrquestion[$i].": ".$questions[$i]->question."<br>";
                $comment_sms = $content ."Question ".$arrquestion[$i].", ";
            }
            if($content_sms != ""){
                $content_sms = substr($content_sms, 0, strlen($content_sms)- 1 );
            }
            if($listeid->count() > 0){
                $eidalert = Employee::whereIn('id',$listeid[0]->eidalert)->get();
                //dd($employee);
                foreach ($eidalert as $key) {
                    if($key->email != '')$mail[] = $key->email;
                	if($key->carrier != '')$mobiles[] = $key->mobile.$key->carrier;
                }

                if(count($eidalert)>0){
                    foreach ($eidalert as $item){
                        $item->notifications()->attach(11, [
                            'content' => '{"link":"/admin/data"}',
                            'created_at' => Carbon::now()
                        ]);
                    }
                }

                if($employee_data){
                    $units = CodeMaster::where('type','unit')->whereIn('key',$employee_data->units)->get();
                    $unit = '';
                    $i=0;
                    foreach ($units as $item){
                        $unit .= $item->value;
                        if($i<count($units)-1){
                            $unit .= ', ';
                        }
                        $i++;
                    }

                }
                // send email
                if(count($mail) > 0){
	               \Mail::send('emails.frontend.surveys',compact('employee','patient','unit','content'), function ($message) use ($mail) {
	                    $message->to($mail)->subject('An employee just received a poor score');
	                });
                 }
                 //send sms
                 if(count($mobile) > 0){
	               \Mail::send('emails.frontend.surveys_sms',compact('employee','patient','unit','content_sms'), function ($message)  use ($mobile) {
	                    $message->to($mobile)->subject('An employee just received a poor score');
	                });
                 }
            }
        }else{ //alert exit_survey
            $mail = [];
            $mobile = [];
            $listeid = ConfigPeck::where('unit_id',$unit_id)->get();
            $unit = CodeMaster::where('type','unit')->where('key',$unit_id)->get();
            $unit = $unit[0];
            $content = "";
            $questions = QuestionExit::where(['unit_id'=>$unit_id])->where('enabled','=',1)->get();
            for ($i=0; $i < count($arrquestion); $i++) {
                $content = $content ."Q.".$arrquestion[$i].": ".$questions[$i]->question."<br>";
            }
            if($listeid->count() > 0){
                $employee = Employee::whereIn('id',$listeid[0]->eidalert)->get();
                foreach ($employee as $key) {
                    if($key->email != '')$mail[] = $key->email;
                	if($key->carrier != '')$mobiles[] = $key->mobile.$key->carrier;
                }

                // send email
                if(count($mail) > 0){
	               \Mail::send('emails.frontend.surveys_unit',compact('unit','content'), function ($message) use ($mail) {
	                    $message->to($mail)->subject('Facility: Negative Survey Result');
	                });
                }
                // send sms
                if(count($mobile) > 0){
	               \Mail::send('emails.frontend.surveys_unit_sms',compact('unit','content'), function ($message)  use ($mobile){
	                    $message->to($mobile)->subject('Facility: Negative Survey');
	                });
                }
            }
        }
    }

// SERVICE RECOGNITION: Send mail follow up a 100% scores survey result
    private function service_recognition_sendmail($employee_data = null){
        $patient = \Session::get('patient');
        $unit_id = \Session::get('unit');
        //dd($patient);
        $employee = $employee_data;
        $configPeck = ConfigPeck::where('unit_id',$unit_id)->first();
        $unit = CodeMaster::where('type','unit')->where('key',$unit_id)->get();
       	$unit = $unit[0];
       	$mail = [];
        $mobile = [];
        $content = "";
        $avg_rating = \DB::select("SELECT sum(avg_rating) avg_rating from (SELECT * FROM `surveys`WHERE employee_id = '$employee->id' 
        							ORDER BY `surveys`.`created_at` DESC LIMIT $configPeck->number_of_consecutive) a");

		if($avg_rating[0]->avg_rating != $configPeck->number_of_consecutive *100)
			return;
		$users_to_receive = Employee::whereIn('id',$configPeck->users_to_receive)->get();
        
        if(count($users_to_receive)>0){
        	//dd($employee);
	        foreach ($users_to_receive as $key) {
	            if($key->email != '')$mail[] = $key->email;
	        	if($key->carrier != '')$mobiles[] = $key->mobile.$key->carrier;
	        }
        	
        	// 12:'#employee_fullname received #number_of_consecutive Perfect Reviews in a row!
        	$employee_fullname =$employee->name();
        	$number_of_consecutive =$configPeck->number_of_consecutive;
            foreach ($users_to_receive as $item){
                $item->notifications()->attach(12, [
                    'content' => "{\"employee_fullname\":\"$employee_fullname\",\"number_of_consecutive\":$number_of_consecutive }",
                    'created_at' => Carbon::now()
                ]);
            }
            
            // send email
            if(count($mail) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition',compact('employee','patient','unit','configPeck'), function ($message) use ($mail) {
                    $message->to($mail)->subject('Alert: Wambi Hot Streak ');
                });
             }
             //send sms
             if(count($mobile) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition_sms',compact('employee','patient','unit','configPeck'), function ($message)  use ($mobile) {
                    $message->to($mobile)->subject('Alert Wambi Hot Streak');
                });
             }
        }
        // Customizable Elements- Alerts tab - EMPLOYEE RECOGNITION - PERFECT SCORE ALERTS enable Button 
        if($configPeck->perfectscore ==1)
        {
        	$mail = [];
        	$mobile = [];
        	if($employee->email != '')$mail[] = $employee->email;
            if($employee->carrier != '')$mobiles[] = $employee->mobile.$employee->carrier;
        	// send email
            if(count($mail) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition_employee',compact('employee','patient','unit','configPeck'), function ($message) use ($mail) {
                    $message->to($mail)->subject('Congrats on a perfect score!');
                });
             }
             //send sms
             if(count($mobile) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition_employee_sms',compact('employee','patient','unit','configPeck'), function ($message)  use ($mobile) {
                    $message->to($mobile)->subject('Congrats!');
                });
             }
        }
      
    }
    

    //    Demon Dragon
    public function postCarepostcard(Request $request){
        $caregiver_content = $request->caregiver_content;
        $to = $request->to;
        $from = $request->from;
        $address = $request->address;
        $data = [
            'caregiver_content' => $caregiver_content,
            'to'    => $to,
            'from'  => $from,
            'address'   => $address
        ];
        Session::put('care_postcard_data', $data);
        return Response::json(['status' => 200, 'data' => Session::get('care_postcard_data')]);
    }

    public function postTags(Request $request){
        $tags = $request->tags;
        $care_postcard_data = Session::get('care_postcard_data');
        $care_postcard_data['tags'] = json_encode($tags);
        Session::put('care_postcard_data', $care_postcard_data);
        return Response::json(['status' => 200, 'tags' => $tags, 'data' => Session::get('care_postcard_data')]);
    }

    public function postWritePostcard(Request $request){
        $email = $request->email;
        $img = $request->img;
        $email_provider = $request->email_provider;
        $care_postcard_data = Session::get('care_postcard_data');
        $care_postcard_data['email'] = $email;
        $care_postcard_data['img'] = $img;
        $care_postcard_data['email_provider'] = $email_provider;
        $setting = Setting::first();
        $result = self::curl_epost($setting->url.'/api/write-postcard', 'POST', $care_postcard_data);

        $employee = \Session::get('employee');
        $patient = \Session::get('patient');
        $comments = new Comments();
        $comments->cmt_description = $care_postcard_data['caregiver_content'];
        $comments->date = Carbon::now();
        $comments->employee_id = $employee?$employee->id:null;
        $comments->patient_id = $patient?$patient->pid:null;
        $comments->number_phone = $employee?$employee->mobile:'';
        $comments->email = $employee?$employee->email:'';;
        $comments->first_name = $employee?$employee->firstname:'';
        $comments->last_name = $employee?$employee->lastname:'';
        $comments->cpc_status = 1;
        $comments->save();
        return $result;
    }

    public function getThanks(){
        $qa = \App\QA::where('UType','like','%7%')->get();
        $title = "title_caregiver";
        $unit = \Session::get('unit');

        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        return view('frontend.comment-thanks')->with([
            'qa'    => $qa,
            'title' => $title,
            'unit_data'  => isset($unit_data)?$unit_data:'',
            'page'  => 'comment'
        ]);
    }

    public function getThanksComplete(){
        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit');
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $setting = Setting::first();
//        $tags = file_get_contents ($setting->url.'/api/tag');
//        if($tags){
//            $speciality = json_decode($tags)->tags;
//        }
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $employee = \Session::get('employee');

        if(config("customerindex.out_patient") == \Cache::get('current_index')){
            $isAmbassador = 0;
            if(\Session::get('user_type') == 'ambassador'){
                $isAmbassador = 1;
            }
            return view('frontend.out-patient.thanks-completed')->with([
                'qa'    => $qa,
                'isAmbassador'  => $isAmbassador,
                'unit_data'  => (isset($unit_data)?$unit_data:''),
//                'speciality' => (isset($speciality)?$speciality:''),
                'employee'  => (isset($employee)?$employee:''),
                'page'  => 'complete'
            ]);
        }
    }

    public static function curl_epost($url="", $method = "GET", $params = array()) {
        $expire_time = time() + 3*3600;
        $header = array(
            "Content-Type: application/json",
        );

        $ch = curl_init();
        if($method == "POST"){
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, true); // for post
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));  // for post
        }else{
            curl_setopt($ch, CURLOPT_URL, $url);
        }

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $expire_time);
        curl_setopt($ch, CURLOPT_TIMEOUT, $expire_time);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        $result = curl_exec($ch);
        curl_close($ch);
        return json_decode($result);
    }

}
