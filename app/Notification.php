<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    public function notification()
    {
    	return $this->morphTo();
    }
}
