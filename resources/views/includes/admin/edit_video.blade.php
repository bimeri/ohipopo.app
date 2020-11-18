<script>
    function deletes{{ $topicvideo->id }}(){
  $(document).on('click', '#btn-submit{{ $topicvideo->id }}', function(e) {
      e.preventDefault();
     swal({
            title: "Are you sure you want to delete?",
            text: "be careful because students may have registered the subject already!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
  }).then(function (willUpdate) {
    if (willUpdate) {
      swal("Poof! The subject has been deleted successfully", {
        icon: "success",
      });
      $('#form{{ $topicvideo->id }}').submit();
    } else {
      swal("the subject remain unchanged!");
    }
      });
  });
  }
</script>

<div id="modal{{ $key + 1 }}" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4 class="w3-center orange-text">Edit the video</h4>
      <hr style="border-top: 1px solid orange">
        <div class="row">
            <form action="{{ route('video.edit.method') }}" method="post">
                @csrf
                <input type="hidden" value="{{ $topicvideo->id }}" name="topicvideoId" />
                <div class="row">
                    <div class="input-field col s12 m12">
                        <label for="vname">Video name</label>
                        <input type="text" name="vname" class="validate" value="{{ $topicvideo->videoName }}" />
                    </div>
                    <div class="input-field col s12 m12">
                        <label for="url">Video link (URL)</label>
                        <input type="url" name="vlink" class="validate" value="{{ $topicvideo->video_url }}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m4 offset-m3">
                        <button type="submit" class="btn orange white-text waves-light waves-effect col s12 m4 offset-m3" style="width 100%">Update video</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="modal-close red waves-effect waves-green btn-flat right white-text">Cancel</button>
    </div>
</div>
