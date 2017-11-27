<?php

namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use App\Question;

class Survey extends Model
{

    protected $table = "surveys";

    public function employee()
    {
    	return $this->belongsTo('App\Employee');
    }
    public function patient()
    {
    	return $this->belongsTo('App\Patient');
    }
    public function unit()
    {
    	# code...
    }
    public function discipline()
    {
    	# code...
    }
    public function answers()
    {
    	return $this->hasMany('App\Answer');
    }
   
    
     public static function colour($i)
    {    $c='';    
       	switch ($i) {
		    case 0:
		        $c= "#5d9cec";
		        break;
		    case 1:
		        $c= "#fb6d9d";
		        break;
		    case 2:
		        $c= "#34d3eb";
		        break;
		    case 3:
		        $c= "#5fbeaa";
		        break;
	        case 4:
		        $c= "#36404a";
		        break;
	        case 5:
		        $c= "#7266ba";
		        break;
	        case 6:
		        $c= "#81c868";
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
		return $c;
    }
    
    public static function graph_series_labels()
    {
    	// customize for amada client
    	if(\Cache::get('function_amada') == 1){
       		$disciplines = CodeMaster::where('type','=','discipline')->where('refkey',\Session::get('current_unit'))->get();
       	}
       	else
       	{
       		$disciplines = CodeMaster::where('type','=','discipline')->get();
       	}
       	$result='';
       	for ($i =0; $i < count($disciplines); $i++) {
   			$c = '<td class="legendColorBox">
                        <div style="border:1px solid null;padding:1px">
                            <div style="width:4px;height:0;border:5px solid '.Survey::colour($i).';overflow:hidden"></div>
                        </div>
                    </td>
                	<td class="legendLabel">'.$disciplines[$i]->value.'&nbsp;</td>
            		';
		   $result .=$c;
		}

        return $result;
    }

    public static function graph_series_labels_admin()
    {
        // customize for amada client
        if(\Cache::get('function_amada') == 1){
            $disciplines = CodeMaster::where('type','=','discipline')->where('refkey',\Session::get('current_unit'))->get();
        }
        else
        {
            $disciplines = CodeMaster::where('type','=','discipline')->get();
        }
        $result='';
        for ($i =0; $i < count($disciplines); $i++) {
            $c = '<td class="legendColorBox">
                        <div style="border:1px solid null;padding:1px">
                            <div style="width:4px;height:0;border:5px solid '.Survey::colour($i).';overflow:hidden"></div>
                        </div>
                    </td>
                	<td class="legendLabel">'.$disciplines[$i]->value.'&nbsp;</td>
            		';
            $result .=$c;
        }
        $result .= '<td class="legendColorBox">
                        <div style="border:1px solid null;padding:1px">
                            <div style="width:4px;height:0;border:5px solid '.Survey::colour($i).';overflow:hidden"></div>
                        </div>
                    </td>
                	<td class="legendLabel">All</td>
            		';

        return $result;
    }

    public static function graph_new(){
        $current_unit = \Session::get('current_unit');
        if(\Cache::get('function_amada') == 1){
            $disciplines = CodeMaster::where('type','=','discipline')
                ->where('refkey',$current_unit)->get();
        }
        else{
            $disciplines = CodeMaster::where('type','=','discipline')->get();
        }

        //$disciplines = CodeMaster::where('type','=','discipline')->get();
        $result = array();
        foreach ($disciplines as $d) {
            $s = Survey::series_new($d->key);
            $result['series'][] =  array_flatten($s[0]);
            $result['labels'] = $s[1];
            $result['title'] = $s[2];
        }
        return $result;
    }

    public static function series_new($discipline)
    {
        $start = Carbon::now();
        $start_date=$start;
        $labels = [];
        $item_score = [];
        $format = '';
        $title = '';

        $current_unit = \Session::get('current_unit');
        $current_fac = \Session::get('current_fac');
        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $current_unit == 0){
            $query = "select round(avg(avg_rating)) score 
                        from surveys 
                        where fac_id = $current_fac
                        and created_at >= '$start_date' 
                        and discipline = $discipline ";
        }else{
            $query = "select round(avg(avg_rating)) score from surveys where unit_id = $current_unit  and discipline = $discipline ";
        }
        //$period='week';
        //dd( $query);
//        switch ($period) {
//            case 'date':
                $title = $start->format("M d");
                $start->subDays(5);
                $start_date = $start->format('Y-m-d 00:00:00');
                $title = $start->format("M d - ").$title;

                for ($i=0; $i < 6; $i++) {
                    $key = $start->format('Y-m-d');
                    $labels[] = $start->format('M d');

                    $nurse_score_data = \DB::select($query." and DATE(created_at) <= DATE('$start_date')");
                    //dd( $query." and created_at <= '$start_date'");
                    if(count($nurse_score_data) > 0)
                        $item_score[$key] = $nurse_score_data[0]->score;
                    else
                        $item_score[$key] = 0;
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }

        $prev = 0;
        foreach ($item_score as $key => $value) {
            if($value > 0)
                $prev = $value;
            else
                $item_score[$key] = $prev;
        }

        $s[] = $item_score;
        $s[] = $labels;
        $s[] = $title;

        return $s;
    }

    public static function graph($period='date')
    {   
    	 $current_unit = \Session::get('current_unit');   
    	 
    	if(\Cache::get('function_amada') == 1){
    		$disciplines = CodeMaster::where('type','=','discipline')
    									->where('refkey',$current_unit)->get();

    	}
		else{
    			$disciplines = CodeMaster::where('type','=','discipline')->get();
    	}
    	
       	//$disciplines = CodeMaster::where('type','=','discipline')->get();
       	$result = array();
       	foreach ($disciplines as $d) {
       		$s = Survey::series($period,$d->key);
        	 $result['series'][] =  array_flatten($s[0]);
        	 $result['labels'] = $s[1];
        	 $result['title'] = $s[2];
   		}
        return $result;
    }

    public static function graph_admin($period='date')
    {
        $current_unit = \Session::get('current_unit');

        if(\Cache::get('function_amada') == 1){
            $disciplines = CodeMaster::where('type','=','discipline')
                ->where('refkey',$current_unit)->get();

        }
        else{
            $disciplines = CodeMaster::where('type','=','discipline')->get();
        }

        //$disciplines = CodeMaster::where('type','=','discipline')->get();
        $result = array();
        foreach ($disciplines as $d) {
            $s = Survey::series($period,$d->key);
            $result['series'][] =  array_flatten($s[0]);
            $result['labels'] = $s[1];
            $result['title'] = $s[2];
        }
        $tmp = array();
        $count = 0;
        if(count($result['series'])>0){
            foreach ($result['series'] as $item){
                if(count($item)>0){
                    $i=0;
                    foreach ($item as $value){
                        if($value == 0){
                            $count++;
                            break;
                        }
                        if(!isset($tmp[$i])){
                            $tmp[$i] = 0;
                        }
                        $tmp[$i] += $value;
                        $i++;
                    }
                }
            }
        }
        if(count($tmp)>0){
            for($i=0; $i<count($tmp); $i++){
                $tmp[$i] = ''.$tmp[$i]/(count($result['series'])-$count).'';
            }
        }
        $result['series'][count($result['series'])] = $tmp;
        return $result;
    }

     public static function series($period='date', $discipline)
    {        
        $start = Carbon::now();
        $start_date=$start;
        $labels = [];
        $item_score = [];
        $format = '';
        $title = '';
        
        $current_unit = \Session::get('current_unit');                
        $current_fac = \Session::get('current_fac');                
        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $current_unit == 0){
            $query = "select round(avg(avg_rating)) score 
                        from surveys 
                        where fac_id = $current_fac
                        and created_at >= '$start_date' 
                        and discipline = $discipline ";
        }else{
            $query = "select round(avg(avg_rating)) score from surveys where unit_id = $current_unit  and discipline = $discipline ";
        }
        //$period='week';
        //dd( $query);
        switch ($period) {
            case 'date':
                $title = $start->format("M d");
                $start->subDays(5);
                $start_date = $start->format('Y-m-d 00:00:00');
                $title = $start->format("M d - ").$title;
                
                for ($i=0; $i < 6; $i++) {
                    $key = $start->format('Y-m-d');
                    $labels[] = $start->format('M d');
                    
                    $nurse_score_data = \DB::select($query." and DATE(created_at) <= DATE('$start_date')");
        			//dd( $query." and created_at <= '$start_date'");
                    if(count($nurse_score_data) > 0)
                    	$item_score[$key] = $nurse_score_data[0]->score;
                    else	
                    	$item_score[$key] = 0;       
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
				}
				
                break;
            case 'week':
                $title = $start->format("F");
                $month = $start->format("m");
                $start->subWeeks(4)->addDay(1);
                if($start->format("m")<$month)
                    $title = $start->format("F - ").$title;
                $start_date = $start->format('Y-m-d 00:00:00');
                $period="(datediff";
                $format = ',now()) div 7';
                for ($i=0; $i < 4; $i++) {
                    $key = Carbon::now()->diffInDays($start,false)/7;                    
                    $label = $start->format("M dS");
                    
                    $nurse_score_data = \DB::select($query." and DATE(created_at) <= DATE('$start_date')");
        			
                    if(count($nurse_score_data) > 0)
                    	$item_score[$key] = $nurse_score_data[0]->score;
                    else	
                    	$item_score[$key] = 0;

                    $month = $start->format("m");
                    $start->addDays(6);
                    if($month == $start->format("m"))
                        $label.=$start->format("-dS");
                    else
                        $label.=$start->format("-M dS");
                    $labels[]=$label;
                    $start->addDays(7);
                    
                    $start_date = $start->format('Y-m-d 00:00:00');
                    //dd($start_date);
                }
                // dd($labels);
                break;
            case 'month':
                $title = $start->format("F Y");
                $start->subMonths(11);
                $title = $start->format("F Y - ").$title;
                $start_date = $start->format('Y-m-d 00:00:00');
                for ($i=0; $i < 12; $i++) {
                    $key = $start->format('n');
                    $labels[] = $start->format('M');;
                    
                    $nurse_score_data = \DB::select($query." and DATE(created_at) <= DATE('$start_date')");
        			
                    if(count($nurse_score_data) > 0)
                    	$item_score[$key] = $nurse_score_data[0]->score;
                    else	
                    	$item_score[$key] = 0;
                    $start->addMonth();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                break;
            case 'year':
                $title = $start->format("Y");
                $start->subYears(4);
                $title = $start->format("Y - ").$title;
                $start_date = $start->format('Y-m-d 00:00:00');
                for ($i=0; $i < 5; $i++) {
                    $key = $start->format('Y');
                    $labels[] = $key;
                    
                    $nurse_score_data = \DB::select($query." and DATE(created_at) <= DATE('$start_date')");

                    if(count($nurse_score_data) > 0)
                    	$item_score[$key] = $nurse_score_data[0]->score;
                    else	
                    	$item_score[$key] = 0;

                    $start->addYear();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                break;

            default:
                # code...
                break;
        }
        
        $prev = 0;
        foreach ($item_score as $key => $value) {
            if($value > 0)
                $prev = $value;
            else
                $item_score[$key] = $prev;
        } 
        
        $s[] = $item_score;
        $s[] = $labels;
        $s[] = $title;

        return $s;
    }
    
    public static function rating_by_unit($unit_id)
    {
      	if(\Cache::get('function_amada') == 1)
     	{
	        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || $unit_id == 0){
	            $fac_id = \Session::get('current_fac');
	          
	            $surveys_rate = \DB::select("SELECT AVG(rate) rate from (SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
	                            FROM code_master c 
	                            left join surveys a on a.discipline = c.key and a.fac_id='$fac_id'  
	                            where c.type = 'discipline'  
	                            group by c.key) abc   WHERE rate != 0");
	            
	        }else{
	             $surveys_rate = \DB::select("SELECT AVG(rate) rate from (SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
	                            FROM code_master c 
	                            left join surveys a on a.discipline = c.key and a.unit_id='$unit_id'  and c.refkey =a.unit_id
	                            where c.type = 'discipline'  and c.refkey = '$unit_id'
	                            group by c.key) abc  WHERE rate != 0");
	        }

	        if($surveys_rate)
	            return $surveys_rate[0]->rate;
	        else
	            return 0;
        }
        else
        {
      	    if(\Auth::user()->type() == 'super-executive' || $unit_id == 0){
	            $fac_id = \Session::get('current_fac');
	            $surveys_rate = \DB::select("SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
	                                    avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
	                                    from surveys where fac_id = $fac_id");
	        
	            $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
	                                SELECT count(q.qid) as value from question q
	                                where q.enabled = 1 and q.fac_id = $fac_id
	                                group by q.css_class 
	                                ) max_table");        
	            if(count($surveys_count) > 0){
	                $surveys_count = $surveys_count[0]->max_value;
	            }else
	            {
	                return 0;
	            }
	        }else{
	            $surveys_rate = \DB::select("SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
	                                    avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
	                                    from surveys where unit_id = $unit_id");
	        
	            $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
	                                SELECT count(q.qid) as value from question q
	                                where q.enabled = 1 and q.unit_id = $unit_id
	                                group by q.css_class 
	                                ) max_table");       
	            if(count($surveys_count) > 0){
	                $surveys_count = $surveys_count[0]->max_value;
	            }else
	            {
	                return 0;
	            }
	        }

	        $total = 0;
	        $i=0;
	        $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
	        $j = 0;
	        for($i = 0; $i < $surveys_count; $i++)
	        {
                if(isset($surveys_rate['q' . ($i + 1)])) {
                    $total += $surveys_rate['q' . ($i + 1)];
                    if($surveys_rate['q' . ($i + 1)] > 0){
                        $j++;
                    }
                }
	        }
	        if($j==0)
	        	return 0;
	        return $total / $j;
        }
    }  
    public static function rating_discipline_by_unit($unit_id)
    {
        $max_peck = config('award.max_peck');
        if(\Cache::get('function_amada') == 1)
        {
	        if((\Auth::user()->type() == 'super-executive'&& \Cache::get('function_amada') != 1) || $unit_id == 0){
	            $fac_id = \Session::get('current_fac');
	            return \DB::select("SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
	                            FROM code_master c 
	                            left join surveys a on a.discipline = c.key and a.fac_id='$fac_id'  
	                            where c.type = 'discipline'  
	                            group by c.key");
	        }else{
	            return \DB::select("SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
	                            FROM code_master c 
	                            left join surveys a on a.discipline = c.key and a.unit_id='$unit_id'  and c.refkey =a.unit_id
	                            where c.type = 'discipline'  and c.refkey = '$unit_id'
	                            group by c.key");
	        }
        }
        else
        {
        	if(\Auth::user()->type() == 'super-executive' || $unit_id == 0){
            $fac_id = \Session::get('current_fac');
            $result = \DB::select("SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
                            FROM code_master c 
                            left join surveys a on a.discipline = c.key and a.fac_id = $fac_id  
                            where c.type = 'discipline'  
                            group by c.key");
	        }else{
	            $result = \DB::select("SELECT c.value categoryname ,ifnull(round(avg(avg_rating),2),0) rate 
	                            FROM code_master c 
	                            left join surveys a on a.discipline = c.key and a.unit_id='$unit_id'  
	                            where c.type = 'discipline'  
	                            group by c.key");
	        }
//	        dd($result);
	        return $result;
        }
    }

    public static function get_caregiver_performance_rating_new($fac_id, $unit_id, $start_date, $discipline){
        if($unit_id){
            $unit_text = "and unit_id like $unit_id";
        }else{
            $unit_text = "";
        }
        $sumpercent = 0;
        $sql = "SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
                                    avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
                                    from surveys where fac_id = $fac_id and discipline = $discipline ".$unit_text;

        if($start_date !="")
        {
            $sql = $sql."  and DATE(created_at) <= DATE('$start_date')";
        }
        $surveys_rate = \DB::select($sql);
        $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
        $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
                                    SELECT count(q.qid) as value from question q
                                    where q.enabled = 1 and fac_id like $fac_id ".$unit_text."
                                    group by q.css_class
                                    ) max_table");

        if(count($surveys_count) > 0){
            $surveys_count = $surveys_count[0]->max_value;
        }else
        {
            $surveys_count = 0;
        }

        $j = 0;
        for($i = 0; $i < $surveys_count; $i++)
        {
            $q = 'q'.($i+1);
            if(isset($surveys_rate[$q])) {
                $sumpercent += $surveys_rate[$q];
                if($surveys_rate[$q] > 0){
                    $j++;
                }
            }
        }

        return $overall_patient =  $j == 0 ? 0 :round($sumpercent/$j);
    }

    public static function get_caregiver_performance_rating_new_employee($fac_id, $unit_id, $start_date, $employee_id){
        if($employee_id){
            $sumpercent = 0;
            $sql = "SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
                                    avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
                                    from surveys where unit_id = $unit_id and employee_id = $employee_id";

            if($start_date !="")
            {
                $sql = $sql."  and DATE(created_at) <= DATE('$start_date')";
            }

            $surveys_rate = \DB::select($sql);
            $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
            if($fac_id){
                $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
                                    SELECT count(q.qid) as value from question q
                                    where q.enabled = 1 and unit_id = $unit_id and fac_id = $fac_id
                                    group by q.unit_id
                                    ) max_table");
            }else{
                $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
                                    SELECT count(q.qid) as value from question q
                                    where q.enabled = 1 and unit_id = $unit_id
                                    group by q.unit_id
                                    ) max_table");
            }

            if(count($surveys_count) > 0){
                $surveys_count = $surveys_count[0]->max_value;
            }else
            {
                $surveys_count = 0;
            }

            for($i = 0; $i < count($surveys_rate); $i++)
            {
                $q = 'q'.($i+1);
                if(isset($surveys_rate[$q]) && $surveys_rate[$q] > 0) {
                    $sumpercent += $surveys_rate[$q];
                }
            }

            return $overall_patient =  $surveys_count == 0 ? 0 :round($sumpercent/$surveys_count);

        }else{
            $sumpercent = 0;
            $sql = "SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
                                    avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
                                    from surveys where unit_id like '$unit_id'";

            if($start_date !="")
            {
                $sql = $sql."  and DATE(created_at) <= DATE('$start_date')";
            }
            $surveys_rate = \DB::select($sql);
            $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
            if($fac_id){
                $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
                                    SELECT count(q.qid) as value from question q
                                    where q.enabled = 1 and unit_id like '$unit_id' and fac_id = $fac_id
                                    group by q.unit_id
                                    ) max_table");
            }else{
                $surveys_count = \DB::select("SELECT max(value) as max_value FROM (
                                    SELECT count(q.qid) as value from question q
                                    where q.enabled = 1 and unit_id like '$unit_id' and fac_id = $fac_id
                                    group by q.unit_id
                                    ) max_table");
            }

            if(count($surveys_count) > 0){
                $surveys_count = $surveys_count[0]->max_value;
            }else
            {
                $surveys_count = 0;
            }

            for($i = 0; $i < $surveys_count; $i++)
            {
                $q = 'q'.($i+1);
                if(isset($surveys_rate[$q]) && $surveys_rate[$q] > 0) {
                    $sumpercent += $surveys_rate[$q];
                }
            }

            return $overall_patient =  $surveys_count == 0 ? 0 :round($sumpercent/$surveys_count);
        }
    }

    // get caregiver performance rating by facility and unit
    public static function get_caregiver_performance_rating($fac_id,$unit_id, $start_date)
    {
        $sumpercent = 0;
        $sql = "SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
										avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
										from surveys where fac_id like '$fac_id' and unit_id like '$unit_id'";
		if($start_date !="")
		{
			$sql = $sql."  and DATE(created_at) <= DATE('$start_date')";
		}
		$surveys_rate = \DB::select($sql);
		$surveys_rate = json_decode(json_encode($surveys_rate[0]), true);
		$surveys_count = \DB::select("SELECT max(value) as max_value FROM (
										SELECT count(q.qid) as value from question q
										where q.enabled = 1 and fac_id like '$fac_id' and unit_id like '$unit_id'
										group by q.unit_id, q.qid 
										) max_table");

		if(count($surveys_count) > 0){
	        $surveys_count = $surveys_count[0]->max_value;
	    }else
	    {
	        $surveys_count = 0;
	    }

		for($i = 0; $i < $surveys_count; $i++)
		{
			$q = 'q'.($i+1);
			if(isset($surveys_rate[$q])){
                $sumpercent += $surveys_rate[$q];
            }
		}

		return $surveys_count == 0 ? 0 :round($sumpercent/$surveys_count);
    }

    public static function get_caregiver_performance_rating_test($fac_id,$unit_id, $start_date)
    {
        $sumpercent = 0;
        $sql = "SELECT avg(q1)/5*100 as q1, avg(q2)/5*100 as q2,avg(q3)/5*100 as q3,avg(q4)/5*100 as q4,avg(q5)/5*100 as q5,
										avg(q6)/5*100 as q6,avg(q7)/5*100 as q7,avg(q8)/5*100 as q8,avg(q9)/5*100 as q9,avg(q10)/5*100 as q10
										from surveys where fac_id like '$fac_id' and unit_id like '$unit_id'";
        if($start_date !="")
        {
            $sql = $sql."  and DATE(created_at) <= DATE('$start_date')";
        }
        $surveys_rate = \DB::select($sql);
        $surveys_rate = json_decode(json_encode($surveys_rate[0]), true);

        $j = 0;
        foreach ($surveys_rate as $key => $value){
            if($value > 0){
                $j++;
                $sumpercent += $value;
            }
        }

        return $j == 0 ? 0 :round($sumpercent/$j);
    }
    
     // get Organizational Performance rating by facility and unit
    public static function get_organizational_performance_rating($fac_id,$unit_id, $start_date)
    {
        $sumpercent = 0;
        $sql = "SELECT  avg(q1)/5*100 q1, avg(q2)/5*100 q2, avg(q3)/5*100 q3,
        avg(q4)/5*100 q4, avg(q5)/5*100 q5, avg(q6)/5*100 q6 , 
        avg(q7)/5*100 q7, avg(q8)/5*100 q8, avg(q9)/5*100 q9 ,
        avg(q10)/5*100 q10, avg(q2)/5*100 q11, avg(q12)/5*100 q12 ,
        avg(q13)/5*100 q13, avg(q14)/5*100 q14, avg(q15)/5*100 q15 ,
        avg(q16)/5*100 q16, avg(q17)/5*100 q17, avg(q18)/5*100 q18 ,
        avg(q19)/5*100 q19, avg(q20)/5*100 q20, avg(q21)/5*100 q21 ,
        avg(q22)/5*100 q22, avg(q23)/5*100 q23, avg(q24)/5*100 q24 ,
        avg(q25)/5*100 q25, avg(q26)/5*100 q26, avg(q27)/5*100 q27 ,
        avg(q28)/5*100 q28, avg(q29)/5*100 q29, avg(q30)/5*100 q30
        from exitsurvey where fac_id like '$fac_id' and unit_id like '$unit_id'";
        if($start_date != "")
		{
			$sql = $sql."  and DATE(date) <= DATE('$start_date')";
		}
		$exit_rate = \DB::select($sql);
    	$exit_rate = json_decode(json_encode($exit_rate[0]), true);
    
	    $exit_count = \DB::select("SELECT max(value) as max_value FROM (
	        SELECT count(q.qid) as value from exit_question q
	        where q.enabled = 1 and fac_id like '$fac_id' and unit_id like '$unit_id'
	        group by q.unit_id
	        ) max_table");        
		if(count($exit_count) > 0){
		    $exit_count = $exit_count[0]->max_value;
		}else
		{
		    $exit_count = 0;
		}

		for($i = 0; $i < $exit_count; $i++)
		{
			$q = 'q'.($i+1);
			$sumpercent += $exit_rate[$q];
		}
		
		return $overall_patient =  $exit_count == 0 ? 0 :round($sumpercent/$exit_count);
    }
    
}
