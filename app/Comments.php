<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class Comments extends Model
{
	public $timestamps = false;
	protected $table = 'comments';

	public function employee(){
        return $this->belongsTo('App\Employee', 'employee_id');
    }
}