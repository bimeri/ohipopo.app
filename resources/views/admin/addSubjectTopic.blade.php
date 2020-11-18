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
        <h5 class="center">All Topics for the Subject: <b>{{ $subject->name }}</b></h5><hr>
        <form action="{{ route('topic.add.oneOnly') }}" method="post">
            @csrf
            <input type="hidden" value="{{ $subject->id }}" name="subjectId">
            <div class="col s12 m4 offset-m3">
                <input type="text" placeholder="enter more topic" name="topicName" required />
            </div>
            <div class="col s12 m4">
                <button class="btn orange white-text waves-light waves-effect">submit</button>
            </div>
        </form>
        <div class="col s12 m12 w3-padding" style="overflow-x:auto !important;">
            <table class="w3-table w3-striped w3-border-blue" style="font-size: 15px !important;">
                <tr class="w3-orange">
                    <th>S/N</th>
                    <th>Topics</th>
                    <th>Action</th>
                </tr>
                <tbody>
                    @foreach ($topics as $key => $topic)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td>{{ $topic->topicName }}</td>
                            <td>
                                <form action="{{ route('delete.topic') }}" method="post" id="form{{ $key + 1 }}">
                                    @csrf
                                    <input type="hidden" name="topicId" value="{{ $topic->id }}">
                                </form>
                                <button class="w3-btn red red-text lighten-4 waves-effect waves-light"
                                onclick="deletes{{ $key + 1 }}()" id="btn-submit{{ $key + 1 }}">
                                delete <i class="fa fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                        <script>
                            function deletes{{  $key + 1 }}(){
                          $(document).on('click', '#btn-submit{{  $key + 1 }}', function(e) {
                              e.preventDefault();
                             swal({
                                    title: "Are you sure you want to delete?",
                                    text: "be careful because students may have registered the subject already!",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: true,
                          }).then(function (willUpdate) {
                            if (willUpdate) {
                              swal("Poof! The topc has been successfully deleted", {
                                icon: "success",
                              });
                              $('#form{{  $key + 1 }}').submit();
                            } else {
                              swal("the Topic remain unchanged!");
                            }
                              });
                          });
                          }
                        </script>
                    @endforeach
                    @if ($count == 0)
                    <tr class="center red red-text center lighten-4">
                        <td colspan="3">
                            there is no Topic for for this Subject
                        </td>
                    </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
<a href="{{ route('topic.add') }}" class="btn blue blue-text lighten-4 waves-effect waves-light" style="position: fixed; botton:10px; left: 10px"><i class="fa fa-arrow-alt-circle-left"></i> go back</a>
@endsection
