<?php

namespace Database\Seeders;

use App\Models\Type;
use Illuminate\Database\Seeder;

class typeSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $types = [
            [
                'typeName' => 'fullTime'
            ],
            [
                'typeName' => 'partTime'
            ],
        ];
        foreach($types as $type){
            Type::create($type);
        }
    }
}
