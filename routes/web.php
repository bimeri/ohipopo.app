<?php

use App\Http\Controllers\adminController;
use App\Http\Controllers\authController;
use App\Http\Controllers\pageController;
use App\Http\Controllers\subjectController;
use App\Http\Controllers\teacherController;
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

Route::get('user_login', [authController::class, 'login'])->name('user.login');
Route::group(['middleware' =>['auth:admin']], function () {
    Route::get('admin/home', [adminController::class, 'index'])->name('admin.home');
    Route::post('subject/edit', [adminController::class, 'editSubject'])->name('subject.edit.method');
    Route::post('subject/delete', [adminController::class, 'deleteSubject'])->name('subject.delete');
    Route::get('admin/addSubject', [adminController::class, 'addSubject'])->name('admin.addsubject');
    Route::post('admin/addSubject', [adminController::class, 'addSubjectMethod'])->name('subject.add.method');
    Route::get('admin/addTopic', [adminController::class, 'addTopic'])->name('topic.add');
    Route::post('admin/ajax_subjects', [adminController::class, 'ajaxGetSubject'])->name('class.get.subject');
    Route::get('admin/add/topic', [adminController::class, 'addTopicPage'])->name('topic.add.one');
    Route::post('admin/add/topic', [adminController::class, 'addOneTopic'])->name('topic.add.oneOnly');
    Route::post('admin/delete/topic', [adminController::class, 'deleteTopic'])->name('delete.topic');
    Route::get('admin/video', [adminController::class, 'showAddVideoPage'])->name('admin.addVideos');
    Route::post('admin/ajax_topic', [adminController::class, 'getTopicAjax'])->name('subject.getTopic');
    Route::get('admin/video/add', [adminController::class, 'addOneVideo'])->name('add.one.video');
    Route::post('admin/video/one', [adminController::class, 'addOneVideoMethod'])->name('video.add_one');
    Route::post('admin/video/edit', [adminController::class, 'editVideoMethod'])->name('video.edit.method');
    Route::post('admin/video/delete', [adminController::class, 'deleteVideo'])->name('video.delete.method');

    // teacher
    Route::get('teacher/home', [teacherController::class, 'index'])->name('teacher.home');
});


Route::group(['middleware' => ['web']], function(){
    route::get('admin_layout', [pageController::class, 'adminLaygout'])->name('admin.layout');
    route::get('teacher_layout',  [pageController::class, 'teacherLaygout'])->name('teacher.layout');
});

Route::get('admin_logout', [authController::class, 'adminLogout'])->name('admin.logout');
Route::get('teacher_logout', [authController::class, 'teacherLogout'])->name('teaacher.logout');

Route::get('types/detail', 'App\Http\Controllers\userController@types');
Route::get('level/detail', 'App\Http\Controllers\userController@levels');
Route::get('auth/subject', [subjectController::class,'subjects']);
Route::get('auth/user/detail', [subjectController::class,'userDetails']);
Route::get('auth/user/subject', [subjectController::class,'userSubjects']);
Route::get('public/home', [userController::class, 'homePage'])->name('home.view');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

