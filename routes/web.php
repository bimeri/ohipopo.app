<?php

use App\Http\Controllers\subjectController;
use App\Http\Controllers\userController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('types/detail', 'App\Http\Controllers\userController@types');
Route::get('level/detail', 'App\Http\Controllers\userController@levels');
Route::get('auth/subject', [subjectController::class,'subjects']);
Route::get('auth/user/detail', [subjectController::class,'userDetails']);
Route::get('auth/user/subject', [subjectController::class,'userSubjects']);
Route::get('public/home', [userController::class, 'homePage'])->name('home.view');
