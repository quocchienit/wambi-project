<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reward extends Model
{
    public function photo()
    {
        $photo = "uploads/giftcard/$this->image";
        if (\File::exists(public_path($photo))) {
            return url($photo);
        }
        return url("/assets/images/users/avatar-1.jpg");
    }
    public function attachment()
    {
        $photo = "uploads/giftcard/$this->image";
        if (\File::exists(public_path($photo))) {
            return public_path($photo);
        }
        return public_path("/assets/images/users/avatar-1.jpg");    	
    }
}
