<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Employee;
use Carbon\Carbon;
class TenureAward extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'tenure_award';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Tenure  award';

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
        $system_start_date = config('system.start');
        $employees = Employee::where('etid',2)
            ->select('id',\DB::raw("YEAR(curdate()) - YEAR(hiredate) - (DATE_FORMAT(curdate(), '%m%d') < DATE_FORMAT(hiredate, '%m%d')) tenureyear"))
            ->whereRaw("YEAR(curdate()) - YEAR(hiredate) - (DATE_FORMAT(curdate(), '%m%d') < DATE_FORMAT(hiredate, '%m%d'))>0 AND ADDDATE(ADDDATE(hiredate,INTERVAL (YEAR(curdate()) - YEAR(hiredate) - (DATE_FORMAT(curdate(), '%m%d') < DATE_FORMAT(hiredate, '%m%d'))) year),1) = CURDATE()")
            ->get()
        ;
        foreach ($employees as $key => $employee) {
            $tenureyear = $employee->tenureyear;
            $employee->pecks = 0;
            $pecks = 500;
            if($system_start_date < Carbon::today()->format("Y-m-d")){
                if($tenureyear < 5){
                    $pecks = 750;
                }else{
                    $pecks = 1000;
                }
            }
            $employee->pecks += $pecks;
            $employee->save();
        }
    }
}
