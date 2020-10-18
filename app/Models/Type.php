<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Type extends Model
{
    use HasFactory;
    use Notifiable;
    protected $fillable = [
        'typeName'
    ];

    public function levels(){
        return $this->hasMany('App\Models\Level');
    }

    public static function getAllType(){
        return Type::all();
    }
}
