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
        <h5 class="center">Select the Subject to add Topic</h5>
        <div class="col s12 m12 w3-padding" style="overflow-x:auto !important;">
            <div id="message"></div>
            <form action="{{ route('topic.add.one') }}" method="get">
                @csrf
                <div class="row">
                    <div class="col s12 m3">
                        <select class="browser-default" id="level" onchange="getSubjects()">
                            <option value="">select the class</option>
                            @foreach ($levels as $level)
                                <option value="{{ $level->id }}">{{ $level->levelName }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col s12 m3">
                        <select class="browser-default" name="subjectId" id="subj" required onchange="showInput()">
                            <option value="">select the subjects</option>
                        </select>
                    </div>
                    <div class="input-feld col s12 m3" id="hides">
                        <button class="btn orange white-text waves-effect waves-light">Add Topic</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
