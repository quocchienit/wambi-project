<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Question extends Model
{
    protected $table = 'question';
    public $timestamps = false;
    
    public function unitname()
    {
         $code_master = CodeMaster::where('type','unit')->where('key',$this->unit_id)->get();
        if($code_master->count() > 0){
            return $code_master[0]->value;
        }
        return '-';
    }
	 public static function generateQuestionId()
	 {
	 	 $record = static::select(DB::raw('qid'))->orderBy('qid', 'DESC')->first();
	 	  return $record ? ++$record->qid : 1;

	 }
}
