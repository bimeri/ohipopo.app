<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Topic extends Model
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $fillable = [
        'subject_id', 'topicName'
    ];

    public function topicvideos(){
        return $this->hasMany('App\Models\Topicvideo');
    }

    public function subject(){
        return $this->belongsTo('App\Models\Subject');
    }

    public static function getTopicBySubjectId($subject_id){
        return Topic::where('subject_id', $subject_id)->get();
    }
}
