<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CodeMaster extends Model
{
  protected $table = 'code_master';
  public $timestamps = false;
  public static function get_code_master($type=null){
    /* load code master data */
    $codes_masters = [];
    $query = CodeMaster::where('type','=',$type);
    // add new code from new change customer https://3.basecamp.com/3469875/buckets/1177669/todos/668491918
    if($type == 'time_period')
		$result = 	$query->orderBy('notes','asc');
      			
     $result =$query ->get();
	if($result->count()){
  		
  		foreach($result as $code_master){
  		  $code_masters[$code_master->type][$code_master->key] = $code_master;
  		}
  		$code_masters = $code_masters;
  	}    
    return $code_masters[$type];    
  }

   public static function get_code_by_type_and_key($type = null, $key){

    $item = CodeMaster::where('type','=',$type)->
              where('key','=',$key)->first();
   	   if(isset($item))
   	   	   return $item->value;
    	return '';
  	}

  	public function fac(){
       return CodeMaster::where('type','facility')->where('key',$this->fac)->first()['value'];
    }

    public static function get_value_by_type_and_array_key($type = null, $arayKey){
    $item = CodeMaster::select("value")->where('type','=',$type)->
              whereIn('key',$arayKey)->get()->toArray();
       if(isset($item))
           return $item;
      return '';
    }

    public static function getKeyByTypeAndRefkey($type,$refkey)
    {
      $item = CodeMaster::select("key")->where('type','=',$type)->
              where('refkey','=',$refkey)->get()->toArray();
       if(isset($item))
           return $item;
      return '';
    }
}
