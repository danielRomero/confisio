//= require select2
$(document).on('turbolinks:load', function () {
  tinymce.remove();
  tinymce.init({selector:'.tinymce'});
});
