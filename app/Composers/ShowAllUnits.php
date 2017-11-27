<?php namespace App\Composers;
use App\CodeMaster;
class ShowAllUnits
{

    public function compose($view)
    {
    	$showAll = 1;
     	$view->with('showAll',$showAll);
    }
}