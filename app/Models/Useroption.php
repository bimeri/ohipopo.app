<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Useroption extends Model
{
    use HasFactory, Notifiable, HasApiTokens;
    protected $fillable = [
        'user_id', 'level_id', 'amount', 'paid_amount', 'balance', 'deadLine', 'subscribed'
    ];

    public static function getUserDtail($uid){
        return Useroption::where('user_id', $uid)->first();
    }
}
