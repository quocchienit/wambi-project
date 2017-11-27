<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class EmployeeType extends Model
{
	public $timestamps = false;
	protected $hidden = ['pivot'];
	protected $table = 'employee_type';
	public function permissions()
	{
		return $this->belongsToMany('App\Permission','permission_role','role_id');
	}

	// get employee type from current user login
	public static function GetEmployeeType()
	{
		$user = \Auth::user();
        $employee_type = [];
        switch ($user->etid) {
            case '1':
            case '5':
            case '6':
                $employee_type = [$user->etid,2];
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
        $profiles = EmployeeType::select('id','name')
        			->whereIn('id',$employee_type)
        			->orderBy('orderby')
        			->get();
        
        return $profiles;
	}
}
