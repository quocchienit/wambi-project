<?php

namespace App\Http\Controllers\Admin;

use App\Setting;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class SettingController extends Controller
{
    public function index(){
        $check = Setting::first();
        $qa = \App\QA::where('utype','like','%'.\Auth::user()->etid.'%')->get();
        return view('partials.setting')->with([
            'qa'    => $qa,
            'data'  => (isset($check)?$check:'')
        ]);
    }

    public function edit(Request $request){
        $check = Setting::first();
        if($check){
            $check->url = $request->url;
            $check->save();
        }else{
            $check = new Setting;
            $check->url = $request->url;
            $check->save();
        }
        return redirect('admin/cpc-url');
    }
}
