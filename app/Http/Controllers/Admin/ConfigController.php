<?php

namespace App\Http\Controllers\Admin;
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
use App\ConfigPeck;
use App\AwardType;

class ConfigController extends Controller 
{
	function __construct()
    {
         \View::composers([            
            'App\Composers\Help'  => ['partials.footer'],        
            'App\Composers\Unit'  => ['admin.config.*'], 
              'App\Composers\ShowAllUnits'  => ['admin.*'],
             'App\Composers\Facility'  => ['admin.*'],               
        ]);
    }
	public function getView()
	{	
		$current_unit = \Session::get('current_unit');
		$fac_id = \Session::get('current_fac');
		
		//dd(\Session::get('current_fac'));
		if(!\Session::has('current_unit') || $current_unit == 0){
			$current_unit = CodeMaster::where('type','unit')->where('refkey',\Session::get('current_fac'))->get();
			if($current_unit->count() > 0){
				$current_unit = $current_unit[0]->key;
				 \Session::set('current_unit',$current_unit);
			}else{
				$current_unit = 0;
			}
		}
		$config_peck = ConfigPeck::where('unit_id','=',$current_unit)							
							->get();
		if($config_peck->count() > 0){
			$config_peck = $config_peck[0];
		}else{
			$config_peck = new ConfigPeck();
		}

		$award_unit = AwardType::where('unit_id','=',$current_unit)
						->where('type','=','unit')->get();
		$award_employee = AwardType::where('unit_id','=',$current_unit)
						->where('type','=','employee')->get();
		$csstype = CodeMaster::where('type','csstype')->get();
		
		 $query = Employee::select('*');
        if(\Auth::user()->type()=='super-executive' and $fac_id != 0 )
        {
        	$query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        if(\Auth::user()->type() !='super-executive' and $current_unit != 0 )
        {
        	$query->whereRaw("units like '%\"$current_unit\"%' ");
        }
        $employee = $query->orderByRaw("concat(firstname,lastname)")->get();
        /*
		if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
			|| (\Session::has('current_unit') && \Session::get('current_unit') == 0)){
			$employee = Employee::where('fac_id',\Session::get('current_fac'))->orderByRaw("concat(firstname,lastname)")->get();
		}else{
			$employee = Employee::whereRaw("units like '%\"$current_unit\"%' ")->orderByRaw("concat(firstname,lastname)")->get();
		}
		*/
		$item_unit = CodeMaster::where('type','unit')->where('key',\Session::get('current_unit'))->get();
		//dd($item_unit);	
		if($item_unit->count() > 0){
			$followup = $item_unit[0]->notes;
		}else{
			$followup = 0;
		}
		//Number of consecutive
		$number_of_consecutives[]=	2;
		$number_of_consecutives[]=	3;
		$number_of_consecutives[]=	4;
		$number_of_consecutives[]=	5;
		$number_of_consecutives[]=	6;
		
		return view('admin.config.index',compact('number_of_consecutives','followup','config_peck','award_unit','award_employee','csstype','employee'));
	}

	// Confi patient
	public function postPatient()
	{			
		$units = \Input::get('units');		
		$units = json_decode(stripslashes($units));
		$units = $units[0];
		$unit_type = \Input::get('unit_type');  

		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				$code = CodeMaster::where('type','=','unit')->where('key','=',$units[$i]->id)->get();
				if($code->count() > 0){
					$code = $code[0];
					$code->notes = \Input::get('follow');
					$code->save();
				}
				$code = ConfigPeck::where('unit_id','=',$units[$i]->id)->get();
				if($code->count() > 0){
					$code = $code[0];
				}
				else{
	                $code = new ConfigPeck();
	                $code->unit_id = $units[$i]->id;
            	}	
            	
        		$code->eidalert = \Input::get('employeeid');
				$code->eidfollow = \Input::get('employeeid1');
				$code->eidredem = \Input::get('employeeid2');
				$code->number_of_consecutive = \Input::get('number_of_consecutive');
				$code->users_to_receive = \Input::get('employeeid3');
				$code->perfectscore = \Input::get('perfectscore');
				$code->save();		
			}
		}
		\Cache::forget('units');
		if(\Cache::get('function_amada') == 1)
			return response()->json(['success'=>true,'message'=>'']);
		else
			return response()->json(['success'=>true,'message'=>'Success! You updated the ability for patients to request follow up.']);
	}

	public function postSurvey()
	{
		$units = \Input::get('units');		
		$units = json_decode(stripslashes($units));
		$units = $units[0];
		$unit_type = \Input::get('unit_type');  
		//dd($unit_type);
		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				$code = ConfigPeck::where('unit_id','=',$units[$i]->id)->get();
				if($code->count() > 0){
					$code = $code[0];
				}
				else{
                	$code = new ConfigPeck();
                	$code->unit_id = $units[$i]->id;
            	}
            	
        		$code->poor = \Input::get('poor');
				$code->fair = \Input::get('fair');
				$code->ok = \Input::get('ok');
				$code->good = \Input::get('good');
				$code->great = \Input::get('great');
				$code->save();		
			}
		}		

		return response()->json(['success'=>true,'message'=>'Survey peck has change config!']);	
	}

	public function postShift()
	{
		$units = \Input::get('units');		
		$units = json_decode(stripslashes($units));
		$units = $units[0];
		$unit_type = \Input::get('unit_type');  
		//dd($unit_type);
		
		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				$code = ConfigPeck::where('unit_id','=',$units[$i]->id)->get();
				if($code->count() > 0){
					$code = $code[0];
				}
				else{
	                $code = new ConfigPeck();
	                $code->unit_id = $units[$i]->id;
            	}
            		$code->urgent = \Input::get('urgent');
					$code->v_urgent = \Input::get('v_urgent');
					$code->e_urgent = \Input::get('e_urgent');				
					$code->save();
			}
		}
		return response()->json(['success'=>true,'message'=>'Shift peck values have changed!']);	
	}

	public function postPerformance()
	{
		$units = \Input::get('units');		
		$units = json_decode(stripslashes($units));
		$unit_type = \Input::get('unit_type');  
		//dd($unit_type);
		$units = $units[0];
		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				$code = ConfigPeck::where('unit_id','=',$units[$i]->id)->get();
				if($code->count() > 0){
					$code = $code[0];
				}
				else{
                	$code = new ConfigPeck();
                	$code->unit_id = $units[$i]->id;
            	}
            
        		$code->from_need = \Input::get('from_need');
				$code->to_need = \Input::get('to_need');
				$code->from_sactisfactory = \Input::get('from_sactisfactory');				
				$code->to_sactisfactory = \Input::get('to_sactisfactory');				
				$code->from_good = \Input::get('from_good');				
				$code->to_good = \Input::get('to_good');				
				$code->from_excellent = \Input::get('from_excellent');				
				$code->to_excellent = \Input::get('to_excellent');				
				$code->from_exceptional = \Input::get('from_exceptional');				
				$code->to_exceptional = \Input::get('to_exceptional');				
				$code->save();
			}
		}		
		\Cache::forget('config_unit');
		return response()->json(['success'=>true,'message'=>'Performance breakdown benchmark values has change config!']);	
	}

	public function postAwardDelete()
	{
		$units = \Input::get('units');
		$units = json_decode(stripslashes($units));
		$unit_type = \Input::get('unit_type');  
		//dd($unit_type);
		$units = $units[0];
		//return response()->json(['success'=>true,'message'=>count($units)]);		
		$key = \Input::get('id');
		$type = \Input::get('type');
		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				AwardType::where('unit_id','=', $units[$i]->id)
									->where('key','=',$key)
									->where('type','=',$type)->delete();
			}
		}
		return response()->json(['success'=>true,'message'=>'Deleted']);		
	}

	public function postAwardSave()
	{
		$key = \Input::get('id');
		$type = \Input::get('type');
		$units = \Input::get('units');
		$unit_type = \Input::get('unit_type');  
		//dd($unit_type);
		$units = json_decode(stripslashes($units));
		$units = $units[0];
		for ($i=0; $i < count($units); $i++) { 
			if($units[$i]->checked == 1 || $unit_type =="all"){
				$award_type = AwardType::where('unit_id','=',$units[$i]->id)
									->where('key','=',$key)
									->where('type','=',$type)->get();
				if($award_type->count() > 0){
					$award_type = $award_type[0];
				}else{
					$award_type = new AwardType();
					$award_type->key = $key;
					$award_type->type = $type;
					$award_type->unit_id = $units[$i]->id;
				}
				$award_type->value = \Input::get('content');
				$award_type->notes = \Input::get('csstype');
				$award_type->save();
			}
		}		
		return response()->json(['success'=>true,'message'=>'']);		
	}

    public function set_fac_unit(){
        if (\Input::get('fac_id')) {
           \Session::set('current_fac',\Input::get('fac_id')); 
        }
        \Session::set('current_unit',\Input::get('unit_id'));     
        return redirect()->back();        
    }
}