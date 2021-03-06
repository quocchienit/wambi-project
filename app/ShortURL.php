<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class ShortURL extends Model
{
	public static function shortenUrl()
    {       
        $longUrl = app('url')->to('employee',null);
        //dd($longUrl);
        $apiKey ='AIzaSyAhX3uggdKI9SydZcHLdU96KNRIFam6g5o';
        $postData = array('longUrl' => $longUrl, 'key' => $apiKey);
        $jsonData = json_encode($postData);
        $curlObj = curl_init();
        curl_setopt($curlObj, CURLOPT_URL, 'https://www.googleapis.com/urlshortener/v1/url?key='.$apiKey);
        curl_setopt($curlObj, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlObj, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlObj, CURLOPT_HEADER, 0);
        curl_setopt($curlObj, CURLOPT_HTTPHEADER, array('Content-type:application/json'));
        curl_setopt($curlObj, CURLOPT_POST, 1);
        curl_setopt($curlObj, CURLOPT_POSTFIELDS, $jsonData);
        $response = curl_exec($curlObj);

        // Change the response json string to object
        $json = json_decode($response);
        curl_close($curlObj);   
        //dd($json);
        if(isset($json->error) && count($json->error) > 0)
            return $longUrl;
        return $json->id;
    }
}