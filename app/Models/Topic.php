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
        'subject_id', 'topicName', ''
    ];
}
