<?php

namespace App\Http\Controllers\Admin;

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
use Illuminate\Support\Facades\Auth;
use Session, Response;

// Mini Patient Portal built into Admin/ Super Admin/ Exec" and Comment tab added to Admin User
class ReviewController extends Controller
{
    function __construct()
    {
         \View::composers([     
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\Discipline'  => ['admin.*'],
        ]);
    }
    public function getIndex()
    {
        $query = CodeMaster::where('type','unit');
        if(\Auth::user()->type()!='super-executive')
        {
        	$query->whereRaw("refkey like '".\Auth::user()->fac_id."'");
        	$query->whereIn('key',\Auth::user()->units);
        }

        $qa = \App\QA::where('UType','like','%7%')->get();
        $unitsadmin = $query->where('code_master.type','unit')
            ->select('code_master.value','code_master.key as fname','code_master.refkey as fac')->distinct()->get();
        
        
        return view('admin.review.index',compact('qa','unitsadmin'));
    }

    public function postSelectUnit(Request $request)
    {
    	$unit = $request->unit;
    	\Session::set('unit_review',$unit);
    	$qa = \App\QA::where('UType','like','%7%')->get();
        return view('admin.review.evaluate_your_caregiver',compact('qa'));
         
    }
     public function getCaregivers()
    {
        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit_review');
    	return view('admin.review.caregivers',compact('qa'));
    }
    public function postSearch(Request $request)
    {
		$unit = \Session::get('unit_review');
    	$results = Employee::searchReview($request->q, $unit);
    	$employees = $results['items'];
    	//dd($unit);
    	return view('admin.review._employee',compact('employees'))->render();
    }
     public function survey($employee)
    {
        \Session::put('employee',$employee);
    	$unit = \Session::get('unit_review');
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
    	return view('admin.review.survey',compact('employee','questions','answers','qa','isSend','insurance','enable_insurance_payor','qids'));
    }
    
     public function postCheck()
    {
    	return response()->json(['success'=>true,'message'=>'Success']);
        $code = \Session::get('code');
        $employee = \Input::get('id');
        
        $count = 0;
         $count = Survey::where('patient_id','=',\Auth::user()->pid)
                ->where('employee_id','=',$employee)
                ->whereDate('created_at','=',Carbon::today())
                ->count();
         
        if($count >= 2)
        {
            return response()->json(['success'=>false,'message'=>'Error.']);
        }
        else
            return response()->json(['success'=>true,'message'=>'Success']);
    }
	
	   public function save($employee,Request $request)
    {
    
        $arrquestion_poor = null;
        // Luu thong tin Employee cho comment
        \Session::set('employee_comment',$employee);
         $survey = new Survey;
        $survey->created_at = Carbon::now();
        $survey->employee_id = $employee->id;
        $survey->type = \Auth::user()->type();
        $survey->patient_id = \Auth::user()->id;
        $survey->unit_id = \Session::get('unit_review');
        $survey->discipline = $employee->disciplines[0];
        $survey->fac_id = $employee->fac_id;
        $answers = $request->answers;
        $total_rate = 0;

        // Config peck for survey
        $config_peck = ConfigPeck::where('unit_id','=',$survey->unit_id)
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
            $answer->pid =  \Auth::user()->id;
            $answer->user_type = \Auth::user()->type();
            $answer->unit_id =  \Session::get('unit_review');
            $answer->catid = $employee->disciplines[0];
            $answer->survey_id =  $survey->id;
            $survey->total += $answer->peck;
            $answer->fac_id = $employee->fac_id;
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
/*
        if(count($arrquestion_poor) > 0){
            $this->service_recovery_sendmail(0, $arrquestion_poor, $employee);
        }
       	// SERVICE RECOGNITION: Send mail follow up a 100% scores survey result
       	if($survey->avg_rating = 100)
       		$this->service_recognition_sendmail($employee);
        */
    	return response()->json([$request->answers]);
    }
    
    
    public function comments()
    {
       	$qa = \App\QA::where('UType','like','%7%')->get();
        $title = "title_caregiver";
        $unit = \Session::get('unit_review');
        $setting = Setting::first();
//        $tags = file_get_contents($setting->url.'/api/tag');
//        if($tags){
//            $speciality = json_decode($tags)->tags;
//        }
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $employee = \Session::get('employee');
        return view('admin.review.comment2')->with([
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
            return redirect('/admin/review/complete');
        }
        $employee_cmt = \Session::get('employee_comment');
        $unit = \Session::get('unit_review');
        $comments = new Comments();
        //dd($request->contact);
        $comments->cmt_description = $request->comment;
        $comments->date = Carbon::now();
        $comments->employee_id = $employee_cmt != null ? $employee_cmt->id : null;
        $comments->patient_id = \Auth::user()->id;
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
                        return redirect('admin/review/caregivers');
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
        return redirect('/admin/review/complete');
    }
    
      public function getComplete($value='')
    {

        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit_review');
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

        return view('admin.review.thanks2')->with([
            'qa'    => $qa,
            'isAmbassador'  => 0,
            'unit_data'  => (isset($unit_data)?$unit_data:''),
//                'speciality' => (isset($speciality)?$speciality:''),
            'employee'  => (isset($employee)?$employee:''),
            'page'  => 'comment'
        ]);
    }
    
    
    // SERVICE RECOVERY: Send mail follow up a "Poor" survey result
    private function service_recovery_sendmail($type, $arrquestion, $employee_data = null){
        $unit_id = \Session::get('unit_review');
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
	               \Mail::send('emails.frontend.surveys',compact('employee','unit','content'), function ($message) use ($mail) {
	                    $message->to($mail)->subject('An employee just received a poor score');
	                });
                 }
                 //send sms
                 if(count($mobile) > 0){
	               \Mail::send('emails.frontend.surveys_sms',compact('employee','unit','content_sms'), function ($message)  use ($mobile) {
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

        $unit_id = \Session::get('unit_review');
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
               \Mail::send('emails.frontend.surveys_service_recognition',compact('employee','unit','configPeck'), function ($message) use ($mail) {
                    $message->to($mail)->subject('Alert: Wambi Hot Streak ');
                });
             }
             //send sms
             if(count($mobile) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition_sms',compact('employee','unit','configPeck'), function ($message)  use ($mobile) {
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
               \Mail::send('emails.frontend.surveys_service_recognition_employee',compact('employee','unit','configPeck'), function ($message) use ($mail) {
                    $message->to($mail)->subject('Congrats on a perfect score!');
                });
             }
             //send sms
             if(count($mobile) > 0){
               \Mail::send('emails.frontend.surveys_service_recognition_employee_sms',compact('employee','unit','configPeck'), function ($message)  use ($mobile) {
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
        $comments = new Comments();
        $comments->cmt_description = $care_postcard_data['caregiver_content'];
        $comments->date = Carbon::now();
        $comments->employee_id = $employee?$employee->id:null;
        $comments->patient_id = \Auth::user()->id;
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
        $unit = \Session::get('unit_review');

        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        return view('admin.review.comment-thanks')->with([
            'qa'    => $qa,
            'title' => $title,
            'unit_data'  => isset($unit_data)?$unit_data:'',
            'page'  => 'comment'
        ]);
    }

    public function getThanksComplete(){
        $qa = \App\QA::where('UType','like','%7%')->get();
        $unit = \Session::get('unit_review');
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $setting = Setting::first();
        if($unit){
            $unit_data = CodeMaster::where('type','unit')->where('key',$unit)->first();
        }
        $employee = \Session::get('employee');

         return view('admin.review.thanks-completed')->with([
                'qa'    => $qa,
                'isAmbassador'  => 0,
                'unit_data'  => (isset($unit_data)?$unit_data:''),
//                'speciality' => (isset($speciality)?$speciality:''),
                'employee'  => (isset($employee)?$employee:''),
                'page'  => 'complete'
            ]);
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