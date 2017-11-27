<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use App\CodeMaster;
use App\AwardType;
use App\Employee;

class Award extends Model
{
	private static $shift_times = null;
    public $timestamps = false;
    
    public function type()
    {
        if($this->type == "unit_award"){            
            $award_type = AwardType::where('unit_id',$this->owner)
                                ->where('key',$this->award)
                                ->where('type','unit')->get();
        }else{
            $unit_id = Employee::where('id',$this->owner)->get();
            if($unit_id->count() > 0)
            {
                $unit_id = $unit_id[0]->units;
                
            }else{
                $unit_id = 0;
            }
            $award_type = AwardType::whereIn('unit_id',$unit_id)
                                ->where('key',$this->award)
                                ->where('type','employee')->get();
        }        

        if($award_type->count() > 0){
            return $award_type[0]->value;
        }else{
            return " ";
        }
    }
    public function cssClass()
    {
        if($this->type == "unit_award"){            
            $award_type = AwardType::where('unit_id',$this->owner)
                                ->where('key',$this->award)
                                ->where('type','unit')->get();
        }else{
            $unit_id = Employee::where('id',$this->owner)->get();
            if($unit_id->count() > 0)
            {
                $unit_id = $unit_id[0]->units;
                
            }else{
                $unit_id = 0;
            }
            $award_type = AwardType::whereIn('unit_id',$unit_id)
                                ->where('key',$this->award)
                                ->where('type','employee')->get();
        }        
        if($award_type->count() > 0){
            return is_null($award_type[0]->notes) ? "info" : $award_type[0]->notes;
        }else{
            return "info";
        }
    }
    public function period()
    {
    	return CodeMaster::get_code_by_type_and_key('time_period',$this->period);
    }
    public function employee()
    {
        return $this->belongsTo('App\Employee','owner');
    }
    public function job_title()
    {
        $employee = Employee::where('id',$this->owner)->get();        
        if($employee->count() > 0){
        	return CodeMaster::get_code_by_type_and_key('job_title',$employee[0]->job);            
        }
        return '-';
    }
    public function user()
    {
        return $this->belongsTo('App\Employee','user_id');
    }

    public function unitname(){
        $code_master = CodeMaster::where('type','unit')->where('key',$this->owner)->get();
        if($code_master->count() > 0){
            return $code_master[0]->value;
        }
        return '';
    }
	public function facility_name()
    {
        $facility = CodeMaster::where('type','=','facility')->where('key','=',$this->fac_id)->first();
        if(isset($facility))
   	   	   return $facility->value;
    	return '';
        
    }
    
    public function employeename(){
        $employee = Employee::where('id',$this->owner)->get();
        if($employee->count() > 0){
            return $employee[0]->name();
        }
        return '-';
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
}
