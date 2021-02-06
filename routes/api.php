<?php

use App\Http\Controllers\userController;
use App\Http\Controllers\subjectController;
use App\Http\Controllers\paymentController;
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
    Route::get('subject/topics', [subjectController::class,'getTopicsAndVideos']);
    Route::get('subject/register', [subjectController::class,'registerUserSubject']);
    Route::post('video/like', [subjectController::class,'likeVideo']);
    Route::post('count/like', [subjectController::class,'countLike']);
    Route::post('count/video', [subjectController::class,'countWatchVideo']);
    Route::post('transaction/detail', [subjectController::class,'getTransactionDetail']);

    Route::get('user/paymentDetal', [paymentController::class,'userPaymentDetails']);
    Route::post('payment', [paymentController::class, 'payments']);
    Route::post('check', [paymentController::class, 'checkPayment']);
    Route::post('registerPayment', [paymentController::class, 'registerPayments']);


    Route::get('logout', [subjectController::class,'logout']);
    });
});


