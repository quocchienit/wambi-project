<?php
namespace App;
//require __DIR__."../../vendor/autoload.php";
require __DIR__ . '/../vendor/twilio/sdk/Twilio/autoload.php';
use Twilio\Rest\Client;
use App\Carriers;

class CarriersOnline
{
	public static function carrier($numberphone)
    {
        //$numberphone = "5108675309";
        $id = "AC233299407ad0ce4f4335136c0a491c68";
        $token = "a0a27680da648b8d98f99f5b46dffca6";
        $client = new Client($id, $token);
				$numberphone = str_replace('(','',$numberphone);
				$numberphone = str_replace(')','',$numberphone);
				$numberphone = str_replace('-','',$numberphone);
				$numberphone = str_replace('+','',$numberphone);
				$numberphone = str_replace(' ','',$numberphone);     
        try {

            $number = $client->lookups->phoneNumbers($numberphone)
                    ->fetch(
                        array("type" => "carrier")
                    );
            $name = $number->carrier["name"];
            $name = explode(',',$name)[0];

            $carries = Carriers::whereRaw("UPPER(name) = UPPER('$name')")->get();
            if($carries->count() > 0)
            {
                return $carries[0]->address;
            }else{
                return "";
            }
        } catch (\Services_Twilio_RestException  $e) {
            return "";
        }

    }
}
