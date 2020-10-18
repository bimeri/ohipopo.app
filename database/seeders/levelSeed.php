<?php

namespace Database\Seeders;

use App\Models\Level;
use Illuminate\Database\Seeder;

class levelSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $levels = [
            [
                'type_id' => 1,
                'levelName' => 'form3'
            ],
            [
                'type_id' => 1,
                'levelName' => 'form4'
            ],
            [
                'type_id' => 1,
                'levelName' => 'form5'
            ],
            [
                'type_id' => 1,
                'levelName' => 'lowerSixth'
            ],
            [
                'type_id' => 1,
                'levelName' => 'upperSixth'
            ],
            [
                'type_id' => 2,
                'levelName' => 'oLevel'
            ],
            [
                'type_id' => 2,
                'levelName' => 'aLevelArt'
            ],
            [
                'type_id' => 2,
                'levelName' => 'aLevelScience'
            ],
        ];
        foreach($levels as $level){
            Level::create($level);
        }
    }
}
