$(document).ready(function() {

  $.get('/docs', function(data) {
    var $documents = $('#documents');
    console.log(data);
    var url = 'http://' + data.Name + '.s3.amazonaws.com/'
    data.Contents.forEach(function(file) {
      console.log(file);
      var $link = $('<a>').attr('href', url + file.Key).html(file.Key);
      var $item = $('<li>').html($link);
      $documents.append($item);
    })
  });

});