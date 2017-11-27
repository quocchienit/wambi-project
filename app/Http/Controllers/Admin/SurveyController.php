<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Employee;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Question;   
use App\Survey;   
use App\ExitSurvey;   
use App\CodeMaster;
use App\QuestionExit;   
use Carbon\Carbon;
class SurveyController extends Controller
{
    function __construct()
    {
     \View::composers([
        'App\Composers\Unit'  => ['admin.*'],
        'App\Composers\Discipline'  => ['admin.survey.data'],
        'App\Composers\Help'  => ['partials.footer'],
        'App\Composers\Insurance'  => ['admin.survey.data'],
        'App\Composers\Facility'  => ['admin.*'],
         'App\Composers\ShowAllUnits'  => ['admin.*'],
        ]);
 }
 public function getIndex()
 {
    
    $current_unit = \Session::get('current_unit');
    if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $current_unit==0){            
        $current_fac = \Session::get('current_fac');
        $total_surveys_query = Survey::where('fac_id',$current_fac);
        $total_surveys = $total_surveys_query->count();
            //$total_surveys_query
            //    ->whereRaw("date(created_at) = (select max(date(created_at)) from surveys )")
            //    ;
        $today = Carbon::now()->format('Y-m-d');
        $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
            //$today_surveys = $total_surveys_query->count();
        $questions = Question::where(['fac_id'=>$current_fac])->get();
        $questiontype = CodeMaster::where('type','=','exit_survey')->get();
        $question_exit = [];
        foreach ($questiontype as $element) {
            $question_exit[$element->key] = QuestionExit::where('fac_id','=',$current_fac)
            ->where('type','=',$element->key)->get();
        }

            // Get total exit_survey
        $total_exit_surveys_query = ExitSurvey::join('patient_details','patient_details.pid','=','exitsurvey.pid')
        ->where('exitsurvey.fac_id',$current_fac);
        $total_surveys += $total_exit_surveys_query->count();
        $total_exit_surveys_query->whereDate('date','=',$today);
        $today_surveys += $total_exit_surveys_query->count();
    }else{
        $total_surveys_query = Survey::where('unit_id',$current_unit);
        $total_surveys = $total_surveys_query->count();
            //$total_surveys_query
            //    ->whereRaw("date(created_at) = (select max(date(created_at)) from surveys )")
            //    ;
        $today = Carbon::now()->format('Y-m-d');
        $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
            //$today_surveys = $total_surveys_query->count();
        $questions = Question::where(['unit_id'=>$current_unit])->get();
        $questiontype = CodeMaster::where('type','=','exit_survey')->get();
        $question_exit = [];
        foreach ($questiontype as $element) {
            $question_exit[$element->key] = QuestionExit::where('unit_id','=',$current_unit)
            ->where('type','=',$element->key)->get();
        }

            // Get total exit_survey
        $total_exit_surveys_query = ExitSurvey::join('patient_details','patient_details.pid','=','exitsurvey.pid')
        ->where('lid',$current_unit);
        $total_surveys += $total_exit_surveys_query->count();
        $total_exit_surveys_query->whereDate('date','=',$today);
        $today_surveys += $total_exit_surveys_query->count();
    }
    return view('admin.survey.index',compact('total_surveys','today_surveys','questions','questiontype','question_exit'));
}
// public function getData($keytab = null)
// {
//     $key = \Request::get('id');        
//     //dd($key);
//     if($key){
//         if(\Auth::user()->type() == 'super-admin'){            
//             \Session::set('current_unit',$key);

//         }
//         else if(\Auth::user()->type() == 'super-executive'){
//             \Session::set('current_fac',$key);
            
//         }
//     }
//     $fac_id = \Session::get('current_fac');
//     $unit_id =  \Session::get('current_unit');
//     if(\Auth::user()->type() == 'super-executive' || $unit_id == '0'){
//         $unit_id = '%';
//     }
    
//     $surveys = \DB::select("SELECT code.value as unitname, a.employee_id, concat( b.firstname,'  ',b.lastname) as name, 
//         d.value as discipline, 
//         DATE_FORMAT(a.created_at,'%m/%d/%Y %H:%i:%s %p') as date,
//         q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, avg_rating, e.value as insurance
//         FROM surveys a
//         LEFT JOIN employee_master b on a.employee_id = b.id
//         LEFT JOIN patient_details c on c.pid = a.patient_id
//         LEFT JOIN code_master d on d.type = 'discipline' and a.discipline = d.key and d.refkey = '$unit_id'
//         LEFT JOIN code_master e on e.type = 'insurance' and e.key = a.insurance_id
//         LEFT JOIN  code_master code on code.key = a.unit_id and code.type = 'unit'
//         where a.fac_id = $fac_id and a.unit_id like '$unit_id' 
//         order by a.created_at desc ");
        
//     $surveys_rate = \DB::select("SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
//         avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
//         from surveys where fac_id = $fac_id and unit_id like '$unit_id'");
//     $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
//         //$surveys_count = Survey::where('fac_id',$fac_id)->max('q_count');
//     $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
//         SELECT count(q.qid) as value from question q
//         where q.enabled = 1 and fac_id = $fac_id and unit_id like '$unit_id'
//         group by q.unit_id
//         ) max_table");        
//     if(count($surveys_count) > 0){
//         $surveys_count = $surveys_count[0]->max_value;
//     }else
//     {
//         $surveys_count= 0;
//     }

//     $exitsurvey = \DB::select("SELECT code.value as unitname, a.id, a.q1, a.q2, a.q3, a.q4, a.q5, a.q6, a.q7,
//         a.q8, a.q9, a.q10, a.q11, a.q12, a.q13, a.q14, a.q15, a.q16, a.q17,
//         a.q18, a.q19, a.q20, a.q21, a.q22, a.q23, a.q24, a.q25, a.q26, a.q27,
//         a.q28, a.q29, a.q30, a.qcount,  DATE_FORMAT(a.date,'%m/%d/%Y %H:%i:%s %p') as date,
//         c.value,a.type,
//         (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
//         +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
//         as avg_rating from exitsurvey a
//         LEFT JOIN patient_details b on  a.pid = b.pid
//         LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
//         LEFT JOIN code_master code on code.type = 'unit' and code.key = b.lid
//         where a.fac_id = $fac_id and a.unit_id like '$unit_id'
//         order by a.date desc ");
//         //dd($exitsurvey);
//         //$exit_count = ExitSurvey::where('fac_id',$fac_id)->max('qcount');
//     $exit_count = \DB::select("SELECT max(value) as max_value FROM (
//         SELECT count(q.qid) as value from exit_question q
//         where q.enabled = 1 and fac_id = $fac_id and unit_id like '$unit_id'
//         group by q.unit_id
//         ) max_table");        
//     if(count($exit_count) > 0){
//         $exit_count = $exit_count[0]->max_value;
//     }else
//     {
//         $exit_count = 0;
//     }
//     $exit_avg = \DB::select("SELECT  avg(q1)/5*100 q1, avg(q2)/5*100 q2, avg(q3)/5*100 q3,
//         avg(q4)/5*100 q4, avg(q5)/5*100 q5, avg(q6)/5*100 q6 , 
//         avg(q7)/5*100 q7, avg(q8)/5*100 q8, avg(q9)/5*100 q9 ,
//         avg(q10)/5*100 q10, avg(q2)/5*100 q11, avg(q12)/5*100 q12 ,
//         avg(q13)/5*100 q13, avg(q14)/5*100 q14, avg(q15)/5*100 q15 ,
//         avg(q16)/5*100 q16, avg(q17)/5*100 q17, avg(q18)/5*100 q18 ,
//         avg(q19)/5*100 q19, avg(q20)/5*100 q20, avg(q21)/5*100 q21 ,
//         avg(q22)/5*100 q22, avg(q23)/5*100 q23, avg(q24)/5*100 q24 ,
//         avg(q25)/5*100 q25, avg(q26)/5*100 q26, avg(q27)/5*100 q27 ,
//         avg(q28)/5*100 q28, avg(q29)/5*100 q29, avg(q30)/5*100 q30
//         from exitsurvey where fac_id = $fac_id and unit_id like '$unit_id'");
//     $exit_avg = json_decode(json_encode($exit_avg[0]), true);
//     $patient_data = \DB::select("               SELECT code.value as unitname ,rate.type, rate.value, date, round(avg_rating,0) as avg_rating, round(avg_rating1) as avg_rating1 FROM 
//         (
//         SELECT a.unit_id as lid,  a.type, c.value, DATE_FORMAT(a.created_at,'%m/%d/%Y %H:%i:%s %p') as date, avg_rating, 0 as avg_rating1  
//         FROM surveys a
//         LEFT JOIN patient_details b on a.unit_id = b.lid and a.patient_id = b.pid
//         LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
//         where a.fac_id = $fac_id and a.unit_id like '$unit_id'
//         union all 

//         SELECT b.lid,a.type, c.value, DATE_FORMAT(a.date,'%m/%d/%Y %H:%i:%s %p') as date, 0 as avg_rating,
//         (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
//         +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
//         as avg_rating1 from exitsurvey a
//         LEFT JOIN patient_details b on  a.pid = b.pid
//         LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
//         where a.fac_id = $fac_id and a.unit_id like '$unit_id'
//         ) rate 
//         left join code_master code on code.key = lid and code.type ='unit'
//         order by date desc");
//     $overall_exit_patient = \DB::select("SELECT round(avg((q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
//         +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100),0) as value
//         from exitsurvey where fac_id = $fac_id and unit_id like '$unit_id'");
//     $overall_exit_patient = $overall_exit_patient[0]->value;
// /*
//     $overall_patient = Survey::where('fac_id',$fac_id)
//                      ->where('unit_id','like', $unit_id)
//                      ->avg('avg_rating');
// */

//     return view('admin.survey.data',compact('surveys','surveys_rate','surveys_count','exitsurvey','exit_count','exit_avg','patient_data','overall_exit_patient','overall_patient','keytab'));
// }

//Demon Dragon 20170615
public function getData(Request $request, $keytab = null)
{
    $key = \Request::get('id');
    if($key){
        if(\Auth::user()->type() == 'super-admin' ||
            \Cache::get('function_amada') == 1){
            \Session::set('current_unit',$key);

        } else if(\Auth::user()->type() == 'super-executive'){
            \Session::set('current_fac',$key);
        }

        if($keytab){
            \Session::set('keytab', $keytab);
        } else{
            \Session::forget('keytab');   
        }
        return redirect('/admin/data');
    }
    if(\Session::has('keytab'))
        $keytab = \Session::get('keytab');
    $fac_id = \Session::get('current_fac');
    $unit_id =  \Session::get('current_unit');
    if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $unit_id == '0'){
        $unit_id = '%';
    }

//    if($fac_id != 0){
//        $surveys = \DB::select("SELECT code.value as unitname, a.employee_id, concat( b.firstname,'  ',b.lastname) as name,
//            d.value as discipline,
//            DATE_FORMAT(a.created_at,'%m/%d/%Y %h:%i:%s %p') as date,
//            q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, avg_rating, e.value as insurance
//            FROM surveys a
//            JOIN employee_master b on a.employee_id = b.id
//            LEFT JOIN patient_details c on c.pid = a.patient_id
//            JOIN code_master d on d.type = 'discipline' and a.discipline = d.key
//            LEFT JOIN code_master e on e.type = 'insurance' and e.key = a.insurance_id
//            LEFT JOIN code_master code on code.key = a.unit_id and code.type = 'unit'
//            where a.fac_id = $fac_id and a.unit_id like '$unit_id'
//            order by a.created_at desc ");
//    }else{
//  	    $surveys = \DB::select("SELECT fac.value as facilityname, code.value as unitname, a.employee_id, concat( b.firstname,'  ',b.lastname) as name,
//            d.value as discipline,
//            DATE_FORMAT(a.created_at,'%m/%d/%Y %h:%i:%s %p') as date,
//            q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, avg_rating, e.value as insurance
//            FROM surveys a
//            JOIN employee_master b on a.employee_id = b.id
//            LEFT JOIN patient_details c on c.pid = a.patient_id
//            JOIN code_master d on d.type = 'discipline' and a.discipline = d.key
//            LEFT JOIN code_master e on e.type = 'insurance' and e.key = a.insurance_id
//            LEFT JOIN code_master code on code.key = a.unit_id and code.type = 'unit'
//            JOIN code_master fac on fac.key = a.fac_id and fac.type = 'facility'
//            where a.unit_id like '$unit_id'
//            order by a.created_at desc ");
//    }

    $request_data = array();


            if($fac_id != 0){
                $query = Survey::select([
                    'code.value as unitname',
                    'surveys.employee_id',
                    \DB::raw('concat(b.firstname,\' \',b.lastname) as name'),
                    'd.value as discipline',
                    \DB::raw('DATE_FORMAT(surveys.created_at,\'%m/%d/%Y %h:%i:%s %p\') as date'),
                    'q1', 'q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8', 'q9', 'q10', 'avg_rating',
                    'e.value as insurance',
                    'b.job as job'
                ]);
            }else{
                $query = Survey::select([
                    'code.value as unitname',
                    'surveys.employee_id',
                    \DB::raw('concat(b.firstname,\' \',b.lastname) as name'),
                    'd.value as discipline',
                    \DB::raw('DATE_FORMAT(surveys.created_at,\'%m/%d/%Y %h:%i:%s %p\') as date'),
                    'q1', 'q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8', 'q9', 'q10', 'avg_rating',
                    'e.value as insurance',
                    'b.job as job',
                    'fac.key as fac_id'
                ]);
            }

            $query->leftJoin('employee_master as b', 'surveys.employee_id', '=', 'b.id')
            ->leftJoin('patient_details', 'patient_details.pid', '=', 'surveys.patient_id')
            ->join('code_master as d', function ($join) {
                $join->on('surveys.discipline', '=', 'd.key')
                    ->where('d.type', '=', 'discipline');
            })
            ->leftJoin('code_master as e', function ($join) {
                $join->on('surveys.insurance_id', '=', 'e.key')
                    ->where('e.type', '=', 'insurance');
            })
            ->leftJoin('code_master as code', function ($join) {
                $join->on('surveys.unit_id', '=', 'code.key')
                    ->where('code.type', '=', 'unit');
            });

            if($fac_id != 0){
                $query->where('surveys.fac_id', $fac_id);
            }else{
                $query->leftJoin('code_master as fac', function ($join){
                    $join->on('surveys.fac_id', '=', 'fac.key')
                        ->where('fac.type', '=', 'facility');
                });
            }

            //Unit
            if($request->unit && $request->unit[0] != 'all'){
                $query->where(function ($employees) use ($request){
                    foreach ($request->unit as $item=>$key){
                        $employees->orWhere('surveys.unit_id',"$key");
                    }
                });
                $request_data['unit'] = $request->unit;
            }else if($request->unit && $request->unit[0] == 'all'){
                $request_data['unit'][0] = $request->unit[0];
            }

            //Name
            if($request->name && $request->name[0] != 'all'){
                $query->whereIn('surveys.employee_id',$request->name);
                $request_data['name'] = $request->name;
            }else if($request->name && $request->name[0] == 'all'){
                $request_data['name'][0] = $request->name[0];
            }

            //Disciplines
            if($request->discipline && $request->discipline[0] != 'all'){
                $query->where(function ($employees) use ($request) {
                    foreach ($request->discipline as $item => $key) {
                        $employees->orWhere('surveys.discipline', $key);
                    }
                });
                $request_data['discipline'] = $request->discipline;
            }else if($request->discipline && $request->discipline[0] == 'all'){
                $request_data['discipline'][0] = $request->discipline[0];
            }

            //Job title
            if($request->job_title && $request->job_title[0] != 'all'){
                $query->whereIn('b.job',$request->job_title);
                $request_data['job_title'] = $request->job_title;
            }else if($request->job_title && $request->job_title[0] == 'all'){
                $request_data['job_title'][0] = $request->job_title[0];
            }

            $query->orderby('surveys.created_at', 'desc');

    $surveys = $query->get();

    $surveys_rate = \DB::select("SELECT avg(CASE WHEN q1 <> 0 THEN q1 ELSE NULL END)/5*100 as q1, 
                                avg(CASE WHEN q2 <> 0 THEN q2 ELSE NULL END)/5*100 as q2,
                                avg(CASE WHEN q3 <> 0 THEN q3 ELSE NULL END)/5*100 as q3,
                                avg(CASE WHEN q4 <> 0 THEN q4 ELSE NULL END)/5*100 as q4,
                                avg(CASE WHEN q5 <> 0 THEN q5 ELSE NULL END)/5*100 as q5,
                                avg(CASE WHEN q6 <> 0 THEN q6 ELSE NULL END)/5*100 as q6,
                                avg(CASE WHEN q7 <> 0 THEN q7 ELSE NULL END)/5*100 as q7,
                                avg(CASE WHEN q8 <> 0 THEN q8 ELSE NULL END)/5*100 as q8,
                                avg(CASE WHEN q9 <> 0 THEN q9 ELSE NULL END)/5*100 as q9,
                                avg(CASE WHEN q10 <> 0 THEN q10 ELSE NULL END)/5*100 as q10
    from surveys where fac_id = $fac_id and unit_id like '$unit_id'");
    $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
    $surveys_count = Survey::where('fac_id',$fac_id)->max('q_count');
	if($fac_id != 0){
	    $exitsurvey = \DB::select("SELECT fac.value as facilityname, code.value as unitname, a.id, a.q1, a.q2, a.q3, a.q4, a.q5, a.q6, a.q7,
	    a.q8, a.q9, a.q10, a.q11, a.q12, a.q13, a.q14, a.q15, a.q16, a.q17,
	    a.q18, a.q19, a.q20, a.q21, a.q22, a.q23, a.q24, a.q25, a.q26, a.q27,
	    a.q28, a.q29, a.q30, a.qcount,  DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') as date,
	    c.value,a.type,
	    (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
	    +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
	    as avg_rating from exitsurvey a
	    LEFT JOIN patient_details b on  a.pid = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    LEFT JOIN code_master code on code.type = 'unit' and code.key = b.lid
	    left join code_master fac on fac.key = a.fac_id and fac.type ='facility'
	    where a.fac_id = $fac_id and a.unit_id like '$unit_id'
	    order by a.date desc ");
    }
    else{
    	$exitsurvey = \DB::select("SELECT fac.value as facilityname, code.value as unitname, a.id, a.q1, a.q2, a.q3, a.q4, a.q5, a.q6, a.q7,
	    a.q8, a.q9, a.q10, a.q11, a.q12, a.q13, a.q14, a.q15, a.q16, a.q17,
	    a.q18, a.q19, a.q20, a.q21, a.q22, a.q23, a.q24, a.q25, a.q26, a.q27,
	    a.q28, a.q29, a.q30, a.qcount,  DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') as date,
	    c.value,a.type,
	    (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
	    +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
	    as avg_rating from exitsurvey a
	    LEFT JOIN patient_details b on  a.pid = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    LEFT JOIN code_master code on code.type = 'unit' and code.key = b.lid
	    left join code_master fac on fac.key = a.fac_id and fac.type ='facility'
	    where a.fac_id = $fac_id and a.unit_id like '$unit_id'
	    order by a.date desc ");

    }
    //dd($exitsurvey);
    //$exit_count = ExitSurvey::where('fac_id',$fac_id)->max('qcount');
    $exit_count = \DB::select("SELECT max(value) as max_value FROM (
    SELECT count(q.qid) as value from exit_question q
    where q.enabled = 1 and fac_id = $fac_id and unit_id like '$unit_id'
    group by q.unit_id
    ) max_table");
    if(count($exit_count) > 0){
        $exit_count = $exit_count[0]->max_value;
    }else
    {
        $exit_count = 0;
    }
    $exit_avg = \DB::select("SELECT  avg(q1)/5*100 q1, avg(q2)/5*100 q2, avg(q3)/5*100 q3,
    avg(q4)/5*100 q4, avg(q5)/5*100 q5, avg(q6)/5*100 q6 , 
    avg(q7)/5*100 q7, avg(q8)/5*100 q8, avg(q9)/5*100 q9 ,
    avg(q10)/5*100 q10, avg(q2)/5*100 q11, avg(q12)/5*100 q12 ,
    avg(q13)/5*100 q13, avg(q14)/5*100 q14, avg(q15)/5*100 q15 ,
    avg(q16)/5*100 q16, avg(q17)/5*100 q17, avg(q18)/5*100 q18 ,
    avg(q19)/5*100 q19, avg(q20)/5*100 q20, avg(q21)/5*100 q21 ,
    avg(q22)/5*100 q22, avg(q23)/5*100 q23, avg(q24)/5*100 q24 ,
    avg(q25)/5*100 q25, avg(q26)/5*100 q26, avg(q27)/5*100 q27 ,
    avg(q28)/5*100 q28, avg(q29)/5*100 q29, avg(q30)/5*100 q30
    from exitsurvey where fac_id = $fac_id and unit_id like '$unit_id'");
    $exit_avg = json_decode(json_encode($exit_avg[0]), true);
    
    if($fac_id != 0){
	    $patient_data = \DB::select("SELECT fac.value as facilityname, code.value as unitname ,rate.type, rate.value, date, round(avg_rating,0) as avg_rating, round(avg_rating1) as avg_rating1 FROM 
	    (
	    SELECT a.fac_id, a.unit_id as lid,  a.type, c.value, DATE_FORMAT(a.created_at,'%m/%d/%Y %h:%i:%s %p') as date, avg_rating, 0 as avg_rating1  
	    FROM surveys a
	    LEFT JOIN patient_details b on a.unit_id = b.lid and a.patient_id = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    where a.fac_id = $fac_id and a.unit_id like '$unit_id'
	    union all 

	    SELECT a.fac_id, b.lid,a.type, c.value, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') as date, 0 as avg_rating,
	    (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
	    +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
	    as avg_rating1 from exitsurvey a
	    LEFT JOIN patient_details b on  a.pid = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    where a.fac_id = $fac_id and a.unit_id like '$unit_id'
	    ) rate 
	    left join code_master code on code.key = lid and code.type ='unit'
	    left join code_master fac on fac.key = fac_id and fac.type ='facility'
	    order by date desc");
    }
    else
    {
	    $patient_data = \DB::select("SELECT fac.value as facilityname, code.value as unitname ,rate.type, rate.value, date, round(avg_rating,0) as avg_rating, round(avg_rating1) as avg_rating1 FROM 
	    (
	    SELECT a.fac_id, a.unit_id as lid,  a.type, c.value, DATE_FORMAT(a.created_at,'%m/%d/%Y %h:%i:%s %p') as date, avg_rating, 0 as avg_rating1  
	    FROM surveys a
	    LEFT JOIN patient_details b on a.unit_id = b.lid and a.patient_id = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    where a.unit_id like '$unit_id'
	    union all 

	    SELECT a.fac_id, b.lid,a.type, c.value, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') as date, 0 as avg_rating,
	    (q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
	    +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100
	    as avg_rating1 from exitsurvey a
	    LEFT JOIN patient_details b on  a.pid = b.pid
	    LEFT JOIN code_master c on c.type = 'insurance' and c.key = a.insurance_id
	    where a.unit_id like '$unit_id'
	    ) rate 
	    left join code_master code on code.key = lid and code.type ='unit'
	    left join code_master fac on fac.key = fac_id and fac.type ='facility'
	    order by date desc");
    }

    $overall_exit_patient = \DB::select("SELECT round(avg((q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18
    +q19+q20+q21+q22+q23+q24+q25+q26+q27+q28+q29+q30) / (qcount*5) * 100),0) as value
    from exitsurvey where fac_id = $fac_id and unit_id like '$unit_id'");

    $overall_exit_patient = $overall_exit_patient[0]->value;
    /*
        $overall_patient = Survey::where('fac_id',$fac_id)
                            ->where('unit_id','like', $unit_id)
                            ->avg('avg_rating');
    */

    $facility = CodeMaster::where('type','facility')->orderby('value')->get();
    $employees = Employee::get();
    $job_titles = CodeMaster::where('type','job_title')->orderby('value')->get();

    return view('admin.survey.data',
        compact('surveys','surveys_rate','surveys_count','exitsurvey','exit_count','exit_avg','patient_data','overall_exit_patient','overall_patient','keytab', 'facility', 'employees', 'job_titles',
            'request_data'
            )
    );
}

// Insert new survey question
public function add()
{
    $units = \Input::get('units');      
    $units = json_decode(stripslashes($units));
    $unit_type = \Input::get('unit_type');
    $units = $units[0];

    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $question = new Question();
            $question->qid = Question::generateQuestionId();
            if(\Input::get('css_class')){
                $question->css_class = \Input::get('css_class');
            }
            $question->orderby = \Input::get('orderby');
            $question->question = \Input::get('content');
            $question->unit_id = $units[$i]->id;
            $question->fac_id = \Session::get('current_fac');
            $question->save();
        }
    }
    return response()->json(['success'=>true,'id'=>\Input::get('id')]);

}

public function add_exit()
{
    $type = \Input::get('type');
    $units = \Input::get('units');      
    $units = json_decode(stripslashes($units));
    $unit_type = \Input::get('unit_type');
    $units = $units[0];
  
    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $question = new QuestionExit();
            $question->qid = QuestionExit::generateQuestionId();
            if(\Input::get('css_class')){
                $question->css_class = \Input::get('css_class');
            }
            $question->orderby = \Input::get('orderby');
            $question->unit_id = $units[$i]->id;
            $question->type = $type;
            $question->question = \Input::get('content');
            $question->fac_id = \Session::get('current_fac');
            $question->save();  
        }
 }
 return response()->json(['success'=>true,'id'=>\Input::get('id')]);

}
// Edit question with SURVEY QUESTIONS
public function save($question)
{
    $units = \Input::get('units');      
    $units = json_decode(stripslashes($units));
    $units = $units[0];
    $unit_type = \Input::get('unit_type');    
    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $q = Question::where('unit_id','=',$units[$i]->id)
            ->where('qid','=',\Input::get('qid'))->get();
            if($q->count() > 0)
                $q = $q[0];
            else{
                $q = new Question();
                $q->unit_id = $units[$i]->id;
                $q->qid = \Input::get('qid');    
            }
            if(\Input::get('css_class')){
                $q->css_class = \Input::get('css_class');
            }
            $q->orderby = \Input::get('orderby');    
            $q->question = \Input::get('content');           
            $q->fac_id = \Session::get('current_fac'); 
            $q->save();
        }
    }
    return response()->json(['success'=>true,'message'=>'Survey has changed!']);
}


// Edit Exit survey
public function save_exit($question_exit)
{       
    $type = \Input::get('type');
    $units = \Input::get('units');      
    $units = json_decode(stripslashes($units));
    $unit_type = \Input::get('unit_type');
    $units = $units[0];
    
    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $q = QuestionExit::where('unit_id','=',$units[$i]->id)
            ->where('qid','=',\Input::get('qid'))
            ->where('type','=',$type)
            ->get();            
            if($q->count() > 0)
                $q = $q[0];
            else{
                $q = new QuestionExit;
                $q->qid = \Input::get('qid');
                $q->unit_id = $units[$i]->id;
            }       
            
            $q->type = $type;
            if(\Input::get('css_class')){
                $q->css_class = \Input::get('css_class');
            }
            $q->orderby = \Input::get('orderby');         
            $q->question = \Input::get('content');            
            $q->fac_id = \Session::get('current_fac');
            $q->save();
        }
    }

return response()->json(['success'=>true,'message'=>'Survey has been Updated!']);
}

// update status of enable or disable question
public function update($question)
{    
    $units = \Input::get('units');
    $unit_type = \Input::get('unit_type');      
    $units = json_decode(stripslashes($units));
    $units = $units[0];
    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $q = Question::where('unit_id','=',$units[$i]->id)
            ->where('qid','=',$question->qid)->get();
            if($q->count() > 0){
                $q = $q[0];
                if(\Input::get('css_class')){
                    $q->css_class = \Input::get('css_class');
                }
                $q->enabled = \Input::get('check');
                $q->save();
            }
        }
 
    }
    return response()->json(['success'=>true,'message'=>'Survey has changed!']);
}

// update status of enable or disable exit question
public function update_exit($id)
{    
    
    $questionExit = QuestionExit::where('id','=',$id)->first();
    //dd($questionExit->qid);
    $type = \Input::get('type');
    $q;
    $units = \Input::get('units');      
    $units = json_decode(stripslashes($units));
    $unit_type = \Input::get('unit_type');
    $units = $units[0];
    for ($i=0; $i < count($units); $i++) { 
        if($units[$i]->checked == 1 || $unit_type == 'all'){
            $q = QuestionExit::where('unit_id','=',$units[$i]->id)
            ->where('qid','=',$questionExit->qid)
            ->where('type','=',$type)->get();
            if($q->count() > 0){
                $q = $q[0];
                if(\Input::get('css_class')){
                    $q->css_class = \Input::get('css_class');
                }
                $q->enabled = \Input::get('check');
                $q->save();                    
            }
        }
  
    }
    return response()->json(['success'=>true,'message'=>'Survey has changed!' ]);
}

public function delete($survey)
{
    if($survey->answers()->delete()){
        $pecks = $survey->total;
        if($survey->has('employee')){
            $employee = $survey->employee;
            $employee->pecks = $employee->pecks - $pecks;
        }
        if($survey->delete()){
            $employee->save();
            return response()->json(['success'=>true,'message'=>'Survey deleted successfully.']);
        }
    }
    return response()->json(['success'=>false,'message'=>'Survey deleted unsuccessfully.']);
}
public function graph($period='date')
{
    return response(Survey::graph($period));
}

}
