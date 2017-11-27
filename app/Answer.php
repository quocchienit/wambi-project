<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Employee;

class Answer extends Model
{
    protected $table = 'answers';
    public $timestamps = false;
    public static function rating($params)
    {
    	return 100*\DB::table('answers')->where($params)->avg('peck')/config('award.max_peck');
    }

// move this method into employee class
/*
    public static function rating_by_employee($employee_id)
    {
        $max_peck = config('award.max_peck');
        //$ratings = \DB::select("SELECT q.qid,round(100*avg(peck)/$max_peck,2) rating,q.question,q.css_class FROM question q LEFT JOIN answers a ON q.qid = a.qid and a.eid='$employee_id' GROUP BY q.qid");
        $employee = Employee::where('id',$employee_id)->get();

        $unit_id = implode("','",$employee[0]->units);
        $unit_id = "'".$unit_id."'";
        $ratings = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rating,q.question,q.css_class FROM question q 
            LEFT JOIN answers a ON q.qid = a.qid  and a.eid = $this->id 
            where q.enabled = 1 
        	and q.unit_id in ($unit_id)
        	and a.eid='$employee_id'  
        	GROUP BY q.qid");
        return $ratings;
    }
 */
    public static function rating_question_by_unit($unit_id)
    {
    	$result = [];
    	$max_peck = config('award.max_peck');
    	if(\Cache::get('function_amada') == 1)
    	{
	        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
	            || $unit_id == 0){            
	            $fac_id = \Session::get('current_fac');
	            $ratings = \DB::select("SELECT c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,
	                                    q.question,q.css_class 
	                                FROM code_master c 
	                                LEFT JOIN  answers a ON c.key = a.catid and a.fac_id = '$fac_id'
	                                inner JOIN question q ON q.qid = a.qid and q.unit_id= a.unit_id and a.fac_id = q.fac_id
	                                where c.type = 'discipline'  and q.enabled = 1                                
	                                GROUP BY c.key,a.qid
	                                order by c.key,a.qid");
	        }else{
	            $ratings = \DB::select("SELECT c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                                FROM code_master c 
	                                LEFT JOIN  answers a ON c.key = a.catid and a.unit_id = '$unit_id'    
	                                inner JOIN question q ON q.qid = a.qid and q.unit_id='$unit_id' 
	                                where c.type = 'discipline'  and q.enabled = 1 and c.refkey = '$unit_id'
	                                GROUP BY c.key,a.qid
	                                order by c.key,a.qid");
	        }
	        
	    	foreach ($ratings as $key => $value) {
	    		$result[$value->categoryname][$value->qid] = $value;
	    	}

	    	return $result;
    	}
    	else
    	{
    		if(\Auth::user()->type() == 'super-executive' || $unit_id == 0){
	            $fac_id = \Session::get('current_fac');
	            $ratings = \DB::select("SELECT c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,
	                                    q.question,q.css_class 
	                                FROM code_master c 
	                                LEFT JOIN  answers a ON c.key = a.catid and a.fac_id = '$fac_id'
	                                inner JOIN question q ON q.qid = a.qid and q.unit_id= a.unit_id and a.fac_id = q.fac_id
	                                where c.type = 'discipline'  and q.enabled = 1                                
	                                GROUP BY c.key,q.css_class
	                                order by c.key,a.qid");
	        }else{
	            $ratings = \DB::select("SELECT c.value categoryname,a.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                                FROM code_master c 
	                                LEFT JOIN  answers a ON c.key = a.catid and a.unit_id = $unit_id    
	                                inner JOIN question q ON q.qid = a.qid and q.unit_id = $unit_id 
	                                where c.type = 'discipline'  and q.enabled = 1
	                                GROUP BY c.key,q.css_class
	                                order by c.key,a.qid");
	        }
	        
	    	foreach ($ratings as $key => $value) {
	    		$result[$value->categoryname][$value->qid] = $value;
	    	}

	    	return $result;
    	}
    }
    public static function rating_question_by_discipline_unit($unit_id)
    {
    	$max_peck = config('award.max_peck');
    	if(\Cache::get('function_amada') == 1)
    	{
	        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $unit_id == 0){            
	            $fac_id = \Session::get('current_fac');
	            $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                               FROM question q 
	                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = q.unit_id 
	                               and a.fac_id = q.fac_id 
	                               WHERE q.fac_id ='$fac_id' and q.enabled = 1
	                               GROUP BY q.qid
	                               order by q.qid");
	        }else{
	            $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                               FROM question q 
	                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = '$unit_id' 
	                               WHERE q.unit_id ='$unit_id' and q.enabled = 1
	                               GROUP BY q.qid
	                               order by q.qid");
	        }
	    	return $result;
    	}
    	else
    	{
    		 if(\Auth::user()->type() == 'super-executive' || $unit_id == 0){            
	            $fac_id = \Session::get('current_fac');
                 $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class
	                               FROM question q
	                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = q.unit_id
	                               and a.fac_id = q.fac_id
	                               WHERE q.fac_id ='$fac_id' and q.enabled = 1
	                               GROUP BY q.css_class
	                               order by q.qid");
	        }else{
	            $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                               FROM question q 
	                               LEFT JOIN answers a ON  q.qid = a.qid and a.unit_id = '$unit_id' 
	                               WHERE q.unit_id ='$unit_id' and q.enabled = 1
	                               GROUP BY q.css_class
	                               order by q.qid");
	        }
	    	return $result;
    	}
    }

    public static function rating_question_by_discipline_unit_all()
    {
        $fac_id = \Auth::user()->fac_id;

        $max_peck = config('award.max_peck');
        if(\Cache::get('function_amada') == 1){
            $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
                               FROM question q 
                               LEFT JOIN answers a ON  q.qid = a.qid
                               WHERE q.enabled = 1
                               GROUP BY q.qid
                               order by q.qid");
            return $result;
        }else{
            $result = \DB::select("SELECT q.qid,round(avg(answer_id)/5 * 100,2) rate,q.question,q.css_class 
	                               FROM question q 
	                               LEFT JOIN answers a ON  q.qid = a.qid
	                               WHERE q.enabled = 1 and q.fac_id = $fac_id
	                               GROUP BY q.qid
	                               order by q.qid");
            return $result;
        }
    }
  
}
