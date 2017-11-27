<?php

namespace App\Http\Controllers\Admin;
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
use Carbon\Comments;
use Intervention\Image\Facades\Image;

class CommentsController extends Controller
{
	function __construct()
    {
    	\View::composers([                       
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\ShowAllUnits'  => ['admin.*'],
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\Facility'  => ['admin.*'],
        ]);
    }

    public function getData()
    {
        if(Auth::user()->type() =='super-executive' && \Session::has('current_fac')){
            if(\Session::get('current_fac') != 0){
                $fac_id = \Session::get('current_fac');
            }
        }else if (Auth::user()->type() =='super-admin'){
            $fac_id = Auth::user()->fac_id;
        }
        if(\Session::has('current_unit')){
            $unit_id = \Session::get('current_unit');
        }else{
            $unit_id = \Auth::user()->units[0];
        }
        if($unit_id == 0){
            $unit_id = '%';
        }
        if(isset($fac_id)){
            $cmtall = \DB::select("SELECT DISTINCT a.id cm_id, a.cpc_status, a.cmt_description, b.firstname, b.lastname, c.value job_title, b.disciplines, b.image,
                                    e.value insurance, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') date from comments a 
                                    inner join employee_master b on a.employee_id = b.id
                                    left join code_master c on b.job = c.key and c.type ='job_title'
                                    left join patient_details d on a.patient_id = d.pid
                                    left join code_master e on d.insurance_id = e.key and e.type = 'insurance'
                                    where a.employee_id is not null and b.units like '%\"$unit_id\"%' and b.fac_id = $fac_id  
                                    order by a.date desc");
        }else {
            $cmtall = \DB::select("SELECT DISTINCT a.id cm_id, a.cpc_status, a.cmt_description, b.firstname, b.lastname, c.value job_title, b.disciplines, b.image,
                                    e.value insurance, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') date from comments a 
                                    inner join employee_master b on a.employee_id = b.id
                                    left join code_master c on b.job = c.key and c.type ='job_title'
                                    left join patient_details d on a.patient_id = d.pid
                                    left join code_master e on d.insurance_id = e.key and e.type = 'insurance'
                                    where a.employee_id is not null and b.units like '%\"$unit_id\"%' 
                                    order by a.date desc");
        }
        $cmtother = \DB::select("SELECT DISTINCT a.id as cm_id, a.cpc_status, a.cmt_description, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') date, e.value insurance
                                     from comments a 								
                                     left join patient_details d on a.patient_id = d.pid
                                    left join code_master e on d.insurance_id = e.key and e.type = 'insurance'
                                    where a.employee_id is null 
                                    order by a.date desc");


		if(\Cache::get('function_amada') == 1){
    		$disciplines = CodeMaster::where('type','discipline')->where('refkey',\Session::get('current_unit'))->get();

    	}
		else{
    		$disciplines = CodeMaster::where('type','=','discipline')->get();
    	}


        if(isset($fac_id)) {
            $data = [];
            foreach ($disciplines as $key) {
                $data[$key->key] = \DB::select("SELECT DISTINCT a.id cm_id, a.cpc_status, a.cmt_description, b.firstname, b.lastname, c.value job_title, b.disciplines, b.image,
                                    e.value insurance, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') date from comments a 
                                    inner join employee_master b on a.employee_id = b.id
                                    left join code_master c on b.job = c.key and c.type ='job_title' and c.notes = $key->key
                                    left join patient_details d on a.patient_id = d.pid
                                    left join code_master e on d.insurance_id = e.key and e.type = 'insurance'                                
                                    where a.employee_id is not null and 
                                    disciplines like concat('%',$key->key,'%') 
                                    and b.units like '%$unit_id%' and b.fac_id = $fac_id  
                                    order by a.date desc");
            }
        }else{
            $data = [];
            foreach ($disciplines as $key) {
                $data[$key->key] = \DB::select("SELECT DISTINCT a.id cm_id, a.cpc_status, a.cmt_description, b.firstname, b.lastname, c.value job_title, b.disciplines, b.image,
                                    e.value insurance, DATE_FORMAT(a.date,'%m/%d/%Y %h:%i:%s %p') date from comments a 
                                    inner join employee_master b on a.employee_id = b.id
                                    left join code_master c on b.job = c.key and c.type ='job_title' and c.notes = $key->key
                                    left join patient_details d on a.patient_id = d.pid
                                    left join code_master e on d.insurance_id = e.key and e.type = 'insurance'                                
                                    where a.employee_id is not null and 
                                    disciplines like concat('%',$key->key,'%') 
                                    and b.units like '%$unit_id%' 
                                    order by a.date desc");
            }
        }

    	return view('admin.survey.comments', compact('cmtall','data','disciplines','cmtother'));
    }

    public function postOnNewsfeed(Request $request){
	    $id = $request->id;
	    if($id){
            $cm_data = \App\Comments::where('id',$id)->with('employee')->first();
            if($cm_data){
                $news = new News;
                $news->content = '<p>'.$cm_data->cmt_description.'</p>';
                $news->title = $cm_data->employee->firstname.' '.$cm_data->employee->lastname;
                $news->units = $cm_data->employee->units;
                $news->fac_id = 1;
                $news->type = 'employee';
                $news->image = $cm_data->employee->image;
                $news->save();
                if($cm_data->employee->image) {
                    if (!is_dir('uploads/news/' . $news->id)) {
                        mkdir('uploads/news/' . $news->id);
                    }
                    $file = Image::make('uploads/profiles/' . $cm_data->employee->image)->save('uploads/news/' . $news->id . '/' . $cm_data->employee->image);
                }

                $news_tag = new NewsFeedTag;
                $news_tag->news_id = $news->id;
                $news_tag->users_id = $cm_data->employee->id;
                $news_tag->save();
            }else{
                return response()->json(['status' => 'error']);
            }
            return response()->json(['status' => 200]);
        }else{
            return response()->json(['status' => 'error']);
        }
    }

    public function loadDataComment(Request $request){
        $id = $request->id;
        $cm_data = \App\Comments::where('id',$id)->with('employee')->first();
        if($cm_data){
            return response()->json(['status' => 200, 'data' => $cm_data]);
        }else{
            return response()->json(['status' => 'error']);
        }
    }
}