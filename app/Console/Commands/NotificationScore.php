<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use App\Employee;
class NotificationScore extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notification:score';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Automatic alarms for consistent low scores for an individual Employee';

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
        $max_peck = config('award.max_peck');
        $low_score = config('notifications.low_score');
        $high_score = config('notifications.high_score');
        $employees = Employee::select(\DB::raw("ROUND(100*avg(surveys.avg)/$max_peck,2) score,IF(ROUND(100*avg(surveys.avg)/$max_peck,2)>=$high_score,'great','poor') status,employee_master.*"))
            ->where('etid','2')
            ->whereRaw("DATEDIFF(now(),hiredate)%14 = 0")
            ->leftJoin('surveys','employee_master.id','=','surveys.employee_id')
            ->groupBy('employee_master.id')
            ->havingRaw("score <= $low_score or score >= $high_score or score is null")
            ->get()
        ;
        foreach ($employees as $key => $employee) {
            $discipline = $employee->disciplines[0];
            $admins = Employee::whereIn('etid',[3])
                ->whereRaw("disciplines like '%\"$disciplines\"%'")
                ->get()
            ;
            $notification_id=5;
            if($employee->status == 'great')
                $notification_id = 6;
            $data['name'] = $employee->name();
            $data['status'] = $employee->status;
            $data['link'] = "/admin/employee/view/$employee->id";
            $content = @json_encode($data);
            foreach ($admins as $key => $admin) {
                \DB::insert("insert into employee_notification (content,employee_id,notification_id,created_at) values ('$content',$admin->id,$notification_id,'$now')");                
            }
        }
    }
}
