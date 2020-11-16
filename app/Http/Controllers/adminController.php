<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;


class adminController extends Controller
{
    //
    public function __construct(){
        return $this->middleware('auth:admin');
    }

    public function index(){
        $data['subjects'] = Subject::all();
        return view('admin.home')->with($data);
    }
}
