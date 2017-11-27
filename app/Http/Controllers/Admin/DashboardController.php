<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\CodeMaster;
use App\Answer;
use App\Employee;
use App\Award;
use App\News;
use App\Shift;
use App\ShiftRequest;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\Survey;
use App\ConfigPeck;
use Intervention\Image\Facades\Image;
use App\EmployeeType;

//use App\CarriersOnline;

class DashboardController extends Controller
{
    function __construct()
    {
         \View::composers([
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\ShiftRequests'  => ['admin.partials.shift_requests'],
            'App\Composers\ShiftTime'  => ['admin.partials.shift_requests','partials.available_shifts','admin.partials.employees'],
            'App\Composers\JobTitle'  => ['admin.partials.shift_requests','partials.available_shifts','admin.partials.employees'],
            'App\Composers\Peck'  => ['admin.partials.shift_requests','partials.available_shifts'],
            'App\Composers\AvailableShifts'  => ['partials.available_shifts'],
            'App\Composers\PatientList'  => ['admin.partials.patients'],
            'App\Composers\EmployeeList'  => ['admin.partials.employees'],
            'App\Composers\RatingDisciplineByUnit'  => ['admin.dashboard','super-admin.dashboard','super-executive.dashboard'],
            'App\Composers\AwardRequests'  => ['partials.awards_request'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\ConfigUnit' =>['admin.*', 'partials.qa'],
            'App\Composers\Insurance'  => ['admin.*'],
            'App\Composers\Facility'  => ['admin.partials.shift_requests','partials.available_shifts','admin.partials.patients','super-admin.dashboard','super-executive.*'],
            'App\Composers\ShowAllUnits'  => ['admin.*'],
        ]);
    }
    public function index(Request $request)
    {
        // $eid = ConfigPeck::whereIn('unit_id',\Auth::user()->units)->get();
        // dd($eid);
        //CarriersOnline::carrier("");
        $facility = CodeMaster::where('type','facility')->orderby('value')->get();
        $disciplines = CodeMaster::where('type','discipline')->orderby('value')->get();
        $job_titles = CodeMaster::where('type','job_title')->orderby('value')->get();
        $shifts = CodeMaster::where('type','shift_time')->orderby('value')->get();
        $employees_types = EmployeeType::get();

        $key = \Request::get('id');
        $status_pass = \Auth::user()->status_pass;
        if($key){
            if(\Auth::user()->type() == 'super-admin' ||
                (\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1)){
                \Session::set('current_unit',$key);
                //dd(2);
                return redirect()->route('admin::dashboard');
            }
            else if(\Auth::user()->type() == 'super-executive'){
                \Session::set('current_fac',$key);
                //dd(1);
                return redirect()->route('admin::dashboard');
            }
        }

        if(\Session::has('current_unit')){
            $unit = \Session::get('current_unit');
        }else{
            if(\Auth::user()->type() == 'super-admin' ||
                (\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1)){
                $unit = 0;
            }else{
                $unit = \Auth::user()->units[0];
            }
        }
        $fac_id = \Session::get('current_fac');
        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
            || $unit == 0){
            $news = News::where('fac_id',$fac_id)
                ->orderBy('created_at','DESC')->with('likes', 'comments', 'tag')->get();
        }else{
            if($unit != 1) {
                $news = News::where('units','like', "%$unit%")->where('fac_id', $fac_id)
                    ->orderBy('created_at', 'DESC')->with('likes', 'comments', 'tag')->get();
            }else{
                $news = News::where('units','like', "%$unit\"%")->where('fac_id', $fac_id)
                    ->orderBy('created_at', 'DESC')->with('likes', 'comments', 'tag')->get();
            }
        }

        $award_requests = Award::where('approval','NO')->get();
        if((\Auth::user()->type() == 'super-admin' && $unit == 0) ||
            (\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1 && $unit == 0) ||
            (\Auth::user()->type() == 'super-executive' && $fac_id == 0)){
            //$units = CodeMaster::where('type','unit')->where('refkey',$fac_id)->get();
            //if($units->count() > 0){
            //    \Session::set('current_unit',$units[0]->key);
            //}

            $Qnotes = CodeMaster::where('type','=','qa_notes')->get();
            if( \Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1)
                $unitAll = 1;

            $rating_question = $this->rating_question();
            $rating_question_by_all = $this->rating_question_by_all();
            $rating_question_by_multi = $this->rating_question_by_multi();
            $datarating = $this->getdataRating();

//            dd($datarating);
            $data = [];
            if(\Auth::user()->type() == 'super-admin' || ( \Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1)){
                $data = $this->getdatachart();
            }else{
                $data = $this->getdatachartbyexecutive();
            }

//            $data = $this->getdatachart_unit();
            $arr_x = $data[0]['data_x'];

            if($fac_id == 0){
                $name_fac = "Health System";
            }else{
                $name_fac = CodeMaster::where('type','facility')->where('key',$fac_id)->get();
                if($name_fac->count() > 0){
                    $name_fac = $name_fac[0]->value;
                }else{
                    $name_fac = "";
                }
            }
            return view('super-executive.dashboardforall',compact('unitAll','data','arr_x','Qnotes','rating_question','rating_question_by_all','rating_question_by_multi','datarating','name_fac','status_pass'));
        }
        $data = [];
        $data = $this->getdatachart_unit();
        $arr_x = $data[0]['data_x'];

        $total_surveys = 0;
        $today_surveys = 0;
        if(\Auth::user()->type() == 'patient-manager')
        {
            $total_surveys_query = Survey::whereIn('unit_id',\Auth::user()->units);
            $total_surveys = $total_surveys_query->count();
            $today = Carbon::now()->format('Y-m-d');
            $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
        }
		elseif(\Auth::user()->type() == 'employee-manager' || \Auth::user()->type() == 'admin')
        {
        	\Session::put('request_data', '');
        	\Session::put('employees_data', '');
        	$request_data = array();
            $employees = Employee::select('*');

            //Name
            if($request->name && $request->name[0] != 'all'){
                $employees->whereIn('id',$request->name);
                $request_data['name'] = $request->name;
            }else if($request->name && $request->name[0] == 'all'){
                $request_data['name'][0] = $request->name[0];
            }
            //Facility
            if($request->facility && $request->facility[0] != 'all'){
                $employees->whereIn('fac_id',$request->facility);
                $request_data['facility'] = $request->facility;
            }else if($request->facility && $request->facility[0] == 'all'){
                $request_data['facility'][0] = $request->facility[0];
            }
            //Unit
            if($request->unit && $request->unit[0] != 'all'){
                $employees->where(function ($employees) use ($request){
                    foreach ($request->unit as $item=>$key){
                        $employees->orWhere('units','like','%"'.$key.'"%');
                    }
                });
                $request_data['unit'] = $request->unit;
            }else if($request->unit && $request->unit[0] == 'all'){
                $request_data['unit'][0] = $request->unit[0];
            }
            //Disciplines
            if($request->discipline && $request->discipline[0] != 'all'){
                $employees->where(function ($employees) use ($request) {
                    foreach ($request->discipline as $item => $key) {
                        $employees->orWhere('disciplines', 'like', '%"' . $key . '"%');
                    }
                });
                $request_data['discipline'] = $request->discipline;
            }else if($request->discipline && $request->discipline[0] == 'all'){
                $request_data['discipline'][0] = $request->discipline[0];
            }

            //Job title
            if($request->job_title && $request->job_title[0] != 'all'){
                $employees->whereIn('job',$request->job_title);
                $request_data['job_title'] = $request->job_title;
            }else if($request->job_title && $request->job_title[0] == 'all'){
                $request_data['job_title'][0] = $request->job_title[0];
            }

            //Shift
            if($request->shift && $request->shift[0] != 'all'){
                $employees->where(function ($employees) use ($request) {
                    foreach ($request->shift as $item => $key) {
                        $employees->orWhere('shifts', 'like', '%"' . $key . '"%');
                    }
                });
                $request_data['shift'] = $request->shift;
            }else if($request->shift && $request->shift[0] == 'all'){
                $request_data['shift'][0] = $request->shift[0];
            }

            //Employee Type
            if($request->employees_type && $request->employees_type[0] != 'all'){
                $employees->whereIn('etid',$request->employees_type);
                $request_data['employees_type'] = $request->employees_type;
            }else if($request->employees_type && $request->employees_type[0] == 'all'){
                $request_data['employees_type'][0] = $request->employees_type[0];
            }

            $employees_data = $employees->get();

            //Rating
            if($request->rating && $request->rating[0] != 'all' && count($employees_data)>0){
                $min = array();
                $max = array();
                foreach ($request->rating as $item){
                    $min[] = substr($item,0,strpos($item, '-'));
                    $max[] = substr($item,strpos($item, '-')+1);
                }

                $result = array();
                foreach ($employees_data as $item){
                    for($i=0; $i<count($min); $i++){
                        if($item->rating($item->units) >= $min[$i] && $item->rating($item->units) <= $max[$i]){
                            $result[] = $item;
                            break;
                        }
                    }
                }

                $employees_data = $result;
                $request_data['rating'] = $request->rating;
            }else if($request->rating && $request->rating[0] == 'all'){
                $request_data['rating'][0] = $request->rating[0];
            }

            \Session::put('request_data', $request_data);
            \Session::put('employees_data', $employees_data);
        }
    	return view(\Auth::user()->type().'.dashboard',compact('data', 'arr_x', 'news','total_surveys','today_surveys','status_pass','facility','disciplines','job_titles','shifts','employees_types','employees_data','request_data'));
    }
    public function set_unit()
    {
        \Session::set('current_unit',\Input::get('current_unit'));
        $fac = \Auth::user()->fac_id;
        \Session::set('current_fac',$fac);
        $previousUrl = app('url')->previous();
        $url = strtok($previousUrl, '?'); //remove $_GET value
        return redirect()->to($url);
    }

    public function set_fac(){
        \Session::set('current_fac',\Input::get('current_fac'));

         if(\Auth::user()->type() == 'super-executive'){
            Session()->forget('current_unit');
         }
        return redirect()->back();
    }

    public function getdatachart()
    {
        $unit_score = [];
        $all_score = [];
        $arr = [];
        $start = Carbon::now();
        $start->subDays(6);
        $start_date = $start->format('Y-m-d 00:00:00');
        $fac_id = \Session::get('current_fac');
        for ($i=0; $i < 7; $i++) {
            $arr[] = $start->format('m-d-y');
            $all_score[$i]['x'] = $i;
            $all_score[$i]['y'] = Survey::get_caregiver_performance_rating($fac_id,"%",$start);
            $start->addDay();
            $start_date = $start->format('Y-m-d 00:00:00');
        }
        if(\Cache::get('function_amada') == 1 && $fac_id == 0){
            $fac_id = \Auth::user()->fac_id;
        }
        $result = [];
        $key = CodeMaster::where('type','facility')->where('key',$fac_id)->get();

        if(count($key)>0) {
            $z = 0;
            $result[$z]['values'] = $all_score;
            $result[$z]['key'] = $key[0]->value;
            $result[$z]['color'] = $this->getColor(0);//$this->getColor(0);
            $result[$z]['data_x'] = $arr;
            $result[$z]['interpolate'] = 'bundle';
            // Process Unit
            $y = 1;
        }else{
            $z = -1;
            $y = 1;
        }
        if($fac_id!=0){
            $units = CodeMaster::where('type', 'unit')->where('refkey', $fac_id)->get();
        }else{
            $units = CodeMaster::where('type', 'unit')->get();
        }
        foreach ($units as $key) {
            $z++;
            $start = Carbon::now();
            $start_date = $start;
            // date
            $start->subDays(6);
            $start_date = $start->format('Y-m-d 00:00:00');
            $fac_id = \Session::get('current_fac');

            for ($i=0; $i < 7; $i++) {
                $arr[] = $start->format('m-d-y');
                $unit_score[$i]['x'] = $i;
                $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating($fac_id,$key->key,$start);
                $start->addDay();
                $start_date = $start->format('Y-m-d 00:00:00');
            }
            $result[$z]['values'] = $unit_score;
            $result[$z]['key'] = $key->value;
            $result[$z]['color']= $this->getColor($y);//$this->getColor($y);
            $result[$z]['data_x'] = $arr;
            $result[$z]['interpolate'] = 'bundle';
            $y+=1;
        }
        return $result;
    }

    public function getdatachart_unit(){
        $unit_score = [];
        $arr = [];
        $z = 0;
        // Process Unit

        $disciplines = CodeMaster::where('type','=','discipline')->get();
        $unit = \Session::get('current_unit');
        $fac_id = \Session::get('current_fac');

        $y = 1;
        foreach ($disciplines as $d) {
            $start = Carbon::now();
            $start->subDays(6);

            for ($i=0; $i < 7; $i++) {
                $arr[] = $start->format('m-d-y');
                $unit_score[$i]['x'] = $i;
                $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating_new($fac_id,$unit,$start,$d->key);
                $start->addDay();
                $start_date = $start->format('Y-m-d 00:00:00');
            }
            $result[$z]['values'] = $unit_score;
            $result[$z]['key'] = $d->value;
            $result[$z]['color']= $this->getColor($y);//$this->getColor($y);
            $result[$z]['data_x'] = $arr;
            $result[$z]['interpolate'] = 'bundle';
            $y+=1;
            $z++;
        }

        return $result;
    }

    public function getvalue($key, $arr){
        foreach ($arr as $value) {
            if($value->period ==  $key){
                return $value->score;
            }
        }
        return 0;
    }

    public function getColor($key){
        switch ($key) {
            case 0:
                return "#2ca02c";
                break;
            case 1:
                return "#ff7f0e";
                break;
            case 2:
                return "#34d3eb";
                break;
            case 3:
                return "#f05050";
                break;
            case 4:
                return "#ffbd4a";
                break;
            case 5:
                return "#c79ef7";
                break;
            case 6:
                return "#7266ba";
                break;
            case 7:
                return "#fb6d9d";
                break;
            case 8:
                return "#5d9cec";
                break;
           	case 9:
                return "#ed116d";
                break;
            case 10:
                return "#eb3481";
                break;
            case 11:
                return "#3ec94c";
                break;
        }
    }


    public function getdatachartbyexecutive()
    {
    	$unit_score = [];
        $all_score = [];
        $arr = [];
        $start = Carbon::now();
        $start->subDays(6);
        $start_date = $start->format('Y-m-d 00:00:00');
        $fac_id = \Session::get('current_fac');
        for ($i=0; $i < 7; $i++) {
            $arr[] = $start->format('m-d-y');
            $all_score[$i]['x'] = $i;
            $all_score[$i]['y'] = Survey::get_caregiver_performance_rating_test("%","%",$start);
            $start->addDay();
        }
        $key = "Health System";
        $z = 0;
        $result[$z]['values'] = $all_score;
        $result[$z]['key'] = $key;
        $result[$z]['color']= $this->getColor(0);//$this->getColor(0);
        $result[$z]['data_x'] = $arr;
        $result[$z]['interpolate'] = 'bundle';

        // Process Unit
        $facilitys =  CodeMaster::where('type','facility')->get();
        $y = 1;
        foreach ($facilitys as $key) {
            $z++;
            $start = Carbon::now();
            $start_date = $start;
            // date
            $start->subDays(6);
            $start_date = $start->format('Y-m-d 00:00:00');
            for ($i=0; $i < 7; $i++) {
                $unit_score[$i]['x'] = $i;
                $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating($key->key,"%",$start);

                $start->addDay();
                $start_date = $start->format('Y-m-d 00:00:00');
            }
            $result[$z]['values'] = $unit_score;
            $result[$z]['key'] = $key->value;
            $result[$z]['color']= $this->getColor($y);//$this->getColor($y);
            $result[$z]['data_x'] = $arr;
            $result[$z]['interpolate'] = 'bundle';
            $y+=1;
        }

        return $result;
    }

    public function rating_question()
    {
        $max_peck = config('award.max_peck');
        //return \DB::select("SELECT c.value categoryname ,ifnull(round(100*avg(avg)/$max_peck,2),0) rate
        //                    FROM code_master c
        //                    left join surveys a on a.discipline = c.key and a.unit_id='$unit_id'
        //                    where c.type = 'discipline'
        //                    group by c.key");
        if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1){
            return \DB::select("SELECT c.key, c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate
                            FROM surveys a
                            left join code_master c  on a.fac_id = c.key
                            where c.type = 'facility'
                            group by c.key");
        }else{
            $fac_id = \Session::get('current_fac');
            return \DB::select("SELECT c.key, c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate
                            FROM surveys a
                            left join code_master c  on a.unit_id = c.key
                            where c.type = 'unit'
                            and c.refkey = $fac_id
                            group by c.key");
        }
    }

    public function rating_question_by_all()
    {
        // All Fac or Unit
        $max_peck = config('award.max_peck');
        if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1){
            $result = \DB::select("SELECT q.qid qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class, q.fac_id
                               FROM question q
                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = q.unit_id
                               and a.fac_id = q.fac_id
                               WHERE q.enabled = 1
                               GROUP BY qid, q.question
                               order by qid");
        }else{
            $fac_id = \Session::get('current_fac');
            $result = \DB::select("SELECT q.orderby qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class
                               FROM question q
                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = q.unit_id
                               WHERE  q.enabled = 1 and q.fac_id = $fac_id
                               GROUP BY qid, q.question
                               order by qid");
        }
        //dd($result);
        return $result;
    }

    public function rating_question_by_multi()
    {
        $result = [];
        $max_peck = config('award.max_peck');

        if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1){
            $ratings = \DB::select("SELECT c.key, c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,
                                    q.question,q.css_class
                                FROM code_master c
                                LEFT JOIN  answers a ON c.key = a.fac_id
                                inner JOIN question q ON q.qid = a.qid and q.unit_id= a.unit_id and a.fac_id = q.fac_id
                                where c.type = 'facility'  and q.enabled = 1
                                GROUP BY c.key,a.qid
                                order by c.key,a.qid");
        }else{
            $fac_id = \Session::get('current_fac');
            $ratings = \DB::select("SELECT c.key, c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class
                                FROM code_master c
                                LEFT JOIN  answers a ON c.key = a.unit_id
                                inner JOIN question q ON q.qid = a.qid and q.unit_id= a.unit_id
                                where c.type = 'unit'  and q.enabled = 1
                                and c.refkey = $fac_id
                                GROUP BY c.key,a.qid
                                order by c.key,a.qid");
        }

        foreach ($ratings as $key => $value) {
            $result[$value->key][$value->qid] = $value;
        }

        return $result;
    }

    public function getdataRating()
    {
        if(\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1){
             // Process facility
	        $facilitys =  CodeMaster::where('type','facility')->get();
	        foreach ($facilitys as $key) {
	        	$caregiver_performance_rating = Survey::get_caregiver_performance_rating($key->key,'%',"");
	        	$organizational_performance_rating = Survey::get_organizational_performance_rating($key->key,'%',"");
	        	if($caregiver_performance_rating == 0)
	        	{
	        		$brids_eys = $organizational_performance_rating;
	        	}
	        	else if($organizational_performance_rating == 0)
	        	{
	        		$brids_eys = $caregiver_performance_rating;
	        	}
	        	else
	        	{
	        		$brids_eys = ($organizational_performance_rating+$caregiver_performance_rating)/2;
        		}

	            $result[$key->key]["key"] = $key->key;
	        	$result[$key->key]["value"] = $key->value;
	        	$result[$key->key]["survey_value"] = $caregiver_performance_rating == 0?"-":$caregiver_performance_rating."%";
	        	$result[$key->key]["exit_value"] = $organizational_performance_rating ==0?"-":$organizational_performance_rating."%";
	        	$result[$key->key]["brids_eys"] = $brids_eys."%";
	        }

        }else{
            $fac_id = \Session::get('current_fac');
             // Process Unit
	        $units =  CodeMaster::where('type','unit')->where('refkey',$fac_id)->get();
	        foreach ($units as $key) {
	        	$caregiver_performance_rating = Survey::get_caregiver_performance_rating($fac_id,$key->key,"");
	        	$organizational_performance_rating = Survey::get_organizational_performance_rating($fac_id,$key->key,"");
	            if($caregiver_performance_rating == 0)
	        	{
	        		$brids_eys = $organizational_performance_rating;
	        	}
	        	else if($organizational_performance_rating == 0)
	        	{
	        		$brids_eys = $caregiver_performance_rating;
	        	}
	        	else
	        	{
	        		$brids_eys = ($organizational_performance_rating+$caregiver_performance_rating)/2;
        		}

	            $result[$key->key]["key"] = $key->key;
	        	$result[$key->key]["value"] = $key->value;
	        	$result[$key->key]["survey_value"] = $caregiver_performance_rating == 0?"-":$caregiver_performance_rating."%";
	        	$result[$key->key]["exit_value"] = $organizational_performance_rating ==0?"-":$organizational_performance_rating."%";
	        	$result[$key->key]["brids_eys"] = $brids_eys."%";
	        }
        }

	       //dd($result);
	       return $result;
    }

    public function getResize(){
        ini_set('memory_limit','1024M');
        $dir = 'uploads/profiles';
        $images = self::scanDirectories($dir);
        if(count($images)>0){
            foreach ($images as $item){
                if($item !== 'uploads/profiles/.gitignore') {
                    if(@imagecreatefrompng($item) || @imagecreatefromjpeg($item)){
                        $file = Image::make($item);
                        if($file->getSize()->width != 300 || $file->getSize()->height != 300){
                            $file->resize(300,300);
                            $file->save($item);
                        }
                    }
                }
            }
        }
        dd('OK');
    }

    public static function scanDirectories($rootDir, $allData=array()) {
        // set filenames invisible if you want
        $invisibleFileNames = array(".", "..", ".htaccess", ".htpasswd");
        // run through content of root directory
        $dirContent = scandir($rootDir);
        foreach($dirContent as $key => $content) {
            // filter all files not accessible
            $path = $rootDir.'/'.$content;
            if(!in_array($content, $invisibleFileNames)) {
                // if content is file & readable, add to array
                if(is_file($path) && is_readable($path)) {
                    // save file name with path
                    $allData[] = $path;
                    // if content is a directory and readable, add path and name
                }elseif(is_dir($path) && is_readable($path)) {
                    // recursive callback to open new directory
                    $allData = self::scanDirectories($path, $allData);
                }
            }
        }
        return $allData;
    }

     public function set_unit_ajax(Request $request)
    {
        \Session::set('current_unit',\Input::get('current_unit'));
        $fac = \Auth::user()->fac_id;
        \Session::set('current_fac',$fac);
         return 'success:user data updated';
    }

}
