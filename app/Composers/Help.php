<?php namespace App\Composers;
class Help
{
    public function compose($view)
    {
    	$data = \App\QA::where('utype','like','%'.\Auth::user()->etid.'%')->get();
     	$view->with('qa',$data);
    }
}