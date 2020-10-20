<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Subject;
use App\Models\Topic;
use App\Models\topicvideo;
use App\Models\Useroption;
use App\Models\Usersubject;
use Illuminate\Http\Request;

class subjectController extends Controller
{
    //
    public function __construct()
    {
       return $this->middleware('auth:api');
    }

    function userDetails(Request $req){
        $userId = $req['userId'];
        $detail = Useroption::getUserDtail($userId);
        return response()->json([$detail], 200);
    }

    function subjects(Request $req){
        $levelId = $req['levelId'];
        $subjects = Subject::getAllByLevelId($levelId);

        $level = Level::getLevelById($levelId);
       $levelName = $level->levelName;
       $type = $level->type->typeName;
       return response()->json([$subjects, "levelName" => $levelName, "typeName" => $type], 200);
    }

    function userSubjects(Request $req){
        $studentId = $req['userId'];
        $getSubjects = Usersubject::getAllUserSubject($studentId);

        $array = [];
        foreach($getSubjects as $subject){
            $countUser = Usersubject::countAllUser($studentId, $subject->subject_id);
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
    $subjectDetail = Subject::getSyubjectDetail($subject_id);
    $allTopics = Topic::getTopicBySubjectId($subject_id);

    $array = [];
    foreach($allTopics as $topic){
        $topicDetail = topicvideo::getTopicVideos($topic->id);
        foreach($topicDetail as $detail){
            $filterDetail = [
                'topic_name' => $topic->topicName,
                'videoName' => $detail->videoName,
                'videoUrl' => $detail->video_url
            ];
            array_push($array, $filterDetail);
        }
    }

    return response()->json([$allTopics, $array, $subjectDetail]);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }
}
