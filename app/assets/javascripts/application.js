//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .
//= require underscore
//= require gmaps/google


$(document).ready(function() {
  $('.alert').delay(500).fadeIn('normal', function() {
    $(this).delay(1000).fadeOut();
  });
});
