<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\User;
use App\CarriersOnline;
use Session, Auth, Cache, Redirect;

class LoginController extends Controller
{
    function __construct()
    {
        \View::composers([
                'App\Composers\Help'  => ['partials.footer'],
        ]);
    }
    public function getRecovery()
    {
        $carriers = \DB::table('carriers')->get();
        return view('auth.recovery',compact('carriers'));
    }
    public function postRecovery(Request $request)
    {
        $users = null;

        if($request->has('email')){
            $email = $request->email;
            $users = \App\User::whereEmail($email)->get();
            if(count($users)>0){
                $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $charactersLength = strlen($characters);
                $randomString = '';
                for ($i = 0; $i < 8; $i++) {
                    $randomString .= $characters[rand(0, $charactersLength - 1)];
                }
                $password = $randomString;
                foreach ($users as $user) {
                    $user->password = bcrypt($password);
                    $user->status_pass = 0;
                    $user->save();
                }
                \Mail::send('emails.auth.recovery',compact('password', 'users'), function ($message) use ($email) {
                    $message->to($email)->subject('New password');
                });
                return redirect('auth/login')->with('message','Your password has been sent. Please check your email');
            }
        }else if($request->has('mobile')){
            $mobile = $request->mobile;
            $mobile = str_replace('(','',$mobile);
            $mobile = str_replace(')','',$mobile);
            $mobile = str_replace('-','',$mobile);
            $mobile = str_replace('+','',$mobile);
            $mobile = str_replace(' ','',$mobile);          
            $users = \App\User::whereMobile($mobile)->get();
            // $users = \App\User::whereMobile($mobile)->whereCarrier($carrier)->get();
            if (count($users) > 0) {
            	$carrier = CarriersOnline::carrier($mobile);
            	dd($carrier);
                $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $charactersLength = strlen($characters);
                $randomString = '';
                for ($i = 0; $i < 8; $i++) {
                    $randomString .= $characters[rand(0, $charactersLength - 1)];
                }
                $password = $randomString;
                foreach ($users as $user) {
                    $user->password = bcrypt($password);
                    $user->status_pass = 0;
                    $user->save();
                }
                \Mail::send('emails.auth.recovery_sms', compact('password','users'), function ($message) use ($mobile, $carrier) {
                    $message->to($mobile . $carrier)->subject('New password');
                });
                return redirect('auth/login')->with('message', 'Your password has been sent. Please check your mobile');
            }

        }
        return redirect('auth/recovery')->with('message','Sorry! Email or mobile does not exist');
    }
    public function getLogin()
    {
        //$content = "";
        //$file = fopen("term.txt", "r");
        //while(!feof($file)){
        //    $line = fgets($file);
        //    # do same stuff with the $line
        //    if(count($line) > 0)
        //    $content = nl2br($content.$line);
        //    $content = trim($content);
        //}
        //dd($content);
        //fclose($file);
    	return view('auth.login');
    }
    public function postLogin(Request $request)
    {
        $user = User::where('clockid',$request->clockid)->first();
        if($user){
            $credentials = array(
                'clockid' => $request->clockid,
                'password'  => $request->password
            );

            if (Auth::attempt($credentials)){
                if(Auth::user()->type() == 'super-admin' && Cache::get('function_amada') != 1){
                    $unit = 0;
                }elseif(Auth::user()->type() == 'super-executive'){
                    $unit = 0;
                }else {
                    $unit = Auth::user()->units[0];
                }
                Session::set('current_unit',$unit);
                if(Auth::user()->type() == 'employee'){
                    return redirect()->route('employee::dashboard');
                }elseif(Auth::user()->type() == 'super-executive'){
                	Session::set('current_fac',0);
                	return redirect()->route('admin::dashboard');
                }else{
                    Session::set('current_fac',Auth::user()->fac_id);
                    return redirect()->route('admin::dashboard');
                }
            }
        }
        return Redirect::back()->withMessage('Invalid credentials');
    }
    public function postLogout()
    {
    	# code...
    }
    public function getLogout()
    {
        if(Auth::check()){
            Session::forget('current_unit');
            Auth::logout();
        }
        return redirect()->route('backend-login');
    }

    public function changePassword()
    {
        return view('partials.changePassword');
    }

    public function postchangePassword(Request $request)
    {
        $user = Auth::user();
        if(!empty(\Input::get('password'))){
            $user->password = bcrypt(\Input::get('password'));
            $user->status_pass = 1;
            $user->save();
        }
        if(Auth::user()->type() == 'employee'){
            return redirect('/employee');
        }else{
            return redirect('/admin');
        }
    }
}
