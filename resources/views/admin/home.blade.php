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
        <h5 class="center">All Subjects</h5>
        <button class="btn right blue waves-effect waves-light">Add Subject <i class="fa fa-plus"></i></button>
        <div class="col s12 m12 w3-padding" style="overflow-x:auto !important;">
            <table class="w3-table w3-striped w3-border-blue" style="font-size: 15px !important;">
                <tr class="w3-orange">
                    <th>S/N</th>
                    <th>Subject Name</th>
                    <th>Subject Author</th>
                    <th>Topics</th>
                    <th>Level</th>
                    <th>Icon</th>
                    <th>Default video</th>
                    <th colspan="3">Action</th>
                </tr>
                <tbody>
                    @foreach ($subjects as $key => $subject)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ $subject->name }}</td>
                            <td>{{ $subject->author }}</td>
                            <td>{{ $subject->topic }}</td>
                            <td>{{ $subject->level->levelName }}</td>
                            <td><img src="{{ URL::asset(''.$subject->logo.'') }}" height="50" width="70"></td>
                            <td> <video src="{{ $subject->url }}" height="50" width="70"></video> </td>
                            <td><button type="button" class="w3-btn blue blue-text lighten-4">View <i class="fa fa-eye"></i></button></td>
                            <td><button type="button" class="w3-btn orange orange-text lighten-4">Edit <i class="fa fa-pen"></i></button></td>
                            <td><button type="button" class="w3-btn red red-text lighten-4">Delete <i class="fa fa-trash"></i></button></td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
