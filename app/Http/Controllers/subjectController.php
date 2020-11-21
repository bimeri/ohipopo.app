<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Likedislike;
use App\Models\Subject;
use App\Models\Topic;
use App\Models\topicvideo;
use App\Models\Useroption;
use App\Models\Usersubject;
use App\Models\View;
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
            $likes = Likedislike::countLike($topicVideo->id);
            $dislikelikes = Likedislike::countDislike($topicVideo->id);
            $countVideo = View::countSubjectvideoWatched($topicVideo->id);
            $filterDetail = [
                'vId' => $topicVideo->id,
                'videoName' => $topicVideo->videoName,
                'videoUrl' => $topicVideo->video_url,
                'totalVideo' => $topicVideos->count(),
                'likes' => $likes,
                'dislikes' => $dislikelikes,
                'totalView' => $countVideo,
            ];
            array_push($subarray, $filterDetail);
        }
        array_push($array, ['topicName' => $topicName, 'topicVideo' => $subarray]);
    }

    return response()->json([$allTopics, $array, $subjectDetail]);
    }

    public function likeVideo(Request $req){
        $videoId = $req['videoId'];
        $status = $req['value'];
        $useId = auth()->user()->id;
        if(Likedislike::where('user_id', $useId)->where('topicvideo_id', $videoId)->exists()){
            if($status == 'like'){
                Likedislike::where('user_id', $useId)
                ->where('topicvideo_id', $videoId)
                ->update([ 'like' => 1, 'dislike' => 0 ]);
                return response()->json('UPDATED');
            } else {
                Likedislike::where('user_id', $useId)
                ->where('topicvideo_id', $videoId)
                ->update([ 'like' => 0, 'dislike' => 1 ]);
                return response()->json('UPDATED');
            }

        } else {
            $topicVideo = new Likedislike();
            $topicVideo->user_id = $useId;
            $topicVideo->topicvideo_id = $videoId;
            if($status == 'like'){
                $topicVideo->like = 1;
                $topicVideo->dislike = 0;
            } else {
                $topicVideo->like = 0;
                $topicVideo->dislike = 1;
            }

            $topicVideo->save();
            return response()->json('SAVED', 200);
        }
    }

    public function countLike(Request $req){
        $video_id = $req['videoId'];
        $countLike = Likedislike::countLike($video_id);
        $countDislike = Likedislike::countDislike($video_id);
        return response()->json(['like' => $countLike, 'dislike' => $countDislike]);
    }

    public function countWatchVideo(Request $req){
        $video_id = $req['videoId'];
        $userId = auth()->user()->id;
        $option = Useroption::where('user_id', $userId)->first();
        $levelId = $option->level_id;
        $videoId = $video_id;
        $view = new View();
        $view->user_id = $userId;
        $view->level_id = $levelId;
        $view->video_id = $videoId;
        $view->save();
        $count = View::countSubjectvideoWatched($video_id);
        return $count;
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
