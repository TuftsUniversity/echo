//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.dynatable
//= require spinner
//= require echo
//= require header-toggle
//= require dismiss-flashes
//= require initialize-tables

$(function() {
  Echo.dismissFlashesOnClick();
  
  Echo.initializeTables(); 
});