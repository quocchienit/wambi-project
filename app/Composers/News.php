<?php namespace App\Composers;
class News
{
    public function compose($view)
    {
    	$unit = \Auth::user()->units;    	
		$fac_id = \Auth::user()->fac_id;
        $where = "units like '%\"$unit[0]\"%'";
        for ($i= 1; $i < count($unit); $i++) { 
            $where = $where." or units like '%\"$unit[$i]\"%'";
        }
        
        if(\Auth::user()->type() == 'super-executive'){
            $data = \App\News::where('fac_id',$fac_id)
                            ->orderBy('created_at','desc')
                            ->with('likes', 'comments', 'tag')->get();
        }else{
            $data = \App\News::whereRaw($where)
                            ->where('fac_id',$fac_id)
                            ->orderBy('created_at','desc')
                            ->with('likes', 'comments', 'tag')->get();        
        }

     	$view->with('news',$data);
    }
}