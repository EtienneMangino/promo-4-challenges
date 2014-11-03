$(function() {
  // executed when the document is ready!
  $('img').on('click', function(event) {
    $('body').append($('<div id ="backcolor"> </div>'));
    $('body').append($('<div id ="modale_image"><img src='+$('img').attr('src')+'>  </div>'));

  });

  $('body').on('click','#backcolor', function(event) {
    $('#backcolor').remove();
    $('#modale_image').remove();
    console.log("llll");
  });

});
