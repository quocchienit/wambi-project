<?php namespace App\Composers;
use App\Employee;
class EmployeeList
{

    public function compose($view)
    {
    	$employees = Employee::list_employee();
     	$view->with('employees',$employees);
    }
}