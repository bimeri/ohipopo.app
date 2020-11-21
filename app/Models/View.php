<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class View extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'user_id', 'level_id', 'video_id',
    ];

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public function level(){
        return $this->belongsTo('App\Models\Level');
    }

    public function video(){
        return $this->belongsTo('App\Models\Topicvideo');
    }
}
