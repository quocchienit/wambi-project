<?php namespace App\Composers;
use App\Patient;
class PatientList
{

    public function compose($view)
    {
    	$patients = Patient::list_patient();
     	$view->with('patients',$patients);
    }
}