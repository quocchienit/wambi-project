<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class PatientFamily extends Model
{
	public $timestamps = false;
	protected $table = 'patient_family';
	
	public function generate_family($id)
    {
        $code = rand(0,9).rand(0,9).rand(0,9).rand(0,9);
        // check validate
        $date = Carbon::now()->subHours(24);
        $count = PatientFamily::where('code',$code)->where('id','<>',$id)->where('date','>=',$date)->count();        
        if($count > 0)
            generate_family($id);
        return $code;
    }
}