<?php

namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
class ShiftRequest extends Model
{
    public function employee()
    {
        return $this->belongsTo('App\Employee','employee_id');
    }
    public function shift()
    {
        return $this->belongsTo('App\Shift','shift_master_id');
    }
}
