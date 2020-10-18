<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Subject extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'level_id', 'name', 'author', 'topics', 'url'
    ];

    public function level(){
        return $this->belongsTo('App\Level');
    }
    public function usersubjects(){
        return $this->belongsToMany('App\Models\Usersubject');
    }

    public static function getAllByLevelId($levelId){
        return Subject::where('level_id', $levelId)->get();
    }
}
