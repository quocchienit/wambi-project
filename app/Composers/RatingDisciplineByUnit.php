<?php namespace App\Composers;
use App\Answer;
use Session;
use Auth;
use App\Survey;
class RatingDisciplineByUnit
{

    public function compose($view)
    {
    	if((\Auth::user()->type() == 'super-executive' && \Cache::get('function_amada') != 1) || 
    		\Session::get('current_unit') == 0){
    		$current_unit = \Session::get('current_fac');
	 		$questions = \App\Question::where('fac_id',$current_unit)->get();	 		
    	}else{
	    	$current_unit = \Session::get('current_unit');
	 		$questions = \App\Question::whereUnitId($current_unit)->get();	 		
 		}
 		$view->with('questions',$questions);
 		$view->with('rating_discipline_by_unit',Survey::rating_discipline_by_unit($current_unit));
 		$view->with('rating_question_by_unit',Answer::rating_question_by_unit($current_unit));
 		$view->with('rating_question_by_discipline_unit',Answer::rating_question_by_discipline_unit($current_unit));
        $view->with('rating_question_by_discipline_unit_all',Answer::rating_question_by_discipline_unit_all());
 		$view->with('rating_by_unit',Survey::rating_by_unit($current_unit));
    }
}