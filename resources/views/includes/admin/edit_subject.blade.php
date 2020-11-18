<script>
    function deletes{{ $subject->id }}(){
  $(document).on('click', '#btn-submit{{ $subject->id }}', function(e) {
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
      $('#form{{ $subject->id }}').submit();
    } else {
      swal("the subject remain unchanged!");
    }
      });
  });
  }
</script>

<div id="modal{{ $key + 1 }}" class="modal modal-fixed-footer">
    <div class="modal-content">
      <h4 class="w3-center orange-text">Edit the subjects</h4>
      <hr style="border-top: 1px solid orange">
        <div class="row">
            <form action="{{ route('subject.edit.method') }}" method="post">
                @csrf
                <input type="hidden" value="{{ $subject->id }}" name="subjectId" />
                <div class="row">
                    <div class="input-field col 12 m3">
                        <label for="name">Subject name</label>
                        <input type="text" value="{{ $subject->name }}" name="subject" class="autocompleteSubject validate" id="name" required/>
                    </div>
                    <div class="col 12 m3">
                        <select name="level" class="browser-default" required>
                            <option value="{{ $subject->level_id }}" selected>{{ $subject->level->levelName }}</option>
                            @foreach (App\Models\Level::all() as $level)
                            <option value="{{ $level->id }}">{{ $level->levelName }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="input-field col 12 m3">
                        <label for="teacher">teacher's name</label>
                        <input type="text" value="{{ $subject->author }}" name="teacher" id="teacher" class="validate" required/>
                    </div>
                    <div class="input-field col 12 m3">
                        <label for="topic">Number of topic</label>
                        <input type="number" value="{{ $subject->topic }}" name="topic" id="topic" class="validate" required/>
                    </div>
                </div>
                <div class="row">
                    <div class="file-field input-field col s12 m4">
                        <div class="file-path-wrapper">
                          <input class="file-path validate" name="profile_image" type="text" value="{{ $subject->logo }}" placeholder="upload subject logo">
                        </div>
                    </div>
                    <div class="input-field col s12 m7">
                        <label for="logo">Default URL</label>
                        <input type="url" name="url" class="validate" value="{{ $subject->url }}" />
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m4 offset-m3">
                        <button type="submit" class="btn orange white-text waves-light waves-effect col s12 m4 offset-m3" style="width 100%">Update subjects</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="modal-close red waves-effect waves-green btn-flat right white-text">Cancel</button>
    </div>
</div>
