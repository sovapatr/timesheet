// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require_tree .
//= require jquery_nested_form

$(function() {
  $( "#datepicker" ).datepicker({
        dateFormat: "yy-mm-dd"
  });
  $( "#datepicker2" ).datepicker({
        dateFormat: "yy-mm-dd"
  });
});

$(document).ready(function() { 
  $(".e1").select2({ 
    width: '250px'
  });           
});

$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field; 
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.e1');
  // and activate datepicker on it
  dateField.select2({
    width: '250px'
  });
})