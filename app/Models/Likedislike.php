<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Likedislike extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'user_id', 'topicvideo_id',  'like', 'dislike'
    ];

    public function user(){
        return $this->belongsTo('App\Models\User');
    }
    public function topicvideo(){
        return $this->belongsTo('App\Models\Topicvideo');
    }

    public static function countLike($topicVideo_id){
        return likedislike::where('topicvideo_id', $topicVideo_id)->where('like', 1)->count();
    }
    public static function countDislike($topicVideo_id){
        return likedislike::where('topicvideo_id', $topicVideo_id)->where('dislike', 1)->count();
    }
}
