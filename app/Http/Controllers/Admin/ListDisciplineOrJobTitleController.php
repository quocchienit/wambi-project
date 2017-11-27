<?php

namespace App\Http\Controllers\Admin;
use Auth;
use Illuminate\Http\Request;
use Input;
use App\CodeMaster;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\ConfigPeck;

class ListDisciplineOrJobTitleController extends Controller
{
    function __construct()
    {
         \View::composers([            
            'App\Composers\Unit'  => ['admin.*'],
            'App\Composers\Help'  => ['partials.footer'],               
        ]);
    }
    public function getIndex()
    {
    	
        if(\Auth::user()->type() == 'super-admin' && \Cache::get('function_amada') == 1){
            $discipline = CodeMaster::where('type','discipline')->where('refkey',\Session::get('current_unit'))->get();
            $jobtitle = CodeMaster::where('type','job_title')->where('refkey',\Session::get('current_unit'))->get();
        }else{
            $discipline = CodeMaster::where('type','discipline')->get();
            $jobtitle = CodeMaster::where('type','job_title')->get();
        }
        /*
        $jobtitle = CodeMaster::join('code_master as a','a.key','=','code_master.notes')                
                ->where('code_master.type','job_title')->where('a.type','discipline')
                ->where('code_master.notes','a.key')
                ->select('code_master.*','a.value as disname')->get();
                */
        //dd($jobtitle);
        return view('admin.partials.list.disciplinejobtitle.index',compact('discipline','jobtitle'));
    }

    public function edit($type = null)
    {
        $id = \Request::get('id');
        if($id){
            $data = CodeMaster::where('type',$type)
                                ->where('id',$id)
                                ->get();
            if($data->count() > 0){
                $data = $data[0];                
            }
        }
        
        $discipline = CodeMaster::where('type','discipline')->get();
        //dd($discipline);
        return view('admin.partials.list.disciplinejobtitle.edit',compact('data','discipline','type'));
    }

    public function save($type = null){
        $id = \Request::get('id');                
        if($id){
            $codemaster = CodeMaster::where('type',$type)
                                ->where('id',$id)->get();            

            if($codemaster->count() > 0){
                    $codemaster = $codemaster[0];                
            }else{
                $codemaster = new CodeMaster();
                $codemaster->type = $type;
                $codemaster->key = CodeMaster::where('type',$type)->max('key') + 1;
            }
        }else{
            $codemaster = new CodeMaster();
            $codemaster->type = $type;
            $codemaster->key = CodeMaster::where('type',$type)->max('key') + 1;
        }
        $codemaster->value = \Input::get('name');
        $codemaster->notes = \Input::get('discipline');
        if(\Cache::get('function_amada') == 1)  $codemaster->refkey = \Input::get('unit');
        $codemaster->save();
        if($type == 'discipline')
        	\Cache::forget('disciplines');
        else
        	\Cache::forget('job_titles');
        return redirect()->route('admin::listdiscipline::index');
    }

    public function delete($type = null){
        $id = \Request::get('id');
        if($id){
            CodeMaster::where('type',$type)->where('id',$id)->delete();
            return response()->json(['success'=>true,'message'=>'Deleted']);
        }
        return response()->json(['success'=>false,'message'=>'Deleted']);
    }
}
