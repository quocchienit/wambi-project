<?php namespace App\Composers;
use App\CodeMaster;
use Carbon\Carbon;
use App\Survey;
class AdminTopBox{

    public function compose($view)
    {
    	$total_surveys_query = Survey::whereIn('unit_id',\Auth::user()->units);
        $total_surveys = $total_surveys_query->count();            
        $today = Carbon::now()->format('Y-m-d');
        $today_surveys = $total_surveys_query->whereDate('created_at','=',$today)->count();
    	
     	$view->with('total_surveys',$total_surveys);
     	$view->with('today_surveys',$today_surveys);
    }
}