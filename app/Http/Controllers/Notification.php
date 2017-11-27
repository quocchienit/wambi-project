<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class Notification extends Controller
{
    public function seen(Request $request)
    {
    	\DB::update("update employee_notification set status = 'seen' where employee_id = $request->employee_id and notification_id = $request->notification_id");
    	return response()->json(['success'=>true]);
    }
}
