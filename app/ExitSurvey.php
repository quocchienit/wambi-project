<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class ExitSurvey extends Model
{
	public $timestamps = false;
	protected $table = 'exitsurvey';

	public function patient()
    {
    	return $this->belongsTo('App\Patient');
    }
}