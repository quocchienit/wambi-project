<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class CustomerFunction extends Model
{
	public $timestamps = false;
	protected $table = 'customer_master';
	public static function f_out_patient()
	{
		/*
		$cus = \DB::select("SELECT  1 id FROM customer_function a 
									LEFT JOIN function_list b on a.function_id = b.function_id 
									LEFT JOIN customer_master c on a.customer_id = c.customer_id 
									WHERE c.enable = 1 and b.function_id = 1");	
			*/
			$cus = \DB::select("SELECT id FROM customer_master c WHERE c.enable = 1");		
		//dd($cus);
		if($cus != null)
			return $cus[0]->id;
		else
			return 0;
	}

	public static function ambassador(){
		// Check use new type ambassador
		$check = \DB::select("SELECT  1 id FROM customer_function a 
									LEFT JOIN function_list b on a.function_id = b.function_id 
									LEFT JOIN customer_master c on a.customer_id = c.customer_id 
									WHERE c.enable = 1 and 
									a.enable = 1 and
									b.function_id = 2");
		if($check != null ){
			return 1;
		}else{
			return 0;
		}
	}

	public static function amada(){
		// Check use new type amada
		$check = \DB::select("SELECT  1 id FROM customer_function a 
									LEFT JOIN function_list b on a.function_id = b.function_id 
									LEFT JOIN customer_master c on a.customer_id = c.customer_id 
									WHERE c.enable = 1 and 
									a.enable = 1 and
									b.function_id = 3");
		if($check != null ){
			return 1;
		}else{
			return 0;
		}
	}
}
