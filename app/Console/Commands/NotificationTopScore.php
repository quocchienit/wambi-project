<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Employee;

class NotificationTopScore extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notification:top_score';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $now = Carbon::now();
        $employee = Employee::select(\DB::raw("avg(avg) score,employee_master.*"))
            ->where('etid','2')
            ->leftJoin('surveys','employee_master.id','=','surveys.employee_id')
            ->groupBy('employee_master.id')
            ->orderBy('score','desc')
            ->first()
        ;
        $admins = Employee::whereIn('etid',[3])
            ->get()
        ;
        $notification_id = 7;
        $data['name'] = $employee->name();
        $data['link'] = "/admin/employee/view/$employee->id";
        $content = @json_encode($data);
        foreach ($admins as $key => $admin) {
            \DB::insert("insert into employee_notification (content,employee_id,notification_id,created_at) values ('$content',$admin->id,$notification_id,'$now')");                
        }
 }
}
