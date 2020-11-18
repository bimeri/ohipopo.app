<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Subject extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'level_id', 'name', 'author', 'topic', 'url', 'logo'
    ];

    public function level(){
        return $this->belongsTo('App\Models\Level');
    }
    public function usersubjects(){
        return $this->belongsToMany('App\Models\Usersubject');
    }

    public static function getAllByLevelId($levelId){
        return Subject::where('level_id', $levelId)->get();
    }
    public function topics(){
        return $this->hasMany('App\Models\Topic');
    }

    public static function getSubjectDetail($subject_id){
        return Subject::where('id', $subject_id)->first();
    }
    public function users(){
        return $this->belongsToMany('App\Models\User');
    }

    public static function getTenSubject(){
        return Subject::latest()->take(7)->get();
     }
}
