<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Patient extends Model
{
	protected $table = 'patient_details';
	protected $primaryKey = 'pid';
	public $timestamps = false;
	public static function list_patient()
	{
		$fac_id = \Session::get('current_fac');
        $unit = \Session::get('current_unit');
        $query = Patient::where('type','patient');
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
        	$query->where('lid',$unit);
        }

        /*
		if((\Auth::user()->type() == 'super-executive' and \Cache::get('function_amada') !=1) || $unit == 0){
            $patients = Patient::where('type','patient')->where('fac_id',$fac_id)->with('surveys')->get();
        }else{

            $patients = Patient::where('type','patient')->where('fac_id',$fac_id)
                                        ->where('lid',$unit)->with('surveys')->get();
        }
        */
        $patients = $query->with('surveys')->get();
		return  $patients;
	}
    //* format datetime */
    public function getDobAttribute($value)
    {
    	if($value<>	NULL && $value <> "0000-00-00")
    	{
	        $date = Carbon::createFromFormat('Y-m-d',$value);
	        return $date->format('m/d/Y');
        }
        return '';
    }
    public function setDobAttribute($value)
    {
        $date = Carbon::createFromFormat('m/d/Y',$value);
        $this->attributes['dob'] = $date->format('Y-m-d');
    }
    //* format datetime */
    public function getAdmitteddateAttribute($value)
    {
    	if($value<>	NULL && $value <> "0000-00-00")
    	{
	        $date = Carbon::createFromFormat('Y-m-d',$value);
	        return $date->format('m/d/Y');
        }
        return '';
    }
    public function setAdmitteddateAttribute($value)
    {
        $date = Carbon::createFromFormat('m/d/Y',$value);
        $this->attributes['admitteddate'] = $date->format('Y-m-d');
    }
    //* format datetime */
    public function getReleaseAttribute($value)
    {
    	if($value <> NULL && $value <> "0000-00-00")
    	{
	        $date = Carbon::createFromFormat('Y-m-d',$value);
	        return $date->format('m/d/Y');
        }
        return '';
    }
    public function setReleaseAttribute($value)
    {
    	if($value<>	NULL && $value <> "0000-00-00")
    	{
	        $date = Carbon::createFromFormat('m/d/Y',$value);
	        $this->attributes['release'] = $date->format('Y-m-d');
        }
        else
        {
        	$this->attributes['release'] = NULL;
        }
    }
    public static function validate($username,$password)
    {
        $patient = Patient::where(['ssn'=>$username,'pinno'=>$password])->get();
        if($patient->count()){
            return $patient[0];
        }
        return false;
    }
    public function name()
    {
        return "$this->fname";
    }
    public function surveys()
    {
        return $this->hasMany("App\Survey",'patient_id','pid');
    }

    // Check phone or email
    public static function checkPhoneAndEmail($phone, $email)
    {

        $patient = null;
        if(!is_null($phone) && $phone <> "") {
            $patient = Patient::leftjoin('patient_family','patient_details.pid','=','patient_family.pid')
                                ->whereRaw("replace(replace(replace(replace(patient_details.mobile,'(',''),'-',''),')',''),' ','') = $phone ")
                                //->where('patient_family.numberphone',$phone)
                                ->select('patient_details.*')->get();

        }else{
            $patient = Patient::leftjoin('patient_family','patient_details.pid','=','patient_family.pid')
                                ->where('patient_details.email',$email)
                                //->where('patient_family.email',$email)
                                ->select('patient_details.*')->get();
        }
        if($patient->count()){
            return $patient[0];
        }
    }

 	// Check code
    public static function validateoutpatient($code)
    {
        $now = Carbon::now();
        // Process ambassador
        $date = $now->subHours(12);
        $patient = Patient::where('type','ambassador')
                            ->where('code',$code)
                            ->where('code_date','>=',$date)
                            ->select('patient_details.*')->get();
        //dd($patient);
        if($patient->count()){
            return $patient[0];
        }

        $date = Carbon::now()->subHours(24);
        $patient = Patient::leftjoin('patient_family','patient_details.pid','=','patient_family.pid')
                            ->where('type','patient')
                            ->where('patient_details.code',$code)
                            ->orwhere('patient_family.code',$code)
                            //->where('code_date','>=',$date)
                            //->orWhere('patient_family.date','>=',$date)
                            ->select('patient_details.*')->get();
        //dd($patient[0]);
        if($patient->count()){
            return $patient[0];
        }
    }
    public function exitsurveys()
    {
        return $this->hasMany("App\ExitSurvey",'exitsurvey.pid','patient_details.pid');
    }


    public static function generate($id)
    {
        $code = rand(0,9).rand(0,9).rand(0,9).rand(0,9);
        // check validate
        $date = Carbon::now()->subHours(24);
        $count = Patient::leftjoin('patient_family','patient_details.pid','=','patient_family.pid')
                        ->where('patient_details.code',$code)
                        ->orwhere('patient_family.code',$code)
                        ->where('code_date','>=',$date)->count();
        if($count > 0)
            generate($id);
        return $code;
        // hard code for apple store approve
        //return '9999';
    }
	public function unitname(){
		$result = [];
		if($this->type =='ambassador')
		{
	        $units = $this->units;

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
        else
        {
        	 $code_master = CodeMaster::where('type','unit')->where('key',$this->lid)->get();
	        if($code_master->count() > 0){
	            return $code_master[0]->value;
	        }
	        return '';
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
    public function facility_name()
    {
        $facility = CodeMaster::where('type','=','facility')->where('key','=',$this->fac_id)->first();
        if(isset($facility))
   	   	   return $facility->value;
    	return '';

    }
		public function fac(){
			 return CodeMaster::where('type','facility')->where('key',$this->fac)->first()['value'];
		}
}
