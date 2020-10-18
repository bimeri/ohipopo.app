<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Level extends Model
{
    use HasFactory;
    use Notifiable;
    protected $fillable = [
        'type_id', 'levelName'
    ];
    public static function getLevelByType($type){
        return Level::where('type_id', $type)->get();
    }

    public function type(){
        return $this->belongsTo('App\Models\Type');
    }

    public function subjects(){
        return $this->hasMany('App\Models\Suject');
    }

    public static function getLevelById($levelId){
        return Level::where('id', $levelId)->first();
    }
}

