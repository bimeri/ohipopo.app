<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $users = [
            [
                'name' => 'Bimeri Noel',
                'user_name' => 'bimeri',
                'email' => 'bimerinoel@gmail.com',
                'password' => bcrypt('123456'),
                'profile' => '1.png',
                'status' => '1',
            ],
            [
                'name' => 'Noeline Namondo',
                'user_name' => 'noeline',
                'email' => 'noeline@gmail.com',
                'password' => bcrypt('123456'),
                'profile' => '2.png',
                'status' => '1',
            ],
        ];

        foreach($users as $user){
            User::create($user);
        }
    }
}
