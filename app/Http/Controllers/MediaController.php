<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class MediaController extends Controller
{
	public function upload($folder=null)
	{
		if(\Input::hasFile('image'))
		{       
			if(\Input::file('image')->isValid()){
				$file = \Input::file('image');
				$extension = $file->getClientOriginalExtension();
				// $name = md5(time()).".$extension";
				$name = $file->getClientOriginalName();
				$file->move(public_path("/uploads/$folder"), $name);
				return response()->json(['url'=>"/uploads/$folder/$name",'name'=>$name,'success'=>true]);
			}
		}  
		return response()->json(['success'=>false,'message'=>'Failse to upload file']);
	}
}
