<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'user_name',
        'email',
        'password',
        'profile',
        'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function usersubjects(){
        return $this->belongsToMany('App\Models\Usersubject');
    }
    public function full_time_payments(){
        return $this->hasMany('App\Models\Full_time_payment');
    }
    public function part_time_payments(){
        return $this->hasMany('App\Models\Part_time_payment');
    }
    public function likedislikes(){
        return $this->hasMany('App\Models\Likedislike');
    }
    public function views(){
        return $this->hasMany('App\Models\View');
    }

    // public function AuthAcessToken(){
    //     return $this->hasMany('App\Models\OauthAccessToken');
    // }
    public function subjects(){
        return $this->belongsToMany('App\Models\Subject');
    }
    public static function getUserId($fname, $phone){
        $query = User::where('fullName', $fname)
                    ->where('phoneNumber', $phone)
                    ->first();
        return $query->id;
    }
}
