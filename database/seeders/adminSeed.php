<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;

class adminSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $admins = [
            [
                'full_name' => 'Tanyi AY',
                'username' => 'tanyi',
                'contact' => '672415123',
                'email' => 'tanyiayukegba@gmail.com',
                'password' => bcrypt('Transformer+1'),
                'is_super' => 1,
            ]
        ];
        foreach($admins as $admin){
            Admin::create($admin);
        }
    }
}
