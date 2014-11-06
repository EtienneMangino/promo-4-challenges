// Your validation code will go in there.
// Write your validation functions, and bind events
// in a jQuery DOM ready callback
  emailValidation();
  mobileValidation();
  zipFormat();

$(document).keyup(function(e) {
  emailValidation();
  mobileValidation();
  zipFormat();
  submitValidation();
 });

$("#tos").click(function() {
  submitValidation();
  emailValidation();
  mobileValidation();
  zipFormat();
});

function submitValidation(){
  if (allFilled() && checkedBox() && zipFormat() && emailValidation() && mobileValidation()){
    $('#submitbutton').removeAttr('disabled');
    $('#submitbutton').text('Here we go !');
  }else{
    $('#submitbutton').attr('disabled','disabled');
    $('#submitbutton').text('Please fill all fields');
  }
}

function allFilled(){
  if (filledBox('first_name') && filledBox('last_name') && filledBox('address') && filledBox('city') ){
    return true;
  }else {
    return false;
  }
}

function filledBox(id) {
  if ($('#'+id).val() != "") {
    return true;
  }else {
    return false;
  }
}

function checkedBox() {
 if ($('#tos:checked').size() == 1) {
   return true;
 } else {
   return false;
 }
}

function zipFormat() {
 if ( ($('#zip_code').val().length == 5) && (parseInt($('#zip_code').val()) < 97670) ) {
   $('#zip_code').css("background-color","#ABFFC5");
   return true;
 } else {
   $('#zip_code').css("background-color","#FFB4B4");
  return false;
 }
}

function emailValidation(){
  var email = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
  if ($('#email').val().match(email)){
    $('#email').css("background-color","#ABFFC5");
    return true
  }else{
    $('#email').css("background-color","#FFB4B4");
    return false
  }
}

function mobileValidation(){

  var number = new RegExp(/^0[1-6]{1}(([0-9]{2}){4})|((\s[0-9]{2}){4})|((-[0-9]{2}){4})$/);
  if ($('#mobile_phone').val().match(number)){
    $('#mobile_phone').css("background-color","#ABFFC5");
    return true
  }else{
    $('#mobile_phone').css("background-color","#FFB4B4");
    return false

  }
}