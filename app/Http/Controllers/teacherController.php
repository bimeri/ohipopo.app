<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class teacherController extends Controller
{
    //
    public function __construct(){
        return $this->middleware('auth:teacher');
    }

    public function index(){

        return view('teacher.home');
    }
}
