<?php namespace App\Composers;
class FAQs
{
    public function compose($view)
    {
    	$data = \App\QA::leftjoin('employee_master','clockid','=','created_user')->get();
     	$view->with('faqs',$data);
    }
}