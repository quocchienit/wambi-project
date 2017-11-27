<?php

namespace App\Http\Controllers;

use App\Employee;
use App\Reward;
use App\Survey;
use Config;
use Illuminate\Http\Request;
use View;
use App\CodeMaster;
use App\CarriersOnline;
use App\ConfigPeck;
use Session;
use Carbon\Carbon;

class EmployeeController extends Controller
{
    function __construct()
    {
        \View::composers([
            'App\Composers\ShiftTime' => ['partials.available_shifts'],
            'App\Composers\Peck' => ['partials.available_shifts'],
            'App\Composers\JobTitle' => ['partials.available_shifts'],
            'App\Composers\Unit' => ['partials.available_shifts'],
            'App\Composers\News' => ['partials.news'],
            'App\Composers\AvailableShifts' => ['partials.available_shifts'],
            'App\Composers\Carrier' => ['employee.settings.edit'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\ConfigUnit' =>['employee.dashboard', 'partials.qa'],
            'App\Composers\Facility' => ['partials.available_shifts'],
        ]);
    }
    public function settings()
    {
        $employee = \Auth::user();
        return view('employee.settings.edit',compact('employee'));
    }
    public function save_settings(Request $request)
    {
        $employee = \Auth::user();
        $employee->email = $request->email;
        //$employee->carrier = $request->carrier;  
		if($employee->mobile != \Input::get('mobile')){
//            $employee->carrier = CarriersOnline::carrier(\Input::get('mobile'));
        }
        
        $employee->mobile = $request->mobile;
        $status_popup = 0;
        if($request->hasFile('image') && $request->employeeimg != "")
        {
            $status_popup = 1;
            if($request->file('image')->isValid()){
                //$image = $employee->clockid."_".\Input::file('image')->getClientOriginalName();
                $image = $employee->clockid.mt_rand(0,65535999)."_.png";                
                if($employee->type() != 'super-admin' &&
                    $employee->type() != 'super-executive'){
//                    if($request->file('image')->getSize()>1000000){
//                        return redirect()->back()->withErrors(['image' => 'File size must be less than 1 MB'])->withInput();
//                    }
                    $request->file('image')->move(public_path()."/uploads/profiles/waiting", $image);
                    $this->base64_to_jpeg($request->employeeimg, public_path()."/uploads/profiles/waiting/".$image);
                    $employee->image_new = $image;
                    $employee->status = 1;
                }else{
//                    if($request->file('image')->getSize()>1000000){
//                        return redirect()->back()->withErrors(['image' => 'File size must be less than 1 MB'])->withInput();
//                    }
                    $request->file('image')->move(public_path()."/uploads/profiles", $image);
                    $this->base64_to_jpeg($request->employeeimg, public_path()."/uploads/profiles/".$image);
                    $employee->image = $image;
                }
            }
        }
        if($request->bio){
            if(\Auth::user()->type()=='admin' || \Auth::user()->type()=='super-admin' || \Auth::user()->type()=='super-executive') {
                $employee->bio = $request->bio;
            }else{
                if($request->bio != $employee->bio){
                    $employee->bio_new = $request->bio;
                    $bio_status = 'new';
                }
            }
        }
        $employee->save();

        if(isset($bio_status) && $bio_status=='new' && \Auth::user()->type()=='employee'){
            $admin = Employee::whereIn('etid',[3,4,7])->where('fac_id',$employee->fac_id)->get();
            if(count($admin)>0){
                foreach ($admin as $item){
                    $item->notifications()->attach(10, [
                        'content' => '{"link":"/admin/employee#employee_bio"}',
                        'created_at' => Carbon::now()
                    ]);
                }
            }
        }

        if(\Auth::user()->type() == 'employee'){
            if($status_popup == 1) {
                Session::put('flash_message', 'Success');
            }
            return redirect()->route('employee::dashboard')->with([
                'config'    => 1
            ]);
        }
        else
            return redirect()->route('admin::dashboard')->with([
                'config'    => 1
            ]);
    }
    public function reward()
    {
        if(\Cache::get('function_amada') != 1)        
            $rewards = Reward::orderBy('pecks')->get();
        else{         
            $rewards = Reward::whereIn('unit_id',\Auth::user()->units)->orderBy('pecks')->get();
        }

        return view('employee.reward', compact('rewards'));
    }

    public function redeem($reward)
    {
        $employee = \Auth::user();
    	if($employee->email == "")
    	{
    		return response()->json(['success' => false , 'message' => "Please go to your profile settings and insert your email address to redeem reward."]);
    	}
        if($employee->pecks >= $reward->pecks){
            $employee->pecks-=$reward->pecks;
            $employee->save();
            event(new \App\Events\Redeem($reward));
            return response()->json(['success' => true ,'pecks'=>$employee->pecks, 'message' => 'Gift card redeemed.']);
        }
        return response()->json(['success' => false , 'message' => "Sorry, you do not have enough Pecks."]);
    }

    public function index()
    {
        $Q = \Auth::user()->Q();
        $Q_all = \Auth::user()->Q_all();

        $employee = \Auth::user();
        $flash_message = Session::get('flash_message');
        $status_pass = \Auth::user()->status_pass;
        Session::forget('flash_message');
        $data = [];
        $data = Employee::getdatachart_unit($employee);
        $data_all = Employee::getdatachart_unit($employee, 'all');
        $arr_x = $data[0][0]['data_x'];
        return view(    'employee.dashboard')->with([
            'Q' => $Q,
            'Q_all' => $Q_all,
            'employee'  => $employee,
            'flash_message' => $flash_message,
            'status_pass'   => $status_pass,
            'data'  => $data,
            'data_all' => $data_all,
            'arr_x' => $arr_x
        ]);
    }

    public function request($shift_request)
    {
        $employee = \Auth::user();
        $shift_request->status = "Pending";
        $shift_request->requests()->attach($employee->id);
        if ($shift_request->save()) {
            event(new \App\Events\ShiftRequest($shift_request));
            return response()->json(['success' => true, 'message' => 'Shift request send.', 'cssClass' => Config::get("css.$shift_request->status"), 'status' => $shift_request->status]);
        }
    }

    public function graph($eid = null, $period = 'daily')
    {
        $employee = Employee::find($eid);
        $result = $employee->graph($period);
        return response($result);
    }

    public function graph_all($eid = null, $period = 'daily')
    {
        $employee = Employee::find($eid);
        $result = $employee->graph_all($period);
        return response($result);
    }

    public function notifications(Request $request)
    {
        $notifications = \Auth::user()->get_notifications($request->page);

        $data['total'] = $notifications->count();
        $data['html'] = View::make('employee.notifications.item', ['notifications' => $notifications])->render();        
        return $data;
    }

    public function base64_to_jpeg($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb"); 

        $data = explode(',', $base64_string);

        fwrite($ifp, base64_decode($data[1])); 
        fclose($ifp); 

        return $output_file; 
    }

}
