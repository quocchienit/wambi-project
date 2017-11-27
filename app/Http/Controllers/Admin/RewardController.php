<?php

namespace App\Http\Controllers\Admin;

use App\Reward;
use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class RewardController extends Controller
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
        if(\Cache::get('function_amada') != 1)        
            $rewards = Reward::orderBy('pecks')->get();
        else{
            $current_unit = \Session::get('current_unit');
            $rewards = Reward::where('unit_id',$current_unit)->orderBy('pecks')->get();
        }
        return view('admin.reward.index',compact('rewards'));
    }

    public function edit($reward = null)
    {
        return view('admin.reward.edit',compact('reward'));
    }
    public function save(Request $request,$reward = null)
    {
        if($reward==null){
            $reward = new Reward;
            $reward->created_at = Carbon::now();
        }
        $reward->pecks = $request->get('pecks');
        if(\Cache::get('function_amada') == 1)
            $reward->unit_id = $request->get('unit_id');
        else
            $reward->unit_id = \Session::get('current_unit');
        if($reward->save())
            if(\Input::hasFile('image'))
            {
                if(\Input::file('image')->isValid()){
                    $image = str_replace(" ","_","$reward->id ".\Input::file('image')->getClientOriginalName());
                    \Input::file('image')->move(public_path()."/uploads/giftcard/", $image);
                    $reward->image = $image;
                    $reward->save();
                }
            }
        //return redirect()->back();
        return redirect('admin/reward');

    }
    public function delete($reward)
    {
        $reward->delete();
        return response()->json(['success'=>true,'message'=>'Gift card deleted successfully.']);
    }
}