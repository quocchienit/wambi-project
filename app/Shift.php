<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Cache;

class Shift extends Model
{
    protected $table = 'shift_master';
    public $timestamps = false;
    //* format datetime */
    public function getShiftDateAttribute($value)
    {   
        $date = Carbon::createFromFormat('Y-m-d',$value);
        return $date->format('m/d/Y');
    }
    public function setShiftDateAttribute($value)
    {
        $date = Carbon::createFromFormat('m/d/Y',$value);
        $this->attributes['shift_date'] = $date->format('Y-m-d');
    }    

    public function getShiftStartTimeAttribute($value){        
        return date('h:i:s A',strtotime($value));
    }

    public function getShiftEndTimeAttribute($value){        
        return date('h:i:s A',strtotime($value));
    }

    public function employee()
    {
        return $this->belongsTo('App\Employee');
    }    
    public function user()
    {
        return $this->belongsTo('App\Employee','user_id');
    }
    public function requests()
    {
        return $this->belongsToMany('App\Employee');
    }
    public function status()
    {
        $user = \Auth::user();        
        if($user->type()=='employee'){
            if($this->status=='Accepted' && $this->employee_id != $user->id)
                return 'Taken';
            if($this->status==null||!$this->requests()->where('employee_id',\Auth::user()->id)->count())
                return 'Request';
        }
        return $this->status;
    }
    public function hourly_rate()
    {        
        return $this->belongsToMany('App\HourlyRate');
    }
    public function get_hourly_rate_id()
    {
        return collect([1,2,3]);
    }
    public static function notify_available($shift, $shift_unit=null,$shift_job_title=null)
    {
        $timestamp = Carbon::now();
        $available_shift = Shift::where(['shift_unit'=>$shift_unit,'shift_job_title'=>$shift_job_title])
            ->where('status',null)
            ->whereDate('shift_date','>=',$timestamp->format('Y-m-d'))
            ->count();
        $employees = Employee::where('etid',2)
            ->whereRaw("units like '%\"$shift_unit\"%'")
            ->whereRaw("disciplines like '%\"$shift->shift_discipline\"%'")
            ->where('job',$shift->shift_job_title)
            ->get();
        foreach ($employees as $key => $value) {
            \DB::insert("insert into employee_notification (content,employee_id,notification_id,jobtitle_id,created_at) values ($available_shift,$value->id,4,$shift_job_title,'$timestamp') on duplicate key update status = 'NOT_SEEN',created_at='$timestamp',content=$available_shift");
        }
    }

    public function shift_unit()
    {
        $code_master = CodeMaster::where('type','unit')->where('key',$this->shift_unit)->get();
        $value = array();
        if($code_master->count() > 0){
            foreach ($code_master as $item){
                $value[] = $item->value;
            }
            return implode(', ',$value);
        }
        return '-';
    }
    public function facility_name()
    {
        $facility = CodeMaster::where('type','=','facility')->where('key','=',$this->fac_id)->first();
        if(isset($facility))
   	   	   return $facility->value;
    	return '';
        
    }
    // get pecks by setting unit
	public function shift_pecks_display_name()
    {
    	$value = CodeMaster::get_code_master('shift_pecks');
        $peck = ConfigPeck::where('unit_id',$this->shift_unit)->get();        
		$peck = $peck[0];
		if($this->shift_pecks == 1)
			return $value[1]->display_name.$peck->urgent;
		else if($this->shift_pecks == 2)
			return $value[2]->display_name.$peck->v_urgent;
		else if($this->shift_pecks == 3)
			return $value[3]->display_name.$peck->e_urgent;
    }
    // get pecks by setting unit
	public function shift_pecks_value()
    {
    	$value = CodeMaster::get_code_master('shift_pecks');
        $peck = ConfigPeck::where('unit_id',$this->shift_unit)->get();        
		$peck = $peck[0];
		if($this->shift_pecks == 1)
			return $peck->urgent;
		else if($this->shift_pecks == 2)
			return $peck->v_urgent;
		else if($this->shift_pecks == 3)
			return $peck->e_urgent;
    }

	public function discipline_name()
    {
        $value = CodeMaster::where('type','discipline')->where('key',$this->shift_discipline)->get();
        if($value->count() > 0)
            return $value[0]->value;
        return "";
    }
    
    public function job_name()
    {
        if(Cache::get('function_amada') != 1) {
            $value = CodeMaster::where('type', 'job_title')->where('key', $this->shift_job_title)->get();
        }else {
            $value = CodeMaster::where('refkey', $this->shift_unit)->where('notes', $this->shift_discipline)->get();
        }
        if($value->count() > 0)
            return $value[0]->value;
        return "";
    }
}