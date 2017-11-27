<?php

namespace App\Http\Controllers\Admin;
use App\AwardRelationEmployee;
use App\NewsFeedTag;
use Auth;
use Illuminate\Http\Request;
use Input;
use App\Award;
use App\News;
use App\Employee;
use App\CodeMaster;
use App\Notification;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\AwardType;

class AwardController extends Controller
{
     function __construct()
    {
         \View::composers([
            'App\Composers\Unit'  => ['partials.awards_request','partials.awards','admin.award.edit', 'admin.award.index'],
            'App\Composers\AwardRequests'  => ['partials.awards_request'],
            'App\Composers\Help'  => ['partials.footer'],            
            'App\Composers\ShowAllUnits'  => ['partials.awards_request','partials.awards','admin.award.edit', 'admin.award.index'],
            'App\Composers\Facility'  => ['partials.awards_request','partials.awards','admin.award.edit', 'admin.award.index'],
            'App\Composers\Discipline'  => ['admin.*'],
            'App\Composers\ShiftTime'  => ['admin.*'],
        ]);
    }
   public function edit($award=null)
    {
        $current_unit = \Session::get('current_unit');
        if($current_unit == 0){
            $current_unit = '%';
        }
    	$units = CodeMaster::get_code_master('unit');
        $unit_awards = AwardType::where('type','=','unit')->get();
    	//$employee_awards = CodeMaster::get_code_master('employee_award');
        $employee_awards = AwardType::where('type','=','employee')->get();
		//dd($units);
    	$periods = CodeMaster::get_code_master('time_period');
        //dd($units);
    	return view('admin.award.edit',compact('award','units','unit_awards','periods','employee_awards'));
    }
    public function save($award=null)
    {
        if(Input::get('owner')=='all'){
                if(\Input::get('fac_id'))
                {
                    $fac_id = \Input::get('fac_id');
                }
                else
                {
                    $fac_id = \Auth::user()->fac_id;
                }

                $units_array = CodeMaster::getKeyByTypeAndRefkey('unit', $fac_id);

            foreach ($units_array as $item){

                $award = new Award;
                $award->user_id = \Auth::user()->id;
                $award->owner = $item['key'];
                $award->peck = Input::get('peck');
                $award->type = Input::get('type');
                $award->award = Input::get('award');
                $award->period = Input::get('period');
                $award->date_created = Carbon::now();
                $award->fac_id = $fac_id;
                
                if(Input::has('note')) $award->note = Input::get('note');
            	if(Input::has('disciplines')) $award->disciplines = Input::get('disciplines');
            	if(Input::has('shifts')) $award->shifts = Input::get('shifts');
            
                $award->peck = Input::get('peck');
                $award->save();
                if(Auth::user()->type()=='super-admin' || 
		            Auth::user()->type()=='super-executive'){
		            $this->_approve($award);
		        }else{
		            if($award->type == 'unit_award'){
		                $employee = Employee::whereRaw("units like '%\"$award->owner\"%'")
		                        ->where('etid',4)->get();
		                if($employee->count() > 0)
		                {
		                    foreach ($employee as $key) {                
		                        $key->notifications()->attach(8,['content'=>'{"link":"/admin/award","unit":'. $item['key'].'}','created_at'=>Carbon::now()]);                
		                    }    
		                }
		            }else{
		                $unit_id = Employee::where('id',$award->owner)->get();                
		                if($unit_id->count() > 0)
		                {
		                    foreach ($unit_id[0]->units as $key) {
		                        $employee = Employee::whereRaw("units like '%\"$key\"%'")
		                        ->where('etid',4)->get();
		                        if($employee->count() > 0)
		                        {
		                            foreach ($employee as $key) {                
		                                $key->notifications()->attach(8,['content'=>'{"link":"/admin/award","unit":'. $item['key'].'}','created_at'=>Carbon::now()]);                
		                            }    
		                        }       
		                    }
		                }
		            }            
		        }
            }
        }else{
            if($award==null){
                $award = new Award;
            }
            $emp = Employee::where('id',Input::get('owner'))->get();  
            $award->user_id = \Auth::user()->id;
            $award->owner = Input::get('owner');
            $award->peck = Input::get('peck');
            $award->type = Input::get('type');
            $award->award = Input::get('award');
            $award->period = Input::get('period');
            $award->date_created = Carbon::now();
            //$award->fac_id = \Session::get('current_fac');
            if(\Input::get('fac_id'))
	        {
	        	$award->fac_id = \Input::get('fac_id');
	        }
	        else
	        {
	        	$award->fac_id = \Auth::user()->fac_id;
	        }
		        
            if(Input::has('note')) $award->note = Input::get('note');
            if(Input::has('disciplines')) $award->disciplines = Input::get('disciplines');
            if(Input::has('shifts')) $award->shifts = Input::get('shifts');
            
            $award->save();
            if(Auth::user()->type()=='super-admin' || 
	            Auth::user()->type()=='super-executive'){
	            $this->_approve($award);
	        }else{
	            if($award->type == 'unit_award'){
	                $employee = Employee::whereRaw("units like '%\"$award->owner\"%'")
	                        ->where('etid',4)->get();
	                if($employee->count() > 0)
	                {
	                    foreach ($employee as $key) {                
	                        $key->notifications()->attach(8,['content'=>'{"link":"/admin/award","unit":'.Input::get('owner').'}','created_at'=>Carbon::now()]);                
	                    }    
	                }
	            }else{
	                              
	                if($emp->count() > 0)
	                {
	                    foreach ($emp[0]->units as $key) {
	                        $employee = Employee::whereRaw("units like '%\"$key\"%'")->where('etid',4)->get();
	                        if($employee->count() > 0)
	                        {
	                            foreach ($employee as $key) {                
	                                $key->notifications()->attach(8,['content'=>'{"link":"/admin/award","unit":'.Input::get('owner').'}','created_at'=>Carbon::now()]);                
	                            }    
	                        }       
	                    }
	                }
	            }            
	        }
        }

       
        // $ward-> = Input::get('');
        return redirect()->route('admin::award::index');
    }

    private function _approve($award)
    {
        $award->status = 'Accepted';
        if($award->type == 'employee_award'){
            $user = $award->employee;
            /* notify to employee */
            $award_type = AwardType::whereIn('unit_id',$user->units )
                            ->where('type','=','employee')
                            ->where('key','=',$award->award)
                            ->get();
            if($award_type->count() > 0)
                $award_type = $award_type[0]->value;

            $user->notifications()->attach(2,['content'=>"{\"peck\":$award->peck,\"award\":\"$award_type\"}",'created_at'=>Carbon::now()]);
            $user->pecks += $award->peck;
            $user->save();

            $award_relation_employee = new AwardRelationEmployee;
            $award_relation_employee->award_id = $award->id;
            $award_relation_employee->user_id = $user->id;
            $award_relation_employee->pecks = $award->peck;
            $award_relation_employee->type = 'employee_award';
            $award_relation_employee->save();

            // Create NewFeeds
            $news = new News;
            $news->created_at = time();
            $unit_name = Employee::where('id',$award->owner)->first();
            $news->title = "Congratulations to ".$unit_name->firstname." for earning the ".$award_type."!";
            $units = [];
            $units[0] = \Input::get('units');
            $news->units = $units;
            $news->fac_id = \Session::get('current_fac');
            $period = CodeMaster::get_code_by_type_and_key('time_period',$award->period);
            $news->content = "Congratulations to ".$unit_name->firstname." ".$unit_name->lastname." for earning the ".$award_type."! We appreciate and recognize the incredible work you are doing.";
            $news->type = "employee";
            $news->save();
            if (!file_exists(public_path()."/uploads/news/$news->id")) {
                mkdir(public_path()."/uploads/news/$news->id", 0777, true);
            }
            \File::copy(public_path()."/uploads/news/award.png",public_path()."/uploads/news/$news->id/award.png");
            $news->image = "award.png";
            $news->save();

            $news_tags = new NewsFeedTag;
            $news_tags->news_id = $news->id;
            $news_tags->users_id = $user->id;
            $news_tags->save();

            $content = ['link' => '/news/' . $news->id];
            $user->notifications()->attach(9, [
                'content' => json_encode($content),
                'created_at' => Carbon::now()
            ]);

            if($user->email){
                $email = $user->email;
                \Mail::send('emails.news.created',compact('news'), function ($message) use ($email) {
                    $message->from('news@wambi.org');
                    $message->to($email)->subject("You've been tagged in a post!");
                });
            }
            if($user->mobile && $user->carrier){
                $mobile = $user->mobile.$user->carrier;
                \Mail::send('emails.news.created_sms',compact('news'), function ($message) use ($mobile) {
                    $message->from('news@wambi.org');
                    $message->to($mobile)->subject("You've been tagged in a post!");
                });
            }
        }else{
            $employee = Employee::where('units','like', '%"'.$award->owner.'"%')
            						->where('etid',2);
           						//->get(); 
            $employee->where(function ($employee) use ($award) {
                    foreach ($award->disciplines as $item => $key) {
                        $employee->orWhere('disciplines', 'like', '%"' . $key . '"%');
                    }
                });
             $employee->where(function ($employee) use ($award) {
                    foreach ($award->shifts as $item => $key) {
                        $employee->orWhere('shifts', 'like', '%"' . $key . '"%');
                    }
                });   
            $employee = $employee->get();
            //dd($employee);    
                   
            $award_type = AwardType::where('unit_id','=',$award->owner)
                            ->where('type','=','unit')
                            ->where('key','=',$award->award)
                            ->get();
            if($award_type->count() > 0)
                $award_type = $award_type[0]->value;
            foreach ($employee as $key) {                
                $key->pecks += $award->peck;
                $key->notifications()->attach(2,['content'=>"{\"peck\":$award->peck,\"award\":\"$award_type\"}",'created_at'=>Carbon::now()]);
                $key->save();

                $award_relation_employee = new AwardRelationEmployee;
                $award_relation_employee->award_id = $award->id;
                $award_relation_employee->user_id = $key->id;
                $award_relation_employee->pecks = $award->peck;
                $award_relation_employee->type = 'unit_award';
                $award_relation_employee->save();
            }
            // Create NewFeeds
            $news = new News;
            $news->created_at = time();
            $news->title = "Unit Award";
            $units = [];
            $units[0] = "".$award->owner."";
            $news->units = $units;
            $news->fac_id = \Session::get('current_fac');
            $unit_name = CodeMaster::get_code_by_type_and_key('unit',$award->owner);           
            $period = CodeMaster::get_code_by_type_and_key('time_period',$award->period);
            $disciplines = CodeMaster::get_value_by_type_and_array_key('discipline',$award->disciplines);

            $strDisciplines = "";
            foreach ($disciplines as $key => $value) {
                 $strDisciplines .= $value['value'];
                 if ($key == (count($disciplines)-2)) {
                      $strDisciplines .= " and ";
                 }
                 else if($key<(count($disciplines)-1))
                 {
                      $strDisciplines .= ", ";
                 }
            }

            $news->content = "Congratulations to the $strDisciplines staff in $unit_name who has been awarded $award->peck PECKS for $award_type this $period";
            $news->type = "unit";
            $news->save();
            if (!file_exists(public_path()."/uploads/news/$news->id")) {
                mkdir(public_path()."/uploads/news/$news->id", 0777, true);
            }
            \File::copy(public_path()."/uploads/news/award.png",public_path()."/uploads/news/$news->id/award.png");            
            $news->image = "award.png"; 
            $news->save();
        }
        $award->save();
    }    
    public function getIndex()
    {   
        // TODO tanphuqn comment
        $unit = \Session::get('current_unit');
         if ((Auth::user()->type()=='super-admin' || (\Cache::get('function_amada') == 1 && Auth::user()->type()=='super-executive')) && Input::has('unit'))
            {
                $unit = \Input::get('unit');
                \Session::set('current_unit',\Input::get('unit'));
                $fac_id = \Auth::user()->fac_id;
                \Session::set('current_fac',$fac_id); 
            }

        $fac_id = \Session::get('current_fac');
        //$status = '';
//        $query = Award::whereRaw("(status is not null or status <> '')");
        $query = Award::select('*');
        if(\Auth::user()->type()=='super-executive' and $fac_id != 0 )
        {
        	$query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        
        if(\Auth::user()->type() !='super-executive' and $unit != 0 )
        {
        	$query->whereRaw("((type ='unit_award' and owner like '%$unit%') 
               					OR (type ='employee_award' and owner in (SELECT id from employee_master WHERE units like '%$unit%')))");
        }
        
        $awards = $query->orderBy('date_created','desc')->get();
        /*
        if(Auth::user()->type()=='super-executive' && \Cache::get('function_amada') != 1) {
            $current_unit = '%';
        }else if(Auth::user()->type()=='admin'){
            $current_unit = Auth::user()->unit_id();
            $status = 'admin';
        }else{
            if(\Session::has('current_unit')){
                $current_unit = \Session::get('current_unit');                
            }
        }        
        if($current_unit === 0){
            $current_unit = '%';
        }
        
        $current_fac = \Session::get('current_fac');
        if($status == 'admin'){
            $awards = Award::whereRaw("(status is not null or status <> '') and ((type ='unit_award' and owner like '%$current_unit%') 
               					OR (type ='employee_award' and owner in (SELECT id from employee_master WHERE units like '%$current_unit%')))")
                    ->where('fac_id',$current_fac)
                    ->orderBy('date_created','desc')
                    ->get();
        }else if($current_unit == '%' || config("customerindex.santaanita") == \Cache::get('current_index')){
            $awards = Award::whereRaw("(status is not null or status <> '')")
                                        ->where('fac_id',$current_fac)
            							->orderBy('date_created','desc') 
            							->get();
        }else{
            $awards = Award::whereRaw("(status is not null or status <> '') and ((type ='unit_award' and owner like '%$current_unit%') 
            					OR (type ='employee_award' and owner in (SELECT id from employee_master WHERE units like '%$current_unit%')))")
            						->where('fac_id',$current_fac)
        							->orderBy('date_created','desc')  
        							->get();
        }
        */

        $job_titles = CodeMaster::get_code_master('job_title');
        return view('admin.award.index',compact('awards','job_titles','unitAll'));
    }
    public function approve($award)
    {   
        $this->_approve($award);
        return response()->json(['success'=>true,'message'=>'Award accepted successfully.','status'=>$award->status]);
    }
    public function reject($award)
    {
        $award->status = 'Rejected';
        $award->save();
        return response()->json(['success'=>true,'message'=>'Award rejected.','status'=>$award->status]);
    }
	public function delete($award)
	{
	    if($award->id){
	        $award_relation = AwardRelationEmployee::where('award_id',$award->id)->get();
	        if(count($award_relation) > 0){
	            foreach ($award_relation as $item){
	                $employee = Employee::find($item->user_id);
	                if($employee){
	                    $employee->pecks = $employee->pecks - $item->pecks;
	                    if($employee->pecks < 0){
	                        $employee->pecks = 0;
                        }
                        $employee->save();
                    }
                    $item->delete();
                }
            }
        }
	    $award->delete();
	    return response()->json(['success'=>true,'message'=>'Awards deleted successfully.']);
	}

	public function postUnit(Request $request){
         $unit_id = $request->unit_id;
         if($unit_id){
             $employee_awards = AwardType::where('unit_id',$unit_id)->where('type','employee')->get();
             $result = '<option value="">Select Employee Award</option>';
             if(count($employee_awards)>0){
                 foreach ($employee_awards as $element){
                    $result .= '<option value="'.$element->key.'">'.$element->value.'</option>';
                 }
             }
             return response()->json(['success'=>true,'message'=>$result]);
         }else{
             return response()->json(['success'=>false,'message'=>'Error']);
         }
    }
}
