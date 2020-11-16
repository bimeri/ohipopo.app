<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class pageController extends Controller
{
    //
    public function __construct(){
        return $this->middleware('auth');
    }

    public function adminLaygout(){
        return view('layouts.admin');
    }

    public function teacherLaygout(){
        return view('layouts.teacher');
    }
}
