//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  $('.alert').delay(500).fadeIn('normal', function() {
    $(this).delay(1000).fadeOut();
  });
});
