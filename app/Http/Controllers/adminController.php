<?php

namespace App\Http\Controllers;

use App\Models\Level;
use Illuminate\Http\Request;
use App\Models\Subject;
use App\Models\Topic;
use App\Models\topicvideo;
use Exception;

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

    public function addSubject(){
        $data['subjects'] = Subject::getTenSubject();
        return view('admin.addSubject')->with($data);
    }

    public function addSubjectMethod(Request $req){
        $this->validate($req, [
            'subject' => 'required',
            'level_id' => 'required',
            'teacher' => 'required',
            'profile_image' => 'required',
            'url' => 'required',
        ]);
        $subjectName = $req['subject'];
        $level_id = $req['level_id'];
        $teacher = $req['teacher'];
        $topic = $req['topic'];
        $subject_image = $req['profile_image'];
        $url = $req['url'];
        $path = 'asset/images/';
        $name = $subject_image->getClientOriginalName();
        $filename = $path.$name;

        $subjects = new Subject();
        $subjects->level_id = $level_id;
        $subjects->name = $subjectName;
        $subjects->author = $teacher;
        $subjects->topic = $topic;
        $subjects->url = $url;
        $subjects->logo = $filename;
{
}
        try{
            $subjects->save();
            $message = array('message' => 'Subject save successfully', 'alert-type'=> 'success');
            return redirect()->back()->with($message);
            }catch(Exception $e){
                 //if email or phone exist before in db redirect with error messages
                 $message = array('message' => 'Fail to save the subject. It exist already to the class', 'alert-type'=> 'error');
                 return redirect()->back()->with($message);
            }
        }

        public function editSubject(Request $req){
        $this->validate($req, [
            'subject' => 'required',
            'level' => 'required',
            'teacher' => 'required',
            'profile_image' => 'required',
            'url' => 'required',
        ]);
        $subjectId = $req['subjectId'];
        $subjectName = $req['subject'];
        $level_id = $req['level'];
        $teacher = $req['teacher'];
        $topic = $req['topic'];
        $subject_image = $req['profile_image'];
        $url = $req['url'];

        $update = Subject::where('id', $subjectId)->update([
            'level_id' => $level_id,
            'name' => $subjectName,
            'author' => $teacher,
            'topic' => $topic,
            'url' => $url,
            'logo' => $subject_image
        ]);

            if($update){
            $message = array('message' => 'Subject Information updated successfully', 'alert-type'=> 'success');
            return redirect()->back()->with($message);
            }
             else{
                $message = array('message' => 'Fail to update, please contact Noel the Admin', 'alert-type'=> 'error');
                return redirect()->back()->with($message);
             }
        }

    public function deleteSubject(Request $req){
        $subid = $req['subjectId'];
        $delete = Subject::where('id', $subid)->delete();

        if($delete){
            $message = array('message' => 'Subject deleted with success', 'alert-type'=> 'info');
                return redirect()->back()->with($message);
        } else {
            $message = array('message' => 'Fail to delete, please contact Noel the Admin', 'alert-type'=> 'error');
                return redirect()->back()->with($message);
        }
    }

    public function addTopic(){
        $data['levels'] = Level::all();
            return view('admin.addTopic')->with($data);
    }

    public function ajaxGetSubject(Request $req){
        $levelId = $req['info'];
        $allSubjects = Subject::getAllByLevelId($levelId);
        $array = [];
        if($allSubjects->count() > 0){
            array_push($array, "<option value=''>select the subject</option>");
        }
        foreach ($allSubjects as $allSubject) {
            $arrraybody = "<option value='".$allSubject->id."'>".$allSubject->name."</option>";
            array_push($array, $arrraybody);
        }
            return response()->json($array);
    }

    public function addTopicPage(Request $req){
        $this->validate($req, [
            'subjectId' => 'required'
        ]);
        $subjectId = $req['subjectId'];
        $data['subject'] = Subject::getSubjectDetail($subjectId);
        $topics = Topic::getTopicBySubjectId($subjectId);
        $data['topics'] =$topics;
        $data['count'] = $topics->count();
            return view('admin.addSubjectTopic')->with($data);

        return view('admin.addSubjectTopic')->with($data);
    }

    public function addOneTopic(Request $req){
        $this->validate($req, [
            'topicName' => 'required',
            'subjectId' => 'required'
        ]);
        $subjectId = $req['subjectId'];
        $topicName = $req['topicName'];
        $topics = new Topic();
        $topics->subject_id = $subjectId;
        $topics->topicName = $topicName;
        $topics->save();

        if($topics){
            $message = array('message' => 'Topic saved successfully', 'alert-type' => 'success');
            return redirect()->back()->with($message);
        } else {
            $message = array('message' => 'Fail to Save topic', 'alert-type' => 'error');
            return redirect()->back()->with($message);
        }
    }

    public function deleteTopic(Request $req){
        $topicId = $req['topicId'];
        Topic::where('id', $topicId)->delete();
        $mess = array('message' => 'Topic deleted with success', 'alert-type' => 'info');
        return redirect()->back()->with($mess);
    }

    public function showAddVideoPage(){
        $data['levels'] = Level::all();
        return view('admin.videos.videos')->with($data);
    }

    public function getTopicAjax(Request $req){
        $subjId = $req['info'];
        $allTopics = Topic::getTopicBySubjectId($subjId);
        $array = [];
        if($allTopics->count() > 0){
            array_push($array, "<option value=''>select the Topic</option>");
        }
        foreach ($allTopics as $topic) {
            $arrraybody = "<option value='".$topic->id."'>".$topic->topicName."</option>";
            array_push($array, $arrraybody);
        }
            return response()->json($array);
    }

    public function addOneVideo(Request $req){
        $this->validate($req, [
            'subjectId' => 'required',
            'topicId' => 'required',
        ]);
        $subjectId = $req['subjectId'];
        $topicId = $req['topicId'];
        $data['subject'] = Subject::getSubjectDetail($subjectId);
        $topicvideos = topicvideo::getTopicVideos($topicId);
        $data['video'] = topicvideo::where('topic_id', $topicId)->first();
        $data['topicvideos'] =$topicvideos;
        $data['topicId'] =$topicId;
        $data['count'] = $topicvideos->count();
            return view('admin.videos.addOnevideo')->with($data);
    }

    public function addOneVideoMethod(Request $req){
        $this->validate($req, [
            'topicId' => 'required',
            'vname' => 'required',
            'vlink' => 'required|url'
        ]);
        $vidName = $req['vname'];
        $topicId = $req['topicId'];
        $vurl = $req['vlink'];
        $video = new topicvideo();
        $video->topic_id = $topicId;
        $video->video_url = $vurl;
        $video->videoName = $vidName;
        $video->save();

        if($video){
            $message = array('message' => 'Video saved successfully', 'alert-type' => 'success');
            return redirect()->back()->with($message);
        } else {
            $message = array('message' => 'Fail to Save video', 'alert-type' => 'error');
            return redirect()->back()->with($message);
        }
    }

    public function editVideoMethod(Request $req){
        $this->validate($req, [
            'topicvideoId' => 'required',
            'vname' => 'required',
            'vlink' => 'required|url'
        ]);
        $vidName = $req['vname'];
        $topicvId = $req['topicvideoId'];
        $vurl = $req['vlink'];

        $update = Topicvideo::where('id', $topicvId)->update([
            'videoName' => $vidName,
            'video_url' => $vurl
        ]);

        if($update){
            $message = array('message' => 'Video updated successfully', 'alert-type' => 'success');
            return redirect()->back()->with($message);
        } else {
            $message = array('message' => 'Fail to update video', 'alert-type' => 'error');
            return redirect()->back()->with($message);
        }
    }

    public function deleteVideo(Request $req){
        $videoId = $req['videoId'];
        $delete = topicvideo::where('id', $videoId)->delete();
        if($delete){
            $message = array('message' => 'Video has been deleted!', 'alert-type' => 'info');
            return redirect()->back()->with($message);
        } else {
            $message = array('message' => 'Fail to delete video', 'alert-type' => 'error');
            return redirect()->back()->with($message);
        }
    }
}
