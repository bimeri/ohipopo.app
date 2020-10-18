<?php

namespace Database\Seeders;

use App\Models\Subject;
use Illuminate\Database\Seeder;

class subjectSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $subjects = [
            [
                'level_id' => 8,
                'name' => 'Physics',
                'author' => 'Nelkon and Paker',
                'topic' => '10',
                'url' => 'https://www.googleapis.com/drive/v3/files/14RITnoJ9ifD88fBVKAvxz-ov6Db1QfQZ?alt=media&key=AIzaSyBESy2yrv_nLukqOdevHfc00mfsw52brGE'
            ],
            [
                'level_id' => 8,
                'name' => 'Chemistry',
                'author' => 'Ngule Emmanuel',
                'topic' => '15',
                'url' => 'https://www.googleapis.com/drive/v3/files/1RL1EZOAeGpdI4ibKdyAlizNliq01iPnU?alt=media&key=AIzaSyCiOmyPJ2cmS9UDV-EBmo0349FP8KQM5PQ'
            ],
            [
                'level_id' => 8,
                'name' => 'Biology',
                'author' => 'Tapong Sylvester',
                'topic' => '11',
                'url' => 'https://www.googleapis.com/drive/v3/files/1otTfVbHN25XEBVO6K2rYo3_qC8jUKZm1?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE'
            ],
            [
                'level_id' => 8,
                'name' => 'Pure Mathematics',
                'author' => 'Chadler Bostock',
                'topic' => '11',
                'url' => 'https://www.googleapis.com/drive/v3/files/1NVWAegnn2MLtf0zk2UP21uaKCdIKWW1l?alt=media&key=AIzaSyCEUgF8rXlqXwoiXJIrO7lahJKi-mfCmVA'
            ],
            [
                'level_id' => 8,
                'name' => 'Pure Mathematics with Mechanics',
                'author' => 'Chadler Bostock',
                'topic' => '11',
                'url' => 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8'
            ],
            [
                'level_id' => 8,
                'name' => 'Geology',
                'author' => 'Unknown',
                'topic' => '6',
                'url' => 'https://www.googleapis.com/drive/v3/files/1VmfAqeEkPyPFmnBavG3GNTfo3_8SJBOQ?alt=media&key=AIzaSyCSjp80XrDBXFafzzyqWLUO2nDczjC38m0'
            ],
            [
                'level_id' => 8,
                'name' => 'Food Science',
                'author' => 'Peter Eves',
                'topic' => '6',
                'url' => 'https://www.googleapis.com/drive/v3/files/1aj3SxFCSkvQrSN0Z7yCToil03h1IbuJV?alt=media&key=AIzaSyBAFAIiNLasrJ2u3q09CdDnwXN1-dbm0zk'
            ],
            [
                'level_id' => 8,
                'name' => 'Further Mathematics',
                'author' => 'Bostock',
                'topic' => '9',
                'url' => 'https://www.googleapis.com/drive/v3/files/1BhRlew5oHudPooIZ7fwHBH6Nig1FRQXg?alt=media&key=AIzaSyBq--c-pvDnzDfG6--HwOuMvOdS1ASJoVE'
            ],
            [
                'level_id' => 8,
                'name' => 'Computer Science',
                'author' => 'Unknown',
                'topic' => '16',
                'url' => 'https://www.googleapis.com/drive/v3/files/1aR7IyX0-PjzhKhTG88I0q1PPDqnBcFjB?alt=media&key=AIzaSyDOJaT4HZwIdKLz_obWjn832oBTkcIIZy0'
            ],
            [
                'level_id' => 8,
                'name' => 'Information and Communication Technology',
                'author' => 'Unknown',
                'topic' => '16',
                'url' => 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8'
            ],
            [
                'level_id' => 8,
                'name' => 'Pure Mathematic with Statistics',
                'author' => 'Unknown',
                'topic' => '16',
                'url' => 'https://www.googleapis.com/drive/v3/files/10YtZUzbQE57xrVO1wzOBq-1-Wg0hODgZ?alt=media&key=AIzaSyBQmDvNblg1yFgHGX7ZJ2BTef2fJKd-XZ8'
            ],
        ];

        foreach($subjects as $subject){
            Subject::create($subject);
        }
    }
}
