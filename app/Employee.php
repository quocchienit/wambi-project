<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\CodeMaster;
use App\Survey;
class Employee extends Model
{
    public $timestamps = false;
    private static $shift_times = null;
    protected $table = 'employee_master';
    protected $hidden = array('pivot');
    public function name()
    {
        return "$this->firstname $this->lastname";
    }

    public function totalpeck()
    {
        $totalpeck = Survey::where('employee_id','=', $this->id)->count('employee_id');
        return $totalpeck;
    }

    public function jobtitle()
    {
    	return CodeMaster::get_code_by_type_and_key('job_title',$this->job);
    }
    public static function list_employee()
    {
        // return \DB::select("SELECT e.*,ROUND(100*SUM(a.peck)/COUNT(a.qid)/30) rating FROM employee_master e LEFT JOIN answers a ON e.id = a.eid GROUP BY e.id");
        $user = \Auth::user();
        $employee_type = [];
        switch ($user->etid) {
            case '1':
            case '5':
            case '6':
            	// employee manager
                $employee_type = [$user->etid,2,1,5];
                break;
            case '3':
                $employee_type = [1,2,3,5,6];
                break;
            case '4':
                $employee_type = [1,2,3,4,5,6];
                break;
            case '7':
                $employee_type = [1,2,3,4,5,6,7];
                break;
                        
            default:
                # code...
                break;
        }
        
        $unit = \Session::get('current_unit');
        $fac_id = \Session::get('current_fac');
        
        $query = Employee::whereIn('etid',$employee_type);
        if($fac_id != 0 && $user->etid == 7){
        	 $query  =  $query->where('fac_id',$fac_id);
        }
        elseif($user->etid != 7){
        	 $query  =  $query->where('fac_id',$user->fac_id);
        }
        //dd($unit);
        //dd($user->etid);
         if($unit != 0 && $user->etid != 7){
        	 $query  =  $query->whereRaw("units like '%\"$unit\"%'");
        }
        $employees= $query->orderByRaw("concat(firstname,lastname)")
                ->get();
        
        return $employees;
    }
    //* hire date */
    public function getHiredateAttribute($value)
    {        
       
        if($value =="0000-00-00 00:00:00" || $value == null)
            return "";
         $date =Carbon::parse($value);
        //$date = Carbon::createFromFormat('Y-m-d',$value);
        //dd($value);
        return $date->format('m/d/Y');
    }
    public function setHiredateAttribute($value)
    {
        if($value =="")
            $this->attributes['hiredate']=null;
        else
        {            
            $date = Carbon::createFromFormat('m/d/Y',$value);
            $this->attributes['hiredate'] = $date->format('Y-m-d');
        }
    }
    //* units */
    public function getUnitsAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function setUnitsAttribute($value)
    {
        $this->attributes['units'] = json_encode($value);
    }
    /* disciplines */
    public function getDisciplinesAttribute($value)
    {
        if(is_array($array =@json_decode($value)))
            return $array;
        return [$value];
    }
    public function disciplines()
    {
        $disciplines = $this->disciplines;
        $result = [];
        foreach ($disciplines as $key) {
        	$item = CodeMaster::where('type','=','discipline')->where('key','=',$key)->first();
            if($item != null) $result[] = $item->value;
        }
        return implode(', ',$result);
    }
    public function disciplines_id()
    {
        $disciplines = $this->disciplines;
        $result = [];
        if(\Cache::get('function_amada') == 1){
            foreach ($disciplines as $key) {
            $d= CodeMaster::where('type','=','discipline')
                            ->where('refkey',$this->units[0])
                            ->where('key','=',$key)->first();
            if($d != null && $this->etid == 2)
                return $d->id;
            }
        }else{
            foreach ($disciplines as $key) {
            $d= CodeMaster::where('type','=','discipline')->where('key','=',$key)->first();
            if($d != null && $this->etid == 2)
                return $d->id;
        }
        }
        return "";
    }
    public function setDisciplinesAttribute($value)
    {
        $this->attributes['disciplines'] = json_encode($value);
    }
    //* shifts */
    public function getShiftsAttribute($value)
    {
    	if(is_array($shifts =@json_decode($value)))
    		return $shifts;
        if(!empty($value))
        	return [$value];
        return [];
    }
    public function setShiftsAttribute($value)
    {
    	$this->attributes['shifts'] = @json_encode($value);
    }
    public function shift_times()
    {
        $data = [];
        if(self::$shift_times == null){
            $s = CodeMaster::get_code_master('shift_time');
            foreach ($s as $value) {
                self::$shift_times[$value->key]=$value->value;
            }
        }
        if(is_array($this->shifts))
            foreach ($this->shifts as $key) 
            {
            	if (array_key_exists($key, self::$shift_times)) {
                	$data[]=self::$shift_times[$key];
                }
            }
        return implode(', ',$data);
    }
    public function job()
    {
        return CodeMaster::get_code_by_type_and_key('job_title',$this->job);
    }
    public function rate($qid)
    {
        # code...
    }
    public function rating($unit = null)
    {
//        $max_peck =config('award.max_peck');
//        //$rating = \DB::select("SELECT round(sum(peck)/count(a.qid)/$max_peck*100) rating FROM question q LEFT JOIN answers a    ON a.qid = q.qid and eid = '$this->id'");
//        /*$rating = \DB::select("SELECT SUM(answer_id)/(count(a.qid) * 5) *100 rating
//        						FROM question q
//        						LEFT JOIN answers a    ON a.qid = q.qid and eid = '$this->id'");
//        */
//        // tanphuqn fix bug https://3.basecamp.com/3469875/buckets/1177669/todos/492016315
//        $start_date = Carbon::now();
//            $item = \DB::select(" select round(avg(avg_rating)) rating ,date(created_at) period
//								from surveys where DATE(created_at) <= DATE('$start_date') and
//								employee_id = $this->id");
//
//       	//dd($rating[0]);
//       	 if(isset($item[0]))
//   	   	    return $item[0]->rating != null?$item[0]->rating:0;
//    	return 0;
//        //return $rating[0]->rating;
//        //return round(100*\DB::table('surveys')->where('employee_id',$this->id)->avg('avg')/config('award.max_peck'));
        $max_peck = config('award.max_peck');
        $start_date = Carbon::now();
        if($unit){
            $units = $unit;
        }else if(\Session::get('employee')){
            $units = \Session::get('employee')[0]->units;
        }else{
            $units = \Auth::user()->units;
        }
        $item = [];
        foreach ($units as $value){
            $item[] = \DB::select(" select round(avg(avg_rating)) rating ,date(created_at) period
								from surveys where DATE(created_at) <= DATE('$start_date') and unit_id like \"$value\" and
								employee_id = $this->id");
        }
        $rating = 0;
        foreach ($item as $tmp){
            $rating += $tmp[0]->rating;
        }
        return round($rating/count($item));
    }

    public function rating_view_bk(){
        $max_peck = config('award.max_peck');
        //$rating = \DB::select("SELECT round(sum(peck)/count(a.qid)/$max_peck*100) rating FROM question q LEFT JOIN answers a    ON a.qid = q.qid and eid = '$this->id'");
        /*$rating = \DB::select("SELECT SUM(answer_id)/(count(a.qid) * 5) *100 rating
        						FROM question q
        						LEFT JOIN answers a    ON a.qid = q.qid and eid = '$this->id'");
        */
        // tanphuqn fix bug https://3.basecamp.com/3469875/buckets/1177669/todos/492016315
        $start_date = Carbon::now();
        if(\Session::get('employee')){
            $units = \Session::get('employee')[0]->units;
        }else{
            $units = \Auth::user()->units;
        }
        $item = [];
        foreach ($units as $value){
            $item[] = \DB::select(" select round(avg(avg_rating)) rating ,date(created_at) period
								from surveys where DATE(created_at) <= DATE('$start_date') and unit_id like \"$value\" and
								employee_id = $this->id");
        }

        //dd($rating[0]);
        $rating = 0;
        foreach ($item as $tmp){
            $rating += $tmp[0]->rating;
        }
        return round($rating/count($item));
    }

    public function rating_view(){
        $start_date = Carbon::now();
        if(\Session::get('employee') && count(\Session::get('employee'))>0){
            $units = \Session::get('employee')[0]->units;
        }else{
            $units = \Auth::user()->units;
        }
        $item = [];
        foreach ($units as $value){
            $data = \DB::select(" select round(avg(avg_rating)) rating ,date(created_at) period
								from surveys where DATE(created_at) <= DATE('$start_date') and unit_id like \"$value\" and
								employee_id = $this->id");
            if($data[0]->rating != 0){
                $item[] = $data;
            }
        }
        $rating = 0;
        foreach ($item as $tmp){
            $rating += $tmp[0]->rating;
        }
        return count($item) ? round($rating/count($item)) : 0;
    }

    public function balance()
    {
        $peckofsurvey = \DB::table('answers')->where('eid',$this->id)->sum('peck');
        $peckofaward  = \DB::table('awards')->where('owner',$this->id)->where('type','employee_award')->where('status','Accepted')->sum('peck');
        $peckofshift  = \DB::table('coinmanager')->where(['employee_id'=>$this->id])->sum('amount');
        return $peckofsurvey + $peckofaward + $peckofshift;
    }
    public function survey()
    {
        $count = \DB::table('surveys')->where(['employee_id'=>$this->id])->count();
        return $count;
    }
    public function Q()
    {
        $units = \DB::table('code_master')->where('type','unit')->whereIn('key',\Auth::user()->units)->get();
        $result = [];

        foreach ($units as $item){
            $ratings = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(a.qid)/5*100) rating,
            q.css_class
           FROM question q
            LEFT JOIN answers a    ON a.qid = q.qid and a.eid = $this->id and a.unit_id = '$item->key'
            where q.enabled = 1 and q.unit_id='$item->key' 
           GROUP BY q.css_class
           order by q.qid");
            foreach ($ratings as $key => $value) {
                $result[$item->value][$value->qid] = $value;
            }
        }
        //dd($this->id);
        return $result;
    }

    public function Q_all()
    {
//        $units = \DB::table('code_master')->where('type','unit')->whereIn('key',\Auth::user()->units)->get();
//        $result = [];
//        foreach ($units as $item){
//            $ratings = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(a.qid)/5*100) rating,
//            q.css_class
//           FROM question q
//            LEFT JOIN answers a    ON a.qid = q.qid and a.eid = $this->id and a.unit_id = '$item->key'
//            where q.enabled = 1 and q.unit_id='$item->key'
//           GROUP BY q.css_class
//           order by q.qid");
//            foreach ($ratings as $key => $value) {
//                $result[$value->qid] = $value;
//            }
//        }
//        return $result;
        $ratings = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/(count(q.qid))/5*100) rating, q.css_class, count(q.qid) test
        FROM question q
        LEFT JOIN answers a ON a.qid = q.qid and a.eid = $this->id
        WHERE q.enabled = 1
        GROUP BY q.css_class
        order by q.qid");
        foreach ($ratings as $key => $value) {
            if($value->rating!=null){
                $result[$value->qid] = $value;
            }
        }

        if(!isset($result)){
            $data = \DB::table('code_master')->where('type','unit')->where('key',$units[0])->first();
            $ratings2 = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(q.qid)/5*100) rating,
            q.css_class
           FROM question q
            LEFT JOIN answers a ON a.qid = q.qid and a.eid = $this->id and a.unit_id = ".$data->key."
            where q.enabled = 1 and q.unit_id = ".$data->key."
           GROUP BY q.css_class
           order by q.qid");
            foreach ($ratings2 as $key => $value) {
                $result[$value->qid] = $value;
            }
        }
        return $result;
    }

    public function Q2($units){

        foreach ($units as $item){
            $data = \DB::table('code_master')->where('type','unit')->where('key',$item)->first();
            if($data == null) continue;
            $ratings = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(q.qid)/5*100) rating,
            q.css_class
           FROM question q
            LEFT JOIN answers a ON a.qid = q.qid and a.eid = ".$this->id." and a.unit_id = ".$data->key."
            where q.enabled = 1 and q.unit_id = ".$data->key." and answer_id > 0 
           GROUP BY q.css_class
           order by q.qid");
            if($ratings) {
                foreach ($ratings as $key => $value) {
                    $result[$data->value][$value->qid] = $value;
                }
            }else{
                $ratings2 = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(q.qid)/5*100) rating,
                q.css_class
               FROM question q
                LEFT JOIN answers a ON a.qid = q.qid and a.eid = $this->id and a.unit_id = ".$data->key."
                where q.enabled = 1 and q.unit_id = ".$data->key."
               GROUP BY q.css_class
               order by q.qid");
                foreach ($ratings2 as $key => $value) {
                    $result[$data->value][$value->qid] = $value;
                }
            }
        }
        return $result;
    }

    public function Q2_all($units){
        $ratings = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/(count(q.qid))/5*100) rating, q.css_class, count(q.qid) test
        FROM question q
        LEFT JOIN answers a ON a.qid = q.qid and a.eid = $this->id
        WHERE q.enabled = 1
        GROUP BY q.css_class
        order by q.qid");
        foreach ($ratings as $key => $value) {
            if($value->rating!=null){
                $result[$value->qid] = $value;
            }
        }

        if(!isset($result)){
            $data = \DB::table('code_master')->where('type','unit')->where('key',$units[0])->first();
            $ratings2 = \DB::select("SELECT q.qid,q.question,round(sum(answer_id)/count(q.qid)/5*100) rating,
            q.css_class
           FROM question q
            LEFT JOIN answers a ON a.qid = q.qid and a.eid = $this->id and a.unit_id = ".$data->key."
            where q.enabled = 1 and q.unit_id = ".$data->key."
           GROUP BY q.css_class
           order by q.qid");
            foreach ($ratings2 as $key => $value) {
                $result[$value->qid] = $value;
            }
        }
        return $result;
    }

    //public function award()
    //{
    //     return \DB::table('awards')
    //                 ->where(['owner'=>$this->id,'type'=>'employee_award','status'=>'Accepted'])
    //                 ->sum('peck');
    // }    
    public function awards()
    {
        $unit = implode("','",$this->units);
        $unit = "'".$unit."'";
        if($this->created_at){
            $date = "'".$this->created_at."'";
        }else{
            $date = "'1970-01-01 01:01:01'";
        }
        $item = \DB::select("SELECT count(a.id) as count from awards a 
                        where (( a.owner in ($unit) and a.type = 'unit_award' and a.date_created >= $date)
                        or (a.owner = '$this->id' and a.type = 'employee_award')) and a.status = 'Accepted'");
        if(isset($item[0]))
            return $item[0]->count != null?$item[0]->count:0;
        return 0;
        //return $count[0]->count;
        //return \DB::table('awards')->where(['owner'=>$this->id,'type'=>'employee_award','status'=>'Accepted'])->orWhere('owner','in','('.'$unit'.')')->count();
    }
    public function photo()
    {        
        $photo = "uploads/profiles/$this->image";
        if ($this->image != "" && \File::exists(public_path($photo))) {
            return url($photo);
        }
        return url("/assets/images/users/avatar-1.jpg");
    }
    public function getUserAvatarAttribute()
    {
        return $this->photo();
    }
   
    public function graph($period='date')
    {        
        $data = array();
        $s1 = Employee::series($period, false);
        $s2 = Employee::series($period, true);
        for ($i=0; $i<count($s1); $i++){
            $result = array();
            $result['series'][] =  array_flatten($s1[$i][0]);
            $result['labels'] = $s1[$i][1];
            $result['title'] = $s1[$i][2];

            $result['series'][] = array_flatten($s2[$i][0]);
            $result['labels'] = $s2[$i][1];
            $result['title'] = $s2[$i][2];

            $data[] = $result;
            $result = null;
        }

        return $data;
    }

    public function graph_all($period='date')
    {
        $data = array();
        $s1 = Employee::series_all($period, false);
        $s2 = Employee::series_all($period, true);

        for ($i=0; $i<count($s1); $i++){
            $result = array();
            $result['series'][] =  array_flatten($s1[$i][0]);
            $result['labels'] = $s1[$i][1];
            $result['title'] = $s1[$i][2];

            $result['series'][] = array_flatten($s2[$i][0]);
            $result['labels'] = $s2[$i][1];
            $result['title'] = $s2[$i][2];

            $data[] = $result;
            $result = null;
        }

        return $data;
    }
    
    
     public function series($period='date', $is_mployee=true)
    {
        if($is_mployee){
            foreach ($this->units as $item) {
                $query[] = "select round(avg(avg_rating)) score from surveys where employee_id = ".$this->id." and unit_id = ".$item;
            }
        }else{
             foreach ($this->units as $item){
                 $query[] = "select round(avg(avg_rating)) score from surveys where unit_id = ".$item;
             }
         }

         //$period='week';
        foreach ($query as $item){
            $start = Carbon::now();
            $start_date=$start;
            $labels = [];
            $item_score = [];
            $format = '';
            $title = '';
            $group = " group by period";
            switch ($period) {
                case 'date':
                    $title = $start->format("M d");
                    $start->subDays(5);
                    $start_date = $start->format('Y-m-d 00:00:00');
                    $title = $start->format("M d - ").$title;

                    for ($i=0; $i < 6; $i++) {
                        $key = $start->format('Y-m-d');
                        $labels[] = $start->format('M d');

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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
//                    $period="(datediff";
//                    $format = ',now()) div 7';
                    for ($i=0; $i < 4; $i++) {
                        $key = Carbon::now()->diffInDays($start,false)/7;
                        $label = $start->format("M dS");

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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
            $s = array();
            $s[] = $item_score;
            $s[] = $labels;
            $s[] = $title;
            $data[] = $s;
        }

        return $data;
    }

    public function series_all($period='date', $is_mployee=true)
    {
        if($is_mployee){
            foreach ($this->units as $item) {
                $query[] = "select round(avg(avg_rating)) score from surveys where employee_id = ".$this->id." and unit_id = ".$item;
            }
        }else{
            foreach ($this->units as $item){
                $query[] = "select round(avg(avg_rating)) score from surveys where unit_id = ".$item;
            }
        }
        $data = array();
        foreach ($query as $item){
            $start = Carbon::now();
            $start_date=$start;
            $labels = [];
            $item_score = [];
            $format = '';
            $title = '';
            $group = " group by period";
            switch ($period) {
                case 'date':
                    $title = $start->format("M d");
                    $start->subDays(5);
                    $start_date = $start->format('Y-m-d 00:00:00');
                    $title = $start->format("M d - ").$title;

                    for ($i=0; $i < 6; $i++) {
                        $key = $start->format('Y-m-d');
                        $labels[] = $start->format('M d');

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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
                    for ($i=0; $i < 4; $i++) {
                        $key = Carbon::now()->diffInDays($start,false)/7;
                        $label = $start->format("M dS");

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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
                    }
                    break;
                case 'month':
                    $title = $start->format("F Y");
                    $start->subMonths(11);
                    $title = $start->format("F Y - ").$title;
                    $start_date = $start->format('Y-m-d 00:00:00');
                    for ($i=0; $i < 12; $i++) {
                        $key = $start->format('n');
                        $labels[] = $start->format('M');;

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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

                        $nurse_score_data = \DB::select($item." and DATE(created_at) <= DATE('$start_date')");

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
            $i=0;
            foreach ($item_score as $key => $value) {
                if(!isset($s[$i])){
                    $s[$i] = 0;
                }
                if($value > 0)
                    $prev = $value;
                else
                    $item_score[$key] = $prev;

                $s[$i] += $value;
                $i++;
            }
            $data[1] = $labels;
            $data[2] = $title;
        }

        if(count($s)>0){
            foreach ($s as $item){
                $data_result[0][0][] = $item/count($query);
            }
        }
        $data_result[0][1] = $data[1];
        $data_result[0][2] = $data[2];
        return $data_result;
    }
   
    public static function search($q)
    {
        $searchTerms = explode(' ', $q);
        $query = Employee::query();
        $columns = \Schema::getColumnListing('employee_master');
        foreach($searchTerms as $searchTerm){
            $query->where(function($q) use ($searchTerm){
                $q->where('firstname', 'like', '%'.$searchTerm.'%')
                ->orWhere('lastname', 'like', '%'.$searchTerm.'%');
            });
        }
        $current_unit = \Session::get('current_unit');
        if($current_unit == 0){
            $current_unit = '%';
        }
        if(\Cache::get('function_amada') == 1){
            $query->whereRaw("units like '%\"$current_unit\"%'")   ;         
        }

        $query->where('etid',2)->orderByRaw("concat(firstname,lastname)");
        $results = $query->get();    
        $data['items'] = $results;
        $data['total_count'] = $results->count();    
        return $data;
    }
    public function notifications()
    {
        return $this->belongsToMany('App\Notification','employee_notification','employee_id');
    }   
    public function get_notifications($page=0)
    {
        $perpage = config('notifications.perpage');
        return $this->notifications()
            ->select('employee_notification.id','name','icon','css_class')
            ->withTimestamps()
            ->withPivot('content','jobtitle_id','status')
            ->limit($perpage)
            ->offset($perpage*$page)
            ->orderBy('employee_notification.created_at','desc')
            ->get()
        ;
    }   
    public function total_notifications()
    {
        return $this->notifications()
            ->wherePivot('status','NOT_SEEN')
            ->count();
    }
    public function surveys()
    {
        return $this->hasMany('App\Survey');
    }

    public static function searchSurvey($q, $lid, $patient)
    {
        $searchTerms = explode(' ', $q);
        $query = Employee::query();
        $columns = \Schema::getColumnListing('employee_master');
        foreach($searchTerms as $searchTerm){
            $query->where(function($q) use ($searchTerm){
                $q->where('firstname', 'like', '%'.$searchTerm.'%')
                ->orWhere('lastname', 'like', '%'.$searchTerm.'%');
            });
        }        
        $query->where('units','like','%'.$lid.'%')
        ->where('etid',2)
        ->where('fac_id',$patient->fac_id)
        ->orderByRaw("concat(firstname,lastname)");
        $results = $query->get();    
        $data['items'] = $results;
        $data['total_count'] = $results->count();    
        return $data;
    }

	// Mini Patient Portal built into Admin/ Super Admin/ Exec" and Comment tab added to Admin User
	public static function searchReview($q, $lid)
    {
        $searchTerms = explode(' ', $q);
        $query = Employee::query();
        $columns = \Schema::getColumnListing('employee_master');
        foreach($searchTerms as $searchTerm){
            $query->where(function($q) use ($searchTerm){
                $q->where('firstname', 'like', '%'.$searchTerm.'%')
                ->orWhere('lastname', 'like', '%'.$searchTerm.'%');
            });
        }        
        $query->where('units','like','%'.$lid.'%')
        ->where('etid',2);
        if(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        $query->orderByRaw("concat(firstname,lastname)");
        
        $results = $query->get();    
        $data['items'] = $results;
        $data['total_count'] = $results->count();    
        return $data;
    }
    
    public function newphoto()
    {        
        $newphoto = "uploads/profiles/waiting/$this->image_new";
        if ($this->image_new != "" && \File::exists(public_path($newphoto))) {
            return url($newphoto);
        }
        return url("/assets/images/users/avatar-1.jpg");
    }

    public function notifications_photo()
    {
        if($this->type() =='super-admin' ||
            $this->type() =='super-executive'){
            return Employee::where('status','=',1)->count();
        }
    }

    public function notifications_photo_date()
    {
        if($this->type() =='super-admin' ||
            $this->type() =='super-executive'){
            return Carbon::now();
        }
    }

    public function job_name()
    {
        if(\Cache::get('function_amada') == 1){
    		$job_title = CodeMaster::where('type','job_title')->where('refkey',$this->units[0])
    						->where('key','=',$this->job)->first();

    	}
		else{
    		$job_title = CodeMaster::where('type','=','job_title')->first();
    	}
        if(isset($job_title))
   	   	   return $job_title->value;
    	return '';
        
    }

    public function unitname(){
        $units = $this->units;
        $result = [];
        foreach ($units as $key) {
            $code_master = CodeMaster::where('type','=','unit')->where('key','=',$key)->first();
            if($code_master){
                $result[] = $code_master->value;
            }else{
                $result[] = '';
            }
        }
        
        return implode(', ',$result);        
    }
	
    public function unit_id(){
        $units = $this->units;
        $result = [];
        foreach ($units as $key) {
            $result[] = CodeMaster::where('type','=','unit')->where('key','=',$key)->first()->key;
        }

        return implode(', ',$result);
    }
    
   public function facility_name()
    {
        $facility = CodeMaster::where('type','=','facility')->where('key','=',$this->fac_id)->first();
        if(isset($facility))
   	   	   return $facility->value;
    	return '';
        
    }

    public static function getdatachart_unit($employee, $all = null){
        if($all){
            $result_final = [];
            foreach ($employee->units as $item) {
                $unit = CodeMaster::where('type','unit')->where('key',$item)->first();
                $unit_score = [];
                $arr = [];
                $fac_id = \Session::get('current_fac');
                if($fac_id == 0){
                    $fac_id = 1;
                }
                $y = 1;

                $start = Carbon::now();
                $start->subDays(6);
                $start_date = $start->format('Y-m-d 00:00:00');

                for ($i = 0; $i < 7; $i++) {
                    $arr[] = $start->format('m-d-y');
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating_new_employee($fac_id, $item, $start, null);
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $result[0]['values'] = $unit_score;
                $result[0]['key'] = 'Unit';
                $result[0]['color'] = self::getColor($y);
                $result[0]['data_x'] = $arr;
                $result[0]['interpolate'] = 'bundle';
                $y += 1;

                //Employee
                for ($i = 0; $i < 7; $i++) {
                    $arr[] = $start->format('m-d-y');
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating_new_employee($fac_id, $item, $start, $employee->id);
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $result[1]['values'] = $unit_score;
                $result[1]['key'] = 'Your Performence';
                $result[1]['color'] = self::getColor($y);
                $result[1]['data_x'] = $arr;
                $result[1]['interpolate'] = 'bundle';
                $y += 1;

                $result_final[] = $result;
            }
            $data_result = [];
            if(count($result_final)> 0){
                $data_0 = [];
                $data_1 = [];
                foreach ($result_final as $item_final){
                    $data_0[] = $item_final[0]['values'];
                    $data_1[] = $item_final[1]['values'];
                }
                $data_0_0 = [];
                $data_1_0 = [];
                $dem = [];
                for ($i = 0; $i < 7; $i++) {
                    $j = 0;
                    $data_0_0[$i] = 0;
                    $data_1_0[$i] = 0;
                    foreach ($data_0 as $value_0) {
                        $data_0_0[$i] += $value_0[$i]['y'];
                    }
                    $dem[$i] = 0;
                    foreach ($data_1 as $value_1) {
                        $data_1_0[$i] += $value_1[$i]['y'];
                        if($value_1[$i]['y'] > 0){
                            $dem[$i] += 1;
                        }
                    }
                    $j++;
                }

                for ($i = 0; $i < 7; $i++) {
                    $data_0_0[$i] = round($data_0_0[$i]/count($result_final));
                    if($dem[$i] > 0){
                        $data_1_0[$i] = round($data_1_0[$i]/$dem[$i]);
                    }else{
                        $data_1_0[$i] = round($data_1_0[$i]/count($result_final));
                    }
                }

                for ($i = 0; $i < 7; $i++) {
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = $data_0_0[$i];
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $y = 1;
                $data_result[0][0]['values'] = $unit_score;
                $data_result[0][0]['key'] = 'Unit';
                $data_result[0][0]['color'] = self::getColor($y);
                $data_result[0][0]['data_x'] = $arr;
                $data_result[0][0]['interpolate'] = 'bundle';

                for ($i = 0; $i < 7; $i++) {
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = $data_1_0[$i];
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $y++;
                $data_result[0][1]['values'] = $unit_score;
                $data_result[0][1]['key'] = 'Your Performence';
                $data_result[0][1]['color'] = self::getColor($y);
                $data_result[0][1]['data_x'] = $arr;
                $data_result[0][1]['interpolate'] = 'bundle';
            }

            return $data_result;
        } else {
            $result_final = [];
            foreach ($employee->units as $item) {
                $unit = CodeMaster::where('type','unit')->where('key',$item)->first();
                $unit_score = [];
                $arr = [];
                $fac_id = \Session::get('current_fac');
                if($fac_id == 0){
                    $fac_id = 1;
                }
                $y = 1;

                $start = Carbon::now();
                $start->subDays(6);
                $start_date = $start->format('Y-m-d 00:00:00');

                for ($i = 0; $i < 7; $i++) {
                    $arr[] = $start->format('m-d-y');
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating_new_employee($fac_id, $item, $start, null);
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $result[0]['values'] = $unit_score;
                $result[0]['key'] = 'Unit';
                $result[0]['color'] = self::getColor($y);
                $result[0]['data_x'] = $arr;
                $result[0]['interpolate'] = 'bundle';
                $y += 1;

                //Employee
                for ($i = 0; $i < 7; $i++) {
                    $unit_score[$i]['x'] = $i;
                    $unit_score[$i]['y'] = Survey::get_caregiver_performance_rating_new_employee($fac_id, $item, $start, $employee->id);
                    $start->addDay();
                    $start_date = $start->format('Y-m-d 00:00:00');
                }
                $result[1]['values'] = $unit_score;
                $result[1]['key'] = 'Your Performence';
                $result[1]['color'] = self::getColor($y);
                $result[1]['data_x'] = $arr;
                $result[1]['interpolate'] = 'bundle';
                $y += 1;

                $result_final[] = $result;
            }
            return $result_final;
        }
    }
    public static function getColor($key){
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
}
