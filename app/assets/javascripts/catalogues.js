$(function() {
  var catalogueDropzone = new Dropzone("#catalogue-dropzone");
  Dropzone.options.catalogueDropzone = false;
  catalogueDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
  catalogueDropzone.on("complete", function(files) {
    var _this = this;
    if (_this.getUploadingFiles().length === 0 && _this.getQueuedFiles().length === 0) {
      setTimeout(function(){
        $('#myModal').modal('hide');
        var acceptedFiles = _this.getAcceptedFiles();
        var rejectedFiles = _this.getRejectedFiles();

        for(var index = 0; index < acceptedFiles.length; index++) {
          var file = acceptedFiles[index];
          var response = JSON.parse(file.xhr.response);
          appendContent(response.file_name.url, response.id);
        }

        if(acceptedFiles.length != 0) {
          alertify.success('Uploaded ' + acceptedFiles.length + ' files successfully.');
        }
        if(rejectedFiles.length != 0) {
          alertify.error('Error uploading ' + rejectedFiles.length + ' files. Only image files are accepted.');
        }

        _this.removeAllFiles();

      }, 2000);
    }
  });
});

var appendContent = function(imageUrl, catalogueId) {
  $("#catalogues").append('<div class="col-lg-4">' +
    '<div class="thumbnail"><img src="' + imageUrl + '"/>' +
    '<div class="caption">' +
    '<input id="catalogues_" name="catalogues[]" value="' + catalogueId +'" type="checkbox">' +
    '</div>' +
    '</div></div>');
  $("#delete").removeAttr('disabled');
  $("#delete-all").removeAttr('disabled');
  $("#no-catalogue").html("");
};