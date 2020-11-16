<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Usersubject extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'subject_id', 'user_id'
    ];
    public function subject(){
        return $this->belongsTo('App\Models\Subject');
    }
    public function user(){
        return $this->belongsTo('App\Models\Subject');
    }

    public static function getAllUserSubject($studentId){
        $query = Usersubject::where('user_id', $studentId)->orderBy('subject_id', 'asc')->get();
        return $query;
    }

    public static function countAllUser($subjectId){
        return Usersubject::where('subject_id', $subjectId)
                            ->count();
    }
}
