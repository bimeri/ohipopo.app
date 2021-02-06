<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Part_time_payment extends Model
{
    use HasFactory, Notifiable;
    protected $fllable = [
        'user_id', 'amount', 'paymentDate', 'counter'
    ];

    public function user(){
        return $this->belongsTo('App\Models\User');
    }

    public static function getUserPaidDetail($userid){
        return Part_time_payment::where('user_id', $userid)->get();
    }
}
