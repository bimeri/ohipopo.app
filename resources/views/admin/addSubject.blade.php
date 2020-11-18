@extends('layouts.admin')
@section('title', 'Add Subject')
@section('style')
<style>
    td, th, tr{
        border-collapse: collapse;
        border: 1px solid black !important;
        font-size: 14px !important;
        text-align: center !important;
    }
</style>
@endsection
@section('content')
<div class="row">
    <div class="col s12 m10 offset-m1 w3-border w3-padding radius white w3-border-amber">
        <h5 class="center">Add Subject</h5>
        <form action="{{ route('subject.add.method') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="input-field col 12 m3">
                    <label for="name">Enter Subject name</label>
                    <input type="text" value="" name="subject" class="autocompleteSubject validate" id="name" required/>
                </div>
                <div class="input-field col 12 m3">
                    <select name="level_id" required>
                        <option value="">select the level or Class</option>
                        @foreach (App\Models\Level::all() as $level)
                        <option value="{{ $level->id }}">{{ $level->levelName }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="input-field col 12 m3">
                    <label for="teacher">Enter teacher's name</label>
                    <input type="text" value="" name="teacher" id="teacher" class="validate" required/>

                </div>
                <div class="input-field col 12 m3">
                    <label for="topic">Enter number of topic</label>
                    <input type="number" placeholder="example 10" name="topic" id="topic" class="validate" required/>
                </div>
            </div>
            <div class="row">
                <div class="file-field input-field col s12 m3 offset-m2">
                    <div class="btn">
                      <input type="file" name="profile_image" id="imgInp">
                    </div>
                    <div class="file-path-wrapper">
                        <img id="blah" src="#" alt="Upload logo" height="60" width="70"/>
                      <input class="file-path validate" name="profile_image" type="text" placeholder="upload subject logo">
                    </div>
                </div>

                <div class="input-field col s12 m4">
                    <label for="logo">enter default URL</label>
                    <input type="url" name="url" class="validate" />
                </div>
            </div>
            <div class="row">
                <div class="col s12 m4 offset-m3">
                    <button type="submit" class="btn orange white-text waves-light waves-effect col s12 m4 offset-m3" style="width 100%">Save subjects</button>
                </div>
            </div>
        </form>
        <hr>
        <div class="row">
            <div class="col s12 m12 w3-padding" style="overflow-x:auto !important;">
                <h5 class="center">Result showing latest 7 registered subjects</h5>
                <table class="w3-table w3-striped w3-border-blue" style="font-size: 15px !important;">
                    <tr class="w3-orange">
                        <th>S/N</th>
                        <th>Subject Name</th>
                        <th>Subject Author</th>
                        <th>Topics</th>
                        <th>Level</th>
                        <th>Icon</th>
                        <th>Default video</th>
                    </tr>
                    <tbody>
                        @foreach (App\Models\Subject::getTenSubject() as $key => $subject)
                            <tr>
                                <td>{{ $key + 1 }}</td>
                                <td>{{ $subject->name }}</td>
                                <td>{{ $subject->author }}</td>
                                <td>{{ $subject->topic }}</td>
                                <td>{{ $subject->level->levelName }}</td>
                                <td><img src="{{ URL::asset(''.$subject->logo.'') }}" height="50" width="70"></td>
                                <td> <video src="{{ $subject->url }}" height="50" width="70"></video> </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
