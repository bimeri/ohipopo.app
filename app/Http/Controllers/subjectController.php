<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Subject;
use App\Models\Topic;
use App\Models\topicvideo;
use App\Models\Useroption;
use App\Models\Usersubject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class subjectController extends Controller
{
    //
    public function __construct()
    {
       return $this->middleware('auth:api');
    }

    function subjects(Request $req){
        $levelId = $req['levelId'];
        $subjects = Subject::getAllByLevelId($levelId);
        $level = Level::getLevelById($levelId);
       $levelName = $level->levelName;
       $type = $level->type->typeName;
       return response()->json([$subjects, "levelName" => $levelName, "typeName" => $type], 200);
    }

    function registerUserSubject(Request $req){
        $data = $req['userSubjects'];
        $rr = [];
       $tt = array_map('intval', explode(',', $data));
        foreach($tt as $dat){
        $userSubject = new Usersubject();
        $userSubject->subject_id = (int)$dat;
        $userSubject->user_id = auth()->user()->id;
            array_push($rr, $dat);
         $userSubject->save();
        }
        return response()->json([$rr, auth()->user()->id,"success" => "SUBJECT_SAVED_SUCCESSFULLY"]);
    }

    function userSubjects(Request $req){
        $studentId = $req['userId'];
        $getSubjects = Usersubject::getAllUserSubject($studentId);

        $array = [];
        foreach($getSubjects as $subject){
            $countUser = Usersubject::countAllUser($subject->subject_id);
            $arr = [
                'sub_id' => $subject->subject->id,
                'name' => $subject->subject->name,
                'author' => $subject->subject->author,
                'topics' => $subject->subject->topic,
                'name' => $subject->subject->name,
                'logo' =>  $subject->subject->logo,
                'students' => $countUser,
            ];
            array_push($array, $arr);
        }
        return response()->json($array);
    }

    public function getTopicsAndVideos(Request $req){
        $subject_id = $req['subjectId'];
    $subjectDetail = Subject::getSubjectDetail($subject_id);
    $allTopics = Topic::getTopicBySubjectId($subject_id);

    $array = [];
    foreach($allTopics as $topic){
        $subarray = array();
        $topicName = $topic->topicName;
        $topicVideos = topicvideo::getTopicVideos($topic->id);
        foreach($topicVideos as $topicVideo){
            $filterDetail = [
                'vId' => $topicVideo->id,
                'videoName' => $topicVideo->videoName,
                'videoUrl' => $topicVideo->video_url,
                'totalVideo' => $topicVideos->count()
            ];
            array_push($subarray, $filterDetail);
        }
        array_push($array, ['topicName' => $topicName, 'topicVideo' => $subarray]);
    }

    return response()->json([$allTopics, $array, $subjectDetail]);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        DB::table('oauth_access_tokens')->where('user_id', auth()->user()->id)->delete();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }
}
