<?php

namespace App\Http\Controllers\Admin;

use App\News;
use Dompdf\Dompdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Response;
use Carbon\Carbon;
use App\CodeMaster;
use App\Answer;
use App\Employee;
use App\EmployeeType;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Survey;
use App\Award;
use App\Comments;
use App\EmployeeNotification;
use App\NewsFeedComment;
use App\NewsFeedLike;
use App\NewsFeedTag;
use App\CarriersOnline;
use Excel;
use Validator;
use Auth;

class EmployeeController extends Controller
{
    function __construct()
    {
        \View::composers([
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\JobTitle'  => ['admin.*'],
            'App\Composers\ShiftTime'  => ['admin.*'],
            'App\Composers\Discipline'  => ['admin.*'],
            'App\Composers\EmployeeList'  => ['admin.partials.employees'],
            'App\Composers\AdminTopBox'  => ['admin.partials.admin_top'],
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\ConfigUnit' =>['admin.*'],
            'App\Composers\Facility'  => ['admin.*'],
            'App\Composers\ShowAllUnits'  => ['admin.*'],
            ]);
    }
    public function view($employee)
    {
        //$Q = Answer::rating_by_employee($employee->id);
        \Session::forget('employee');
        \Session::push('employee',$employee);
        $Q = $employee->Q2($employee->units);
        $Q_all = $employee->Q2_all($employee->units);
        $data = [];
        $data = Employee::getdatachart_unit($employee);
        $data_all = Employee::getdatachart_unit($employee, 'all');
        $arr_x = $data[0][0]['data_x'];
        $print_status = 1;
        return view('admin.employee.view',compact('Q', 'Q_all', 'employee','data','data_all','arr_x','print_status'));
    }

    public function printView($employee){
        //$Q = Answer::rating_by_employee($employee->id);
        \Session::forget('employee');
        \Session::push('employee',$employee);
        $Q = $employee->Q2($employee->units);
        $Q_all = $employee->Q2_all($employee->units);
        $data = [];
        $data = Employee::getdatachart_unit($employee);
        $data_all = Employee::getdatachart_unit($employee, 'all');
        $arr_x = $data[0][0]['data_x'];

        if(\Session::has('current_unit')){
            $unit = \Session::get('current_unit');
        }else{
            if(\Auth::user()->type() == 'super-admin' ||
                (\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') == 1)){
                $unit = 0;
            }else{
                $unit = \Auth::user()->units[0];
            }
        }
        $fac_id = \Session::get('current_fac');
        if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1)
            || $unit == 0){
            $news = News::where('fac_id',$fac_id)
                ->orderBy('created_at','DESC')->with('likes', 'comments', 'tag')->get();
        }else{
            if($unit != 1) {
                $news = News::where('units','like', "%$unit%")->where('fac_id', $fac_id)
                    ->orderBy('created_at', 'DESC')->with('likes', 'comments', 'tag')->get();
            }else{
                $news = News::where('units','like', "%$unit\"%")->where('fac_id', $fac_id)
                    ->orderBy('created_at', 'DESC')->with('likes', 'comments', 'tag')->get();
            }
        }

        $award_requests = Award::where('approval','NO')->get();
        $print_status = 0;
        return view('admin.employee.print-view',compact('Q', 'Q_all', 'employee','data','data_all','arr_x','news','award_requests','print_status'));
    }

    public function index(Request $request)
    {
    	$unit = \Session::get('current_unit');
        $fac_id = \Session::get('current_fac');
        $utype = \DB::table('employee_type')->select("name")->get();
        $user = Auth::user();

        $query = Employee::with('surveys')->where('status','=',1);
        if($fac_id != 0 && $user->etid == 7){
        	 $query->where('fac_id',$fac_id);
        }
		if($user->type()=='super-executive' and $fac_id != 0 )
        {
        	$query->where('fac_id',$fac_id);
        }
        elseif(\Auth::user()->type()!='super-executive')
        {
        	$query->where('fac_id',\Auth::user()->fac_id);
        }
        
        if($user->type() !='super-executive' and $unit != 0 )
        {
        	 $query->whereRaw("units like '%\"$unit\"%'");
        }
        $employees_photo= $query->orderByRaw("concat(firstname,lastname)")->get();

        $facility = CodeMaster::where('type','facility')->orderby('value')->get();
        $disciplines = CodeMaster::where('type','discipline')->orderby('value')->get();
        $job_titles = CodeMaster::where('type','job_title')->orderby('value')->get();
        $shifts = CodeMaster::where('type','shift_time')->orderby('value')->get();
        $employees_types = EmployeeType::get();

        if($request && count($request->all())>0){
            $request_data = array();
            $employees = Employee::select('*');

            //Name
            if($request->name && $request->name[0] != 'all'){
                $employees->whereIn('id',$request->name);
                $request_data['name'] = $request->name;
            }else if($request->name && $request->name[0] == 'all'){
                $request_data['name'][0] = $request->name[0];
            }
            //Facility
            if($request->facility && $request->facility[0] != 'all'){
                $employees->whereIn('fac_id',$request->facility);
                $request_data['facility'] = $request->facility;
            }else if($request->facility && $request->facility[0] == 'all'){
                $request_data['facility'][0] = $request->facility[0];
            }
            //Unit
            if($request->unit && $request->unit[0] != 'all'){
                $employees->where(function ($employees) use ($request){
                    foreach ($request->unit as $item=>$key){
                        $employees->orWhere('units','like','%"'.$key.'"%');
                    }
                });
                $request_data['unit'] = $request->unit;
            }else if($request->unit && $request->unit[0] == 'all'){
                $request_data['unit'][0] = $request->unit[0];
            }
            //Disciplines
            if($request->discipline && $request->discipline[0] != 'all'){
                $employees->where(function ($employees) use ($request) {
                    foreach ($request->discipline as $item => $key) {
                        $employees->orWhere('disciplines', 'like', '%"' . $key . '"%');
                    }
                });
                $request_data['discipline'] = $request->discipline;
            }else if($request->discipline && $request->discipline[0] == 'all'){
                $request_data['discipline'][0] = $request->discipline[0];
            }

            //Job title
            if($request->job_title && $request->job_title[0] != 'all'){
                $employees->whereIn('job',$request->job_title);
                $request_data['job_title'] = $request->job_title;
            }else if($request->job_title && $request->job_title[0] == 'all'){
                $request_data['job_title'][0] = $request->job_title[0];
            }

            //Shift
            if($request->shift && $request->shift[0] != 'all'){
                $employees->where(function ($employees) use ($request) {
                    foreach ($request->shift as $item => $key) {
                        $employees->orWhere('shifts', 'like', '%"' . $key . '"%');
                    }
                });
                $request_data['shift'] = $request->shift;
            }else if($request->shift && $request->shift[0] == 'all'){
                $request_data['shift'][0] = $request->shift[0];
            }

            //Employee Type
            if($request->employees_type && $request->employees_type[0] != 'all'){
                $employees->whereIn('etid',$request->employees_type);
                $request_data['employees_type'] = $request->employees_type;
            }else if($request->employees_type && $request->employees_type[0] == 'all'){
                $request_data['employees_type'][0] = $request->employees_type[0];
            }

            $employees_data = $employees->get();

            //Rating
            if($request->rating && $request->rating[0] != 'all' && count($employees_data)>0){
                $min = array();
                $max = array();
                foreach ($request->rating as $item){
                    $min[] = substr($item,0,strpos($item, '-'));
                    $max[] = substr($item,strpos($item, '-')+1);
                }

                $result = array();
                foreach ($employees_data as $item){
                    for($i=0; $i<count($min); $i++){
                        if($item->rating($item->units) >= $min[$i] && $item->rating($item->units) <= $max[$i]){
                            $result[] = $item;
                            break;
                        }
                    }
                }

                $employees_data = $result;
                $request_data['rating'] = $request->rating;
            }else if($request->rating && $request->rating[0] == 'all'){
                $request_data['rating'][0] = $request->rating[0];
            }

            \Session::put('request_data', $request_data);
            \Session::put('employees_data', $employees_data);

            return view('admin.employee.index',compact('utype','employees_photo','facility','disciplines','job_titles','shifts','employees_types','employees_data','request_data'));
        }

        \Session::put('request_data', '');
        \Session::put('employees_data', '');

    	return view('admin.employee.index',compact('utype','employees_photo','facility','disciplines','job_titles','shifts','employees_types'));
    }
    public function edit($employee=null)
    {
        if(\Cache::get('function_amada') != 1){
            $profiles = EmployeeType::GetEmployeeType();
        }else{
            $profiles = EmployeeType::where('visiabled','0')
                                        ->select('id','name')
                                        ->orderBy('orderby')
                                        ->get();
        }
        $carriers = \DB::table('carriers')->select('id','name','address')->get();
        return view('admin.employee.add_edit',compact('profiles','carriers','employee'));
    }
    public function save(Request $request,$employee=null)
    {
        if($employee == null){
            $employee = new Employee;
            $rules = [
                'clockid'=>'required|unique:employee_master',
            ];
            $message = [
                'clockid.required' => 'The employee ID is required',
                'clockid.unique' => 'The employee ID has already been taken'
            ];
            $validator = Validator::make($request->all(),$rules,$message);
            if($validator->fails()){
                return redirect()->back()->withErrors($validator)->withInput();
            }
            if(\Input::get('password')){
                $employee->password = bcrypt(\Input::get('password'));
                if(\Input::get('password') == \Input::get('clockid') || self::passwordStrength(\Input::get('password')) < 2) {
                    $employee->status_pass = 0;
                }else{
                    $employee->status_pass = 1;
                }
            }else{
                $employee->password = bcrypt(\Input::get('clockid'));
                $employee->status_pass = 0;
            }
        }else{
            if(!empty(\Input::get('password'))){
                $employee->password = bcrypt(\Input::get('password'));
                if(\Input::get('password') == \Input::get('clockid') || self::passwordStrength(\Input::get('password')) < 2) {
                    $employee->status_pass = 0;
                }else{
                    $employee->status_pass = 1;
                }
            }
//            if(\Input::get('etid') == 3 || \Input::get('etid') == 4 || \Input::get('etid') == 7){
//                $employee->status_pass = 1;
//            }else{
//                $employee->status_pass = 0;
//            }
        }
        if(\Input::get('units')[0]=='all'){
            $units_item = \Input::get('unit_array');
            $units_array = explode(',', $units_item);
            $employee->units = $units_array;
        }else{
            $employee->units = \Input::get('units');
        }

        ///$employee->units = \Input::get('units');
        $employee->disciplines = \Input::get('disciplines');
        //$employee->employeeid = \Input::get('employeeid');
        $employee->clockid = \Input::get('clockid');
        $employee->employeeid = $employee->clockid;
        $employee->job = \Input::get('job');
        $employee->firstname = \Input::get('firstname');
        $employee->lastname = \Input::get('lastname');
        $employee->email = \Input::get('email');
        $employee->etid = \Input::get('etid');
        $employee->address = \Input::get('address');
        $employee->bio = \Input::get('bio');
        $employee->bio_new = null;
        $employee->status = 0;
        if($employee->mobile != \Input::get('mobile')){
            $employee->carrier = CarriersOnline::carrier(\Input::get('mobile'));
        }
        $employee->mobile = \Input::get('mobile');
		if(\Input::get('fac_id'))
        {
        	$employee->fac_id = \Input::get('fac_id');
        }
        else
        {
        	$employee->fac_id = \Auth::user()->fac_id;
        }
        //if($request->has('hiredate'))
        //dd($request->hiredate)
        $employee->hiredate = $request->hiredate;
        $employee->shifts = \Input::get('shifts');
        if(!$employee->created_at){
            $employee->created_at = Carbon::now();
        }

        if($employee->save())
            if(\Input::hasFile('image') && $request->employeeimg != "")
            {
            	//$image = $employee->clockid."_".\Input::file('image')->getClientOriginalName();

                if(\Input::file('image')->isValid()){
//                    if($request->file('image')->getSize()>1000000){
//                        return redirect()->back()->withErrors(['image' => 'File size must be less than 1 MB'])->withInput();
//                    }
                    $image = $employee->clockid.mt_rand(0,65535999)."_.png";
                    $request->file('image')->move(public_path()."/uploads/profiles", $image);
                    $this->base64_to_jpeg($request->employeeimg, public_path()."/uploads/profiles/".$image);
                    $employee->image = $image;
                    $employee->save();
                }
            }
        return redirect()->route('admin::employee::index');
    }
    public function isValid($field)
    {
        if(!Employee::where($field,'=',\Input::get($field))->count())
            return Response::json(0, 200);
        return Response::json(0, 404);
    }
    public function search()
    {
        $q = \Input::get('q');
        return Response::json(Employee::search($q));
        // return Response::json(['total_count'=>$results->count(),'items'=>$results,'incomplete_results'=>false], 200);
    }
    public function delete($employee)
    {
        // delete anwser
        Answer::where('eid',$employee->id)->delete();

        // delete adwards
        Award::where('user_id',$employee->id)->delete();

        // delete comments
        Comments::where('employee_id',$employee->id)->delete();

        // delete employee_notification
        EmployeeNotification::where('employee_id',$employee->id)->delete();

        // Delete employee_shift
        \DB::table('employee_shift')->where('employee_id',$employee->id)->delete();

        // Delete newsfeed_comments
        NewsFeedComment::where('user_id',$employee->id)->delete();

        // Delete newsfeed_like
        NewsFeedLike::where('user_id',$employee->id)->delete();

        // Delete newsfeed_tag
        NewsFeedTag::where('users_id',$employee->id)->delete();

        // Delete Survey
        Survey::where('employee_id',$employee->id)->delete();

        $employee->delete();
        return response()->json(['success'=>true,'message'=>'Employee deleted successfully.']);
    }

    public function approve($employee)
    {
        $employee->image = $employee->image_new;
        \File::copy(public_path()."/uploads/profiles/waiting/".$employee->image_new,public_path()."/uploads/profiles/".$employee->image_new);
        $employee->status = 0;
        $employee->save();
        return response()->json(['success'=>true,'message'=>'Employee Photo accepted successfully.','status'=>$employee->status]);
    }
    public function reject($employee)
    {
        $employee->status = 2;
        $employee->save();
        return response()->json(['success'=>true,'message'=>'Employee Photo rejected.','status'=>$employee->status]);
    }

    public function base64_to_jpeg($base64_string, $output_file) {
        $ifp = fopen($output_file, "wb");

        $data = explode(',', $base64_string);

        fwrite($ifp, base64_decode($data[1]));
        fclose($ifp);

        return $output_file;
    }

    public static function passwordStrength($password){
		$score  = 0;

        if (preg_match('/[a-zA-Z]/', $password) && preg_match('/[0-9]/', $password) && strlen($password) == 8){
            if(preg_match('/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/', $password)){
                $score = 3;
            }else{
                $score = 2;
            }
		} else if (preg_match('/[a-zA-Z]/', $password) && preg_match('/[0-9]/', $password) && strlen($password) > 8){
            $score = 3;
        } else {
            $score = 1;
		}

		return $score;
	}

	public function approveBio($employee){
        $employee->bio = $employee->bio_new;
        $employee->bio_new = null;
        $employee->status = 0;
        $employee->save();
        return response()->json(['success'=>true,'message'=>'Employee Bio accepted successfully.','status'=>$employee->status]);
    }

    public function rejectBio($employee){
	    $employee->bio_new = null;
        $employee->status = 2;
        $employee->save();
        return response()->json(['success'=>true,'message'=>'Employee Bio rejected.','status'=>$employee->status]);
    }

    public function postExportXLS(Request $request){

        $employees_data = \Session::get('employees_data');

        $job_titles = CodeMaster::where('type','job_title')->orderby('value')->get();

        // instantiate and use the dompdf class
        $dompdf = new Dompdf();

        ob_start();
        ?>
        <h1 class="text-center">Performance Report</h1>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Wambi Rating</th>
                    <th scope="col">Name</th>
                    <th scope="col">Discipline</th>
                    <th scope="col">Job Title</th>
                    <th scope="col">Unit</th>
                    <th scope="col">Shift</th>
                    <th scope="col">Pecks</th>
                    <th scope="col">Total # of Surveys</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($employees_data as $item){ ?>
                <tr>
                    <td><?php echo $item->rating($item->units); ?></td>
                    <td><?php echo $item->name(); ?></td>
                    <td><?php echo $item->disciplines(); ?></td>
                    <td>
                        <?php
                            if(array_has($job_titles,$item->job))
                                echo $job_titles[$item->job]->value;
                        ?>
                    </td>
                    <td><?php echo $item->unitname(); ?></td>
                    <td><?php echo $item->shift_times(); ?></td>
                    <td><?php echo $item->pecks; ?></td>
                    <td><?php echo $item->totalpeck(); ?></td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
        <?php
        $html = ob_get_clean();

        $dompdf->loadHtml($html);

        // Render the HTML as PDF
        $dompdf->render();

        // Output the generated PDF to Browser
        $dompdf->stream();

        return $dompdf;

    }
}
