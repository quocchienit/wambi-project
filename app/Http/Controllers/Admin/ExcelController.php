<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

use App\CodeMaster;
use App\Employee;
use App\Patient;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\CarriersOnline;
use Validator;

class ExcelController extends Controller
{
    function __construct()
    {
        \View::composers([
            'App\Composers\Help'  => ['partials.footer'],
            ]);
    }
    public function ExportClients(){
    	
        $type = \Input::get('type');          
        $file_name = "";
        if($type == null || $type == 'employee')
            $file_name = "template_employee.xlsx";
        elseif($type == 'patient')
            $file_name = "template_patient.xlsx";
        elseif($type == 'ambassador')
            $file_name = "template_ambassador.xlsx";
        if($file_name != "")
            \Excel::load('files/Templates/'.$file_name,function($reader){
                $reader->all();
            })->export('xlsx');
    }

    public function upload()
    {
    	return view('admin.import.index');
    }

    public function ImportClients()
    {
        $type = \Input::get('type');
    	$file = \Input::file('file');
    	$file_name = $file->getClientOriginalName();
    	$file->move('files',$file_name);
    	$results = \Excel::load('files/'.$file_name,function($reader){
    		$reader->all();
    	})->get();
        $mess = [];
        if($type == 'employee'){
    	   $mess = $this->import_employee($results);           
        }
        elseif ($type == 'patient') {
            $mess = $this->import_patient($results);
        }elseif ($type = 'ambassador') {
            $mess = $this->import_ambassador($results);
        }
        //dd($mess);
        return redirect()->route('admin::import::index')->with('message', 'Import Success total '.$mess['success'].' item')
                                                        ->with('error','Import Error total '.$mess['error'].' item'.'.ID Errors:'.$mess['iderr']);
    }

    public  function import_employee($results){
        //dd($results);
        $mess = [];
        $success = 0;
        $error = 0;
        $iderr = '';
        foreach ($results as $key=>$value) {
            if($value->caregiver_id == "") break;
            try{
                $employee = new Employee();
                $employee->clockid = $value->caregiver_id;
                $employee->employeeid = $employee->clockid;
                $employee->firstname = $value->firstname;
                $employee->lastname = $value->lastname;
                $employee->job = $value->job_title;

                $dis = [];
                $dis[0]= "".$value->discipline."";
                $employee->disciplines = $dis;
                $employee->etid = $value->user_type;
                $unit = [];
                $unit[0] = "".$value->unit."";
                $employee->units = $unit; 
                $employee->email = $value->email;
                $employee->mobile = $value->mobile;
                $employee->carrier = CarriersOnline::carrier($employee->mobile);
                $employee->hiredate = $value->hiredate;
                $employee->address = $value->address;
                $employee->fac_id = \Session::get('current_fac');
                $employee->shifts = $value->shifts;            
                $employee->save();
                $success++;
            }  catch ( \Exception $e){
                self::exception_handler($e);
               $error++;
               $iderr = $iderr.','.$value->caregiver_id;
            }
        }
        $mess['success'] = $success;
        $mess['error'] = $error;
        $mess['iderr'] = $iderr;
        return $mess;
    }

    public  function import_patient($results){
        $mess = [];        
        $success = 0;
        $error = 0;
        $iderr = '';
        foreach ($results as $key=>$value) {
            if($value->patient_id == "") break;
            try{
                $patient = new Patient();
                $patient->fname = $value->patient_id;
                $patient->ssn = rand(1000,9999);     
                $patient->pinno = rand(1000,9999);
                $patient->insurance_id = $value->insurance_payor;
                $patient->fac_id = \Session::get('current_fac');
                $patient->patient_carrier = CarriersOnline::carrier($patient->mobile);
                $patient->lid = $value->unit;
                $unit = [];
                $unit[0] = "".$value->unit."";
                $patient->units = $unit;
                $patient->type = 'patient';
                $patient->save();
                $success++;
            } catch ( \Exception $e) {                
                self::exception_handler($e);
                $error++;
                $iderr = $iderr.','.$value->patient_id;
            }
        }
        $mess['success'] = $success;
        $mess['error'] = $error;
        $mess['iderr'] = $iderr;
        return $mess;
    }

    public  function import_ambassador($results){
        $mess = [];
        $success = 0;
        $error = 0;
        $iderr = '';
        foreach ($results as $key=>$value) {
            if($value->ambassador_id == "") break;
            try{
                $patient = new Patient();
                $patient->fname = $value->ambassador_id;
                $patient->ssn = rand(1000,9999);     
                $patient->pinno = rand(1000,9999);
                $patient->mobile = $value->mobile;
                $patient->email = $value->email;
                $patient->fac_id = \Session::get('current_fac');
                $patient->patient_carrier = CarriersOnline::carrier($patient->mobile);
                $patient->lid = $value->unit;
                $unit = [];
                $unit[0] = "".$value->unit."";
                $patient->units = $unit;
                $patient->type = 'ambassador';
                $patient->save();
                $success++;
            } catch ( \Exception $e){
                self::exception_handler($e);
               $error++;
               $iderr = $iderr.','.$value->ambassador_id;
            }
        }

        $mess['success'] = $success;
        $mess['error'] = $error;
        $mess['iderr'] = $iderr;
        
        return $mess;
    }
    public static function exception_handler(\Exception $exception) {
    }
}
