<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class topicvideo extends Model
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $fillable = [
        'topic_id', 'videoName', 'video_url'
    ];

    public function topic(){
        return $this->belongsTo('App\Models\Topic');
    }

    public function likedislikes(){
        return $this->hasMany('App\Models\Likedislike');
    }

    public static function getTopicVideos($topicId){
        return topicvideo::where('topic_id', $topicId)->get();
    }
}
