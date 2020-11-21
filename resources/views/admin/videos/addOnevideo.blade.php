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
        <h5 class="center">Adding video to: <b>{{ $subject->name }}</b></h5>
        <br>
        <div class="row">
            <form action="{{ route('video.add_one') }}" method="post">
                @csrf
                <input type="hidden" name="topicId" value="{{  $topicId }}">
                <div class="input-field col s12 m2 offset-m2">
                    <label for="vname">Video name</label>
                    <input type="text" name="vname" class="validate" />
                </div>
                <div class="input-field col s12 m5">
                    <label for="url">Video link (URL)</label>
                    <input type="url" name="vlink" class="validate" />
                </div>
                <div class="input-field col s12 m3">
                    <button class="btn orange white-text waves-effect waves-light">Save</button>
                </div>
            </form>
        </div>
        <div class="col s12 m12 w3-padding" style="overflow-x:auto !important;">
            <table class="w3-table w3-striped w3-border-blue" style="font-size: 15px !important;">
                <tr class="w3-orange">
                    <th>S/N</th>
                    <th>Topic Name</th>
                    <th>video name</th>
                    <th>video link (URL)</th>
                    <th colspan="2">Action</th>
                </tr>
                <tbody>
                    @foreach ($topicvideos as $key => $topicvideo)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ $topicvideo->topic->topicName }}</td>
                            <td>{{ $topicvideo->videoName }}</td>
                            <td>{{ $topicvideo->video_url }}</td>
                            <td><button type="button" href="#modal{{ $key + 1 }}" class="modal-trigger w3-btn orange orange-text lighten-4">Edit <i class="fa fa-pen"></i></button></td>
                            <td>
                                <form action="{{ route('video.delete.method') }}" method="post" id="form{{ $topicvideo->id }}">
                                    @csrf
                                    <input type="hidden" name="videoId" value="{{ $topicvideo->id }}">
                                    <button type="button" class="w3-btn red red-text lighten-4" onclick="deletes{{ $topicvideo->id }}()" id="btn-submit{{ $topicvideo->id }}">Delete <i class="fa fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                        {{-- modal to edit --}}
                        @include('includes.admin.edit_video')
                        {{-- end edit modal --}}
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
<a href="{{ route('admin.addVideos') }}" class="btn blue blue-text lighten-4 waves-effect waves-light" style="position: fixed; botton:10px; left: 10px"><i class="fa fa-arrow-alt-circle-left"></i> go back</a>
@endsection
