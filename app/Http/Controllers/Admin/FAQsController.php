<?php

namespace App\Http\Controllers\Admin;


use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Barryvdh\TranslationManager\Models\Translation;
use Illuminate\Support\Collection;
use Barryvdh\TranslationManager\Manager;
use App\QA;
use App\EmployeeType;
use App\Http\Controller\Auth;

class FAQsController extends Controller
{
    function __construct()
    {
        \View::composers([
            'App\Composers\Help'  => ['partials.footer'],
            'App\Composers\FAQs'  => ['admin.partials.faqs'],

            ]);
    }

    /** @var \Barryvdh\TranslationManager\Manager  */
    public function getview()
    {
        $utype = \DB::select("SELECT name  FROM employee_type union select 'Front-End' as name");
        //dd($utype);
        return view('admin.faqs.index',compact('utype'));
    }

    public function edit($faqs = null)
    {
        
        $faqs = QA::where('qaid','=',$faqs)->first();                 
    	$profiles = EmployeeType::select('id','name')->get();        
    	return view('admin.partials.add-question-anwser',compact('profiles','faqs'));
    }

    public function save($faqs = null)
    {
        $qa = null;
    	if($faqs == null){
    		$qa = new QA();
    		$qa->created_at = time();
    		$qa->created_user = \Auth::user()->clockid;    		
    	}
        else
        {
            $qa = QA::where('qaid','=',$faqs)->first();
            //dd($qa);        
        }
    	$qa->updated_at = time();
    	$qa->updated_user = \Auth::user()->clockid;
    	$qa->qaid = \Input::get('qaid');
    	$qa->question = \Input::get('Qcontent');
    	$qa->anwser = \Input::get('Acontent');
    	$qa->utype = \Input::get('utype');
        $qa->q_es = \Input::get('Qescontent');
        $qa->a_es = \Input::get('Aescontent');        
    	$message = "Question and Anwser could not been created";
    	if($qa->save())
    	{
    		$message = "Question and Anwser has been saved";    		
    		return redirect(route('admin::faqs::view'))->with('message',$message);
    	}
    	return redirect(route('admin::faqs::add'))->with('message',$message);

    }

    public function delete($faqs)
    {
        //dd($qa);
        QA::where('qaid','=',$faqs)->delete();
        return response()->json(['success'=>true,'message'=>'FAQs deleted successfully.']);
    }
}
