$('#message').hide();

$(function() {
  // executed when the document is ready!
   $('#message').delay(500).slideDown();

   $('#message').on('click', function(event) {
    $(this).slideUp()
   });


   $('#message-wrapper').on('mouseenter', function(event) {
    $('#message').slideDown();
   }).on('mouseleave', function(event) {
    $('#message').slideUp();
   });

});