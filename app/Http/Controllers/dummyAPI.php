<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class dummyAPI extends Controller
{
    //
    function getData(){
        return["name"=>"DANY COREA", "email"=>"dcorea@gmail.com"];
    }
}
