<?php

namespace App;
// use Illuminate\Database\Eloquent\Model;
// use Illuminate\Foundation\Auth\User as Authenticatable;


use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;


// class User extends Authenticatable
class User extends Employee implements AuthenticatableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;
    public $timestamps = false;

    protected $table = 'employee_master';
    protected $primaryKey  = 'id';
    // protected $primaryKey  = 'clockid';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    /* role relationship */
    public function role()
    {
        return $this->belongsTo('App\EmployeeType','etid');
    }
    public function type()
    {
        return $this->role->type;
    }
    public function permission($permission='')
    {
        return json_decode($this->role->permissions);
    }
    public function can($permissions)
    {        
        if(!is_array($permissions))
            $permissions = [$permissions];
        $user_permissions = $this->role->permissions->pluck('name')->all();
        foreach ($permissions as $key => $value) {
            if(!in_array($value,$user_permissions))
                return false;
        }
        return true;
    }
    public function isAdmin()
    {
        switch($this->type()){
            case 'super-admin':
            case 'admin':
            case 'super-executive':
                return true;
                break;  
            default:
                return false;
                break;          
        }
    }

    public function isShift(){
        switch($this->type()){
            case 'super-admin':
            case 'admin':
            case 'super-executive':
            case 'scheduling-manager':
                return true;
                break;  
            default:
                return false;
                break;          
        }   
    }

    public function isPatient(){
        switch($this->type()){
            case 'super-admin':
            case 'admin':
            case 'super-executive':
            case 'patient-manager':
                return true;
                break;  
            default:
                return false;
                break;          
        }   
    }

    public function isEmployee()
    {
        switch($this->type()){
            case 'super-admin':
            case 'admin':
            case 'super-executive':
            case 'employee-manager':
                return true;
                break;  
            default:
                return false;
                break;          
        }      
    }
}