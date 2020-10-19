<?php

namespace App\KvSync;

use GuzzleHttp\Client;

class Helper 
{


    public static function log($string){
        echo str_pad(self::get_calling_class().":",24);
        echo $string;
        echo "\r\n";
    }
    
    public static function get_calling_class($traceLevel = 2) {

        //get the trace
        $callerClass = debug_backtrace()[$traceLevel]['class'];
    
        // Get the class that is asking for who awoke it
        $pathArray = explode('\\',$callerClass);

        return end($pathArray);
        
    }

    
}

