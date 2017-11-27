<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
use App\Permission;
use App\Role;
use App\EmployeeType;
Route::model('role', 'App\EmployeeType');
Route::get('role/{role}',function($role=null){
    $permissons = Permission::all();
    $p = $role->permissions->pluck('name')->all();
    $roles = EmployeeType::all();
    return view('admin.role',compact('permissons','roles','p','role'));
});
Route::post('role/{role}',function(){
    $role = EmployeeType::find(\Input::get('role'));
    $role->permissions()->attach(\Input::get('permissons'));
    $role->save();
    return redirect('role');
});
use App\Employee;
use App\Patient;
use App\Survey;
use App\Answer;
use App\CodeMaster;
use Carbon\Carbon;

// fix notifications
Route::get('fix/notifications', function() {
    // \DB::table("employee_notification")->where('content->peck','<=','30')->where('notification_id',3)->delete();
    $n = \DB::table("employee_notification")->where('notification_id',3)->get();
    foreach ($n as $key => $value) {
        $peck = json_decode($value->content);
        if($peck->peck <= 30){
            \DB::table("employee_notification")->where('id',$value->id)->delete();
        }
    }
    return redirect('/');
});
// gen data
Route::get('fix/pecks',function(){
    $surveys  = \DB::select("select employee_id,sum(total) pecks from surveys group by employee_id");
    foreach ($surveys as $key => $value) {
        $employee = Employee::find($value->employee_id);
        if($employee){
            $employee->pecks = 0;
            // $system_start_date = config('system.start');
            // $hiredate = Carbon::createFromFormat("m/d/Y",$employee->hiredate);
            // $today = Carbon::today();
            // $tenureyear = $today->year - $hiredate->year - ($today->format("m-d")<$hiredate->format("m-d"));
            // $pecks = 500;
            // for($i = 0;$i<$tenureyear;$i++){
            //     if($system_start_date < $today->format("Y-m-d")){
            //         if($i < 5){
            //             $pecks = 750;
            //         }else{
            //             $pecks = 1000;
            //         }
            //     }
            //     $employee->pecks += $pecks;
            // }                
            $employee->pecks += $value->pecks;
            $employee->save();
        }
    }
    return redirect('/survey/complete');
});
Route::get('gen/{period}',function($period){
    \DB::table('answers')->truncate();
    \DB::table('surveys')->truncate();
    $types = ['patient','family_member','other'];
    $peck_keys = ['poor','fair','ok','good','great'];
    $pecks = CodeMaster::get_code_master('pecks_for_answer');
    $date = Carbon::now();
    $employee = Employee::where('etid',2)->get();
    $patient = Patient::all();
    $patient_count = $patient->count();
    for($t=0;$t<$period;$t++){
        foreach($employee as $e){
            $unit = $e->units[0];
            $pid = $patient[round(mt_rand(0,$patient_count-1))]->pid;
            $survey = new Survey;
            $survey->employee_id = $e->id;
            $survey->unit_id = $unit;
            $survey->patient_id = $pid;
            $survey->type = $types[round(mt_rand(0,2))];
            $survey->created_at = $date;
            $survey->discipline = $e->disciplines[0];
            $survey->total = 0;
            $survey->save();
            for($i=1;$i<6;$i++){
                $answer = new Answer;
                $answer->eid = $e->id;
                $answer->unit_id = $unit;
                $answer->catid = $e->disciplines[0];
                $answer->user_type = $survey->type;
                $answer->qid = $i;
                $answer->pid = $pid;
                $answer->peck = $pecks[$peck_keys[round(mt_rand(0,4))]]->value;
                $answer->date = $date;
                $answer->survey_id = $survey->id;
                $survey->total += $answer->peck;
                $answer->save();
            }
            $survey->avg = $survey->total/5;
            $survey->save();
        }     
        $date->subDay();   
    }
    return redirect('/admin/data');
});


/** ------------------------------------------
 *  Route model binding
 *  ------------------------------------------
 */
Route::model('reward', 'App\Reward');
Route::model('survey', 'App\Survey');
Route::model('question', 'App\Question');
Route::model('award', 'App\Award');
Route::model('patient', 'App\Patient');
Route::model('news', 'App\News');
Route::model('shift_master', 'App\Shift');
Route::model('shift_request', 'App\Shift');
Route::model('employee', 'App\Employee');
Route::group(['prefix' => 'media','as'=>'media::'], function() {
    Route::post('upload/{folder}',['as'=>'upload','uses'=>'MediaController@upload']);
});
// Locale route
Route::get('locale/{locale}', function($locale) {
    App::setLocale($locale);
    \Session::set('locale',$locale);
    return redirect('');
});
// Authentication routes...
Route::get('auth/login', ['as'=>'backend-login','uses'=>'LoginController@getLogin']);
Route::get('auth/recovery', ['as'=>'backend-recovery','uses'=>'LoginController@getRecovery']);
Route::post('auth/recovery', ['as'=>'backend-recovery','uses'=>'LoginController@postRecovery']);
Route::post('admin/login', 'LoginController@postLogin');
Route::get('logout', ['as'=>'logout','uses'=>'LoginController@getLogout']);
Route::get('changePassword',['as'=>'changePassword','uses'=>'LoginController@changePassword']);
Route::post('changePassword',['as'=>'changePassword','uses'=>'LoginController@postchangePassword']);
Route::group(['prefix' => 'admin','namespace' => 'Admin','as'=>'admin::', 'middleware' => 'admin'], function(){
    /* translate */    
    Route::controller('translations','TranslateController');
    Route::get('resize', ['as'=>'resize','uses'=>'DashboardController@getResize']);
    /* graph */
    Route::get('graph/{period}', ['as'=>'graph','uses'=>'SurveyController@graph']);
    /* data */
    Route::get('data', ['as'=>'data','uses'=>'SurveyController@getData']);
    Route::get('data/{keytab}', ['as'=>'dataall','uses'=>'SurveyController@getData']);
    /*Comments*/
    Route::get('comments', ['as'=>'comments','uses'=>'CommentsController@getData']);
    Route::post('load-data-comment', ['as'=>'load-data-comment','uses'=>'CommentsController@loadDataComment']);
    /* dashboard */
    Route::get('',['as' => 'dashboard', 'uses' => 'DashboardController@index']);
    ROute::post('set_unit',['as'=>'set_unit','uses'=>'DashboardController@set_unit']);
    ROute::post('set_fac',['as'=>'set_fac','uses'=>'DashboardController@set_fac']);
    /* shifts */
    Route::group(['prefix'=>'shift','as'=>'shift::'],function(){
        Route::get('',['as'=>'index','uses'=>'ShiftController@getIndex']);
        Route::get('edit/{shift_master}',['as'=>'edit','uses'=>'ShiftController@edit']);
        Route::get('add',['as'=>'edit','uses'=>'ShiftController@edit']);
        Route::post('edit/{shift_master}',['as'=>'edit','uses'=>'ShiftController@save']);
        Route::post('add',['as'=>'add','uses'=>'ShiftController@save']);
        Route::post('delete/{shift_master}',['as'=>'delete','uses'=>'ShiftController@delete']);
        Route::post('approve/{shift_request}/{employee_id}',['as'=>'approve','uses'=>'ShiftController@approve']);
        Route::post('reject/{shift_request}',['as'=>'reject','uses'=>'ShiftController@reject']);
    });
    // Route::controller('shift','ShiftController');
    /* awards */
    Route::group(['prefix'=>'award','as'=>'award::'],function(){
        Route::get('add',['as'=>'add','uses'=>'AwardController@edit']);
        Route::get('edit/{award}',['as'=>'edit','uses'=>'AwardController@edit']);
        Route::post('add',['as'=>'add','uses'=>'AwardController@save']);
        Route::post('edit/{award}',['as'=>'edit','uses'=>'AwardController@save']);
        Route::get('',['as'=>'index','uses'=>'AwardController@getIndex']);
        Route::post('delete/{award}',['as'=>'delete','uses'=>'AwardController@delete']);
        Route::post('approve/{award}',['as'=>'approve','uses'=>'AwardController@approve']);
        Route::post('reject/{award}',['as'=>'reject','uses'=>'AwardController@reject']);
        Route::post('get-unit',['as'=>'get-unit','uses'=>'AwardController@postUnit']);
    });
    /* reward */
    Route::group(['prefix' => 'reward','as'=>'reward::'], function() {
        Route::get('',['as'=>'index','uses'=>'RewardController@getIndex']);
        Route::get('add',['as'=>'add','uses'=>'RewardController@edit']);
        Route::get('edit/{reward}',['as'=>'edit','uses'=>'RewardController@edit']);
        Route::post('add',['as'=>'edit','uses'=>'RewardController@save']);
        Route::post('edit/{reward}',['as'=>'edit','uses'=>'RewardController@save']);
        Route::post('delete/{reward}',['as'=>'delete','uses'=>'RewardController@delete']);
    });
    /* news */
    Route::group(['prefix' => 'news','as'=>'news::'], function() {
        Route::get('',['as'=>'index','uses'=>'NewsController@getIndex']);
        Route::get('add',['as'=>'add','uses'=>'NewsController@edit']);
        Route::get('edit/{news}',['as'=>'edit','uses'=>'NewsController@edit']);
        Route::post('add',['as'=>'edit','uses'=>'NewsController@save']);
        Route::post('edit/{news}',['as'=>'edit','uses'=>'NewsController@save']);
        Route::post('delete/{news}',['as'=>'delete','uses'=>'NewsController@delete']);
    });    
    // Route::controller('news','NewsController');
    /* employee */
    Route::group(['prefix'=>'employee','as'=>'employee::'],function(){
        Route::get('add',['as'=>'add','uses'=>'EmployeeController@edit']);
        Route::post('add',['as'=>'add','uses'=>'EmployeeController@save']);
        Route::get('edit/{employee}',['as'=>'edit','uses'=>'EmployeeController@edit']);
        Route::post('edit/{employee}',['as'=>'edit','uses'=>'EmployeeController@save']);
        Route::post('delete/{employee}',['as'=>'delete','uses'=>'EmployeeController@delete']);
        Route::post('validate/{field}',['as'=>'validate','uses'=>'EmployeeController@isValid']);
        Route::post('search',['as'=>'search','uses'=>'EmployeeController@search']);
        Route::get('',['as'=>'index','uses'=>'EmployeeController@index']);
        Route::get('view/{employee}',['as'=>'view','uses'=>'EmployeeController@view']);
        Route::post('approve/{employee}',['as'=>'approve','uses'=>'EmployeeController@approve']);
        Route::post('reject/{employee}',['as'=>'reject','uses'=>'EmployeeController@reject']);
        Route::post('approve-bio/{employee}',['as'=>'approve-bio','uses'=>'EmployeeController@approveBio']);
        Route::post('reject-bio/{employee}',['as'=>'reject-bio','uses'=>'EmployeeController@rejectBio']);

        Route::get('performance-report', ['as' => 'performance-report', 'uses' => 'EmployeeController@getPerformanceReport']);
        Route::get('export-xls', ['as' => 'export-xls', 'uses' => 'EmployeeController@postExportXLS']);
        Route::get('print-view/{employee}',['as'=>'print-view','uses'=>'EmployeeController@printView']);
    });
    /* patient */
    Route::group(['prefix' => 'patient','as'=>'patient::'], function() {
        Route::get('add',['as'=>'add','uses'=>'PatientController@edit']);
        Route::get('edit/{patient}',['as'=>'edit','uses'=>'PatientController@edit']);
        Route::post('edit/{patient}',['as'=>'edit','uses'=>'PatientController@save']);
        Route::post('add',['as'=>'add','uses'=>'PatientController@save']);
        Route::post('delete/{patient}',['as'=>'delete','uses'=>'PatientController@delete']);
        Route::post('send/{patient}',['as'=>'send','uses'=>'PatientController@sendAccessCode']);
        Route::get('',['as'=>'index','uses'=>'PatientController@getIndex']);
    });

    /* ambassador */
    Route::group(['prefix' => 'ambassador','as'=>'ambassador::'], function() {
        Route::get('add',['as'=>'add','uses'=>'AmbassadorController@edit']);
        Route::get('edit/{patient}',['as'=>'edit','uses'=>'AmbassadorController@edit']);
        Route::post('edit/{patient}',['as'=>'edit','uses'=>'AmbassadorController@save']);
        Route::post('add',['as'=>'add','uses'=>'AmbassadorController@save']);
        Route::post('delete/{patient}',['as'=>'delete','uses'=>'AmbassadorController@delete']);
        Route::post('send/{patient}',['as'=>'send','uses'=>'AmbassadorController@sendAccessCode']);
        Route::get('',['as'=>'index','uses'=>'AmbassadorController@getIndex']);
    });

    /* survey */
    Route::group(['prefix' => 'survey','as'=>'survey::'], function() {
        Route::get('', ['as'=>'index','uses'=>'SurveyController@getIndex']);
        Route::post('save/{question}', ['as'=>'save','uses'=>'SurveyController@save']);
        Route::post('update/{question}', ['as'=>'save','uses'=>'SurveyController@update']);
        Route::post('add', ['as'=>'add','uses'=>'SurveyController@add']);
        Route::post('delete/{survey}', ['as'=>'delete','uses'=>'SurveyController@delete']);
        // exit survey
        Route::post('save_exit/{question_exit}', ['as'=>'save_exit','uses'=>'SurveyController@save_exit']);
        Route::post('update_exit/{question_exit}', ['as'=>'save_exit','uses'=>'SurveyController@update_exit']);
        Route::post('add_exit', ['as'=>'add_exit','uses'=>'SurveyController@add_exit']);
    });
   
    /* FAQs*/
    Route::group(['prefix'=>'faqs','as'=>'faqs::'],function()
    {
        Route::get('', ['as'=>'view','uses'=>'FAQsController@getview']);
        Route::post('add',['as'=>'add','uses'=>'FAQsController@save']);
        Route::get('add','FAQsController@edit');
        Route::get('edit/{faqs}',['as'=>'edit','uses'=>'FAQsController@edit']);
        Route::post('edit/{faqs}',['as'=>'edit','uses'=>'FAQsController@save']);
        Route::post('delete/{faqs}',['as'=>'delete','uses'=>'FAQsController@delete']);
    });

    /*Config Survey*/
    Route::group(['prefix'=>'config','as'=>'config::'],function(){
        Route::get('',['as'=>'view','uses'=>'ConfigController@getView']);
        Route::post('/patient',['as'=>'patient','uses'=> 'ConfigController@postPatient']);
        Route::post('/survey',['as'=>'survey','uses'=> 'ConfigController@postSurvey']);
        Route::post('/shift',['as'=>'shift','uses'=> 'ConfigController@postShift']);
        Route::post('/performance',['as'=>'performance','uses'=> 'ConfigController@postPerformance']);
        Route::post('/set_fac_unit',['as'=>'set_fac_unit','uses'=> 'ConfigController@set_fac_unit']);
        Route::group(['prefix'=>'award','as'=>'award::'],function(){
            Route::post('/delete',['as'=>'delete','uses'=> 'ConfigController@postAwardDelete']);
            Route::post('/save',['as'=>'save','uses'=> 'ConfigController@postAwardSave']);    
        });
        
    });
	// setting Care postcard on wambi
	Route::get('cpc-url',['uses'=>'SettingController@index']);
    Route::post('cpc-url',['uses'=>'SettingController@edit']);
    
    /*List Facilities and Units*/
    Route::group(['prefix'=>'list','as'=>'list::'],function(){
        Route::get('',['as'=>'index','uses'=>'ListFacilityAndUnitController@getIndex']);
        Route::get('edit/{type}',['as'=>'edit','uses'=>'ListFacilityAndUnitController@edit']);
        Route::get('add/{type}',['as'=>'add','uses'=>'ListFacilityAndUnitController@edit']);
        Route::post('edit/{type}',['as'=>'edit','uses'=>'ListFacilityAndUnitController@save']);
        Route::post('delete/{type}',['as'=>'delete','uses'=>'ListFacilityAndUnitController@delete']);
    });

    /*List Disciplines and Job Title*/
    Route::group(['prefix'=>'listdiscipline','as'=>'listdiscipline::'],function(){
        Route::get('',['as'=>'index','uses'=>'ListDisciplineOrJobTitleController@getIndex']);
        Route::get('edit/{type}',['as'=>'edit','uses'=>'ListDisciplineOrJobTitleController@edit']);
        Route::get('add/{type}',['as'=>'add','uses'=>'ListDisciplineOrJobTitleController@edit']);
        Route::post('edit/{type}',['as'=>'edit','uses'=>'ListDisciplineOrJobTitleController@save']);
        Route::post('delete/{type}',['as'=>'delete','uses'=>'ListDisciplineOrJobTitleController@delete']);
    });

    /*Import excel*/
    Route::group(['prefix'=>'import','as'=>'import::'],function(){
        Route::get('',['as'=>'index','uses'=>'ExcelController@upload']);
        Route::get('export',['as'=>'export','uses'=>'ExcelController@exportclients']);
        Route::post('import',['as'=>'import','uses'=>'ExcelController@importclients']);
    });
    
    	/* Review */
    Route::group(['prefix' => 'review','as'=>'review::'], function() {
        Route::get('', ['as'=>'index','uses'=>'ReviewController@getIndex']);
        Route::get('selectunit', ['as'=>'selectunit','uses'=>'ReviewController@postSelectUnit']);
        Route::get('caregivers', ['as'=>'caregivers','uses'=>'ReviewController@getCaregivers']);
        Route::post('search', ['as'=>'search','uses'=>'ReviewController@postSearch']);
        Route::post('check', ['as'=>'check','uses'=>'ReviewController@postCheck']);
	    Route::get('employee/{employee}', ['as'=>'employee','uses'=>'ReviewController@survey']);
	    Route::post('employee/{employee}', ['as'=>'save','uses'=>'ReviewController@save']);
	    Route::get('comment', ['as'=>'comment','uses'=>'ReviewController@comments']);
	    Route::post('comment', ['as'=>'comment','uses'=>'ReviewController@postComment']);
		Route::get('complete', ['as'=>'complete','uses'=>'ReviewController@getComplete']);
		Route::post('send-carepostcard', 'ReviewController@postCarepostcard');
		Route::post('add-tags', 'ReviewController@postTags');
		Route::post('write-postcard', 'ReviewController@postWritePostcard');
		Route::get('thanks', 'ReviewController@getThanks');
		Route::get('thanks-completed', 'ReviewController@getThanksComplete');



    });

});
/* employee routes */
Route::group(['prefix' => 'employee','as'=>'employee::', 'middleware' => 'auth'], function() {
    Route::get('', ['as'=>'dashboard','uses'=>'EmployeeController@index']);
    Route::get('graph/{eid}/{period}', ['as'=>'graph','uses'=>'EmployeeController@graph']);
    Route::get('graph-all/{eid}/{period}', ['as'=>'graph','uses'=>'EmployeeController@graph_all']);
    Route::group(['prefix' => 'shift','as'=>'shift::'], function() {
        Route::post('request/{shift_request}',['as'=>'request','uses'=>'EmployeeController@request']);
    });
    Route::post('notifications',['as'=>'notifications','uses'=>'EmployeeController@notifications']);
    Route::group(['prefix'=>'reward','as'=>'reward::'],function(){
        Route::get('',['as'=>'index','uses'=>'EmployeeController@reward']);
        Route::post('redeem/{reward}',['as'=>'redeem','uses'=>'EmployeeController@redeem']);
    });
    Route::get('settings',['as'=>'settings','uses'=>'EmployeeController@settings']);
    Route::post('settings',['as'=>'settings','uses'=>'EmployeeController@save_settings']);

});

use App\CustomerIndex;
use App\CustomerFunction;
// Xu li out patient
Route::get('/clearCache', function() {
    // \DB::table("employee_notification")->where('content->peck','<=','30')->where('notification_id',3)->delete();    
    \Cache::flush();
    \Cache::forget('current_index');  
    \Cache::forget('function_ambassador');
    return redirect('/');
});
//\Cache::forget('current_index');
//dd(\Cache::has('current_index'));
if(!\Cache::has('current_index'))
{    
    \Cache::rememberForever('current_index',function(){
        $out_patient = CustomerFunction::f_out_patient();
        //dd($out_patient);
        //$out_patient = 1;
        return $current_index = $out_patient;
    });
}
if(config("customerindex.out_patient") == Cache::get('current_index')){
    \Cache::rememberForever('function_ambassador',function(){
    	return CustomerFunction::ambassador();
    });
    \Cache::rememberForever('function_amada',function(){
        return CustomerFunction::amada();
    });
       
}

if(\Cache::get('function_ambassador') ==1)
{
	// timeZone for Methodist
	//They are "Pacific time / PST" -- Which is "America/Los_Angeles"
	Config::set('app.timezone', 'America/Los_Angeles');
	//dd(Config::get('app.timezone'));
}
//dd(\Cache::get('function_ambassador'));
//dd(config("customerindex.santaanita"));
//dd(Cache::get('current_index'));
if(config("customerindex.out_patient") == Cache::get('current_index'))
    Route::get('/', ['as'=>'home','middleware'=>'locale','uses'=>'Frontend\SurveyController@getIndexOutPatient']);
else
    Route::get('/', ['as'=>'home','middleware'=>'locale','uses'=>'Frontend\SurveyController@getIndex']);
// Enter your phone number or email
Route::get('phonenumber-email', ['as'=>'phonenumber-email','middleware'=>'locale','uses'=>'Frontend\SurveyController@getPhoneNumberOrEmail']);
Route::post('phonenumber-email', ['as'=>'phonenumber-email','uses'=>'Frontend\SurveyController@postPhoneNumberOrEmail']);
Route::get('selectunit', ['as'=>'selectunit','middleware'=>'locale','uses'=>'Frontend\SurveyController@getSelectUnit']);
Route::post('selectunit', ['as'=>'selectunit','uses'=>'Frontend\SurveyController@postSelectUnit']);

Route::get('code', ['as'=>'code','middleware'=>'locale','uses'=>'Frontend\SurveyController@getCode']);
Route::post('code', ['as'=>'code','uses'=>'Frontend\SurveyController@postCode']);
Route::post('recovercode', ['as'=>'recovercode','uses'=>'Frontend\SurveyController@postRecovercode']);
Route::get('login', ['as'=>'login','middleware'=>'locale','uses'=>'Frontend\SurveyController@getLogin']);
Route::post('login', ['as'=>'login','uses'=>'Frontend\SurveyController@postLogin']);
Route::get('survey/exit-survey', ['as'=>'exit-survey','uses'=>'Frontend\SurveyController@exit_survey']);
Route::post('survey/exit-survey', ['as'=>'exit-survey','uses'=>'Frontend\SurveyController@save_exit_survey']);
Route::get('survey/comment', ['as'=>'comment','uses'=>'Frontend\SurveyController@comments']);
Route::get('survey/complete', ['as'=>'complete','uses'=>'Frontend\SurveyController@getComplete']);
Route::post('survey/send-carepostcard', 'Frontend\SurveyController@postCarepostcard');
Route::post('survey/add-tags', 'Frontend\SurveyController@postTags');
Route::post('survey/write-postcard', 'Frontend\SurveyController@postWritePostcard');
Route::get('survey/thanks', 'Frontend\SurveyController@getThanks');
Route::get('survey/thanks-completed', 'Frontend\SurveyController@getThanksComplete');
Route::get('test', 'Frontend\SurveyController@test');
Route::group(['prefix'=>'survey','as'=>'survey::','middleware'=>'survey','namespace'=>'Frontend'], function(){
    Route::get('employee/{employee}', ['as'=>'employee','uses'=>'SurveyController@survey']);
    Route::post('employee/{employee}', ['as'=>'save','uses'=>'SurveyController@save']);
    Route::controller('/', 'SurveyController');
    Route::post('comment', ['as'=>'comment','uses'=>'Frontend\SurveyController@postComment']);
});
Route::group(['prefix'=>'notifications','as'=>'notifications::'], function(){
    Route::post('mark_read', ['as'=>'mark_read','uses'=>'NotificationController@mark_read']);
});

// NewsFeed like and comment routes
Route::get('/news/{news}',['as'=>'newsfeed.show','uses'=>'Admin\NewsController@show']);
Route::post('likeNews',['as'=>'newsfeed.like','uses'=>'Admin\NewsController@likeNews']);
Route::post('unLikeNews',['as'=>'newsfeed.unlike','uses'=>'Admin\NewsController@unLikeNews']);
Route::post('addComment',['as'=>'newsfeed.comment','uses'=>'Admin\NewsController@addComment']);
Route::post('deleteComment/{comment}',['as'=>'newsfeed.deleteComment','uses'=>'Admin\NewsController@deleteNewsFeedComment']);


// Process auto fix data carrier
// Xu li out patient
use App\CarriersOnline;
use App\PatientFamily;
Route::get('/updateCarrier', function() {
    set_time_limit(600);
    // Get data null carrier
    $employee = Employee::where('carrier','')
                            ->where('mobile','<>','')->get();
    foreach ($employee as $key) {
        $key->carrier = CarriersOnline::carrier($key->mobile);
        $key->save();    
    }

    // $patient
    $patient = Patient::where('patient_carrier','')
                            ->where('mobile','<>','')->get();
    foreach ($patient as $key) {
        $key->carrier = CarriersOnline::carrier($key->mobile);
        $key->save();    
    } 
    
    $patient_family = PatientFamily::where('carrier','')
                            ->where('numberphone','<>','')->get();
    foreach ($patient_family as $key) {
        $key->carrier = CarriersOnline::carrier($key->numberphone);
        $key->save();    
    }                            
    return redirect('/');
});

Route::get('/updatePassword', function() {
    set_time_limit(600);
    // Get data null carrier
    $employee = Employee::whereNotIn('etid', [3, 4, 7])
    							->get();
    foreach ($employee as $key) {
        $key->password = bcrypt($key->clockid);
        $key->status_pass = 0;
        $key->save();    
    }
                   
    return redirect('/');
});

Route::get('/update-status-password', function() {
    $employee = Employee::whereIn('etid', [3, 4, 7])->get();
    foreach ($employee as $key) {
        $key->status_pass = 1;
        $key->save();
    }
    return redirect('/');
});

Route::get('/update-phone-ambassador', function() {
    $datas = Patient::where('mobile', '<>', '')->get();
    if(count($datas)>0) {
        foreach ($datas as $data) {
            $mobile = $data->mobile;
            $mobile = str_replace('(','',$mobile);
            $mobile = str_replace(')','',$mobile);
            $mobile = str_replace('-','',$mobile);
            $mobile = str_replace('+','',$mobile);
            $mobile = str_replace(' ','',$mobile);
            $data->mobile = $mobile;
            $data->save();
        }
    }
    return redirect('/');
});
