//= require select2
//= require tinymce-jquery
$(document).on('turbolinks:load page:load', function () {
  tinymce.remove();
  tinyMCE.init({
      selector: "textarea.tinymce",
      toolbar: ["styleselect | bold italic | undo redo","image | link"],
      plugins: "image,link"
    });
});
