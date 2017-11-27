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

class ListFacilityAndUnitController extends Controller
{
    function __construct()
    {
         \View::composers([            
            'App\Composers\Help'  => ['partials.footer'],               
        ]);
    }
    public function getIndex()
    {
        $facility = CodeMaster::where('type','facility')->get();
        $unit = CodeMaster::join('code_master as a','a.key','=','code_master.refkey')                
                ->where('code_master.type','unit')->where('a.type','facility')                
                ->select('code_master.*','a.value as facname')->get();
        
        return view('super-executive.list.index',compact('facility','unit'));
    }

    public function edit($type = null)
    {
        $key = \Request::get('value');
        if($key){
            $data = CodeMaster::where('type',$type)
                                ->where('key',$key)->get();
            if($data->count() > 0){
                $data = $data[0];                
            }
        }
        $fac = CodeMaster::where('type','facility')->get();
        if($type==='unit'){
            return view('super-executive.list.edit',compact('data','fac','type'));
        }else{
            return view('super-executive.list.edit',compact('data','fac','type'));
        }
    }

    public function save($type = null){
        $key = \Request::get('value');
        $address = \Request::get('address');
        if($key){
            $codemaster = CodeMaster::where('type',$type)
                                ->where('key',$key)->get();            

            if($codemaster->count() > 0){
                    $codemaster = $codemaster[0];                
            }else{
                $codemaster = new CodeMaster();
                $codemaster->type = $type;
                $units = CodeMaster::where('type',$type)->get()->toArray();
                $codemaster->key = $units[count($units)-1]['key'] + 1;
            }
        }else{
            $codemaster = new CodeMaster();
            $codemaster->type = $type;
            $units = CodeMaster::where('type',$type)->get()->toArray();
            $codemaster->key = $units[count($units)-1]['key'] + 1;
        }
        $codemaster->value = \Input::get('name');
        $codemaster->refkey = \Input::get('fac');
        if($address){
            $codemaster->address = $address;
        }
        if($codemaster->save()){
            // Day du lieu ngam cho unit vao table config
            if($type=='unit'){                
                $config = ConfigPeck::where('unit_id',$codemaster->key)->get();
                if($config->count() == 0){
                    $config = new ConfigPeck();
                    $config->unit_id = $codemaster->key;
                    $config->poor = 0;
                    $config->fair = 5;
                    $config->ok = 15;
                    $config->good = 25;  
                    $config->great = 30;

                    $config->urgent = 15;
                    $config->v_urgent = 25;
                    $config->e_urgent = 35;

                    $config->from_need = 0;
                    $config->to_need = 59;
                    $config->from_sactisfactory = 60;
                    $config->to_sactisfactory = 69;
                    $config->from_good = 70;
                    $config->to_good = 79;
                    $config->from_excellent = 80;
                    $config->to_excellent = 89;
                    $config->from_exceptional = 90;
                    $config->to_exceptional = 100;

                    $config->save();
                }
            }
        }
        return redirect()->route('admin::list::index');
    }

    public function delete($type = null){
        $key = \Request::get('value');
        if($key){
            CodeMaster::where('type',$type)->where('key',$key)->delete();
            return response()->json(['success'=>true,'message'=>'Deleted']);
        }
        return response()->json(['success'=>false,'message'=>'Deleted']);
    }
}
