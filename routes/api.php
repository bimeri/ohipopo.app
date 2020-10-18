<?php

use App\Http\Controllers\userController;
use App\Http\Controllers\subjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('types/detail', [userController::class, 'types']);
Route::get('level/detail', [userController::class, 'levels']);
Route::group(['prefix' => 'auth'], function () {
    Route::post('login', [userController::class,'login'])->name('login');
    Route::post('register', [userController::class, 'register']);

Route::group(['middleware' => 'auth:api'], function() {
    Route::get('subject', [subjectController::class,'subjects']);
    Route::get('user/subject', [subjectController::class,'userSubjects']);
    Route::get('user/detail', [subjectController::class,'userDetails']);
    Route::get('level/detail', [subjectController::class,'levels']);

    Route::get('logout', [subjectController::class,'logout']);
    });
});

