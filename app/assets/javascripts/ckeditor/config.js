CKEDITOR.editorConfig = function (config) {
  config.extraPlugins = 'youtube';
  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
    [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],
    [ 'Image', 'Youtube', 'Table', 'HorizontalRule','-', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ],
    [ 'Styles', 'Format', 'Font', 'FontSize' ],
    [ 'TextColor', '-', 'BGColor' ]
  ];
  config.toolbar = "simple";
}