@extends('layouts.admin')
@section('title', 'Home')
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
        <h5 class="center">Select the topic you wish to add video</h5><hr>
        <div id="message"></div>
        <form action="{{ route('add.one.video') }}" method="get">
            @csrf
            <div class="col s12 m3">
                <select class="browser-default" id="level" onchange="getSubjects()">
                    <option value="">select the class</option>
                    @foreach ($levels as $level)
                        <option value="{{ $level->id }}">{{ $level->levelName }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col s12 m3">
                <select class="browser-default" name="subjectId" id="subj" required onchange="selectTopics()">
                    <option value="">select the subjects</option>
                </select>
            </div>
            <div class="col s12 m3">
                <select class="browser-default" name="topicId" id="topics" required>
                    <option value="">select the topic</option>
                </select>
            </div>
            <div class="col s12 m3">
                <button class="w3-btn waves-light waves-effect orange white-text">Submit</button>
            </div>
        </form>
    </div>
</div>
@endsection
