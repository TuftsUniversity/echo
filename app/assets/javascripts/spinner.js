$(function(){
  $(".spinner").hide();
  
  $(document).ajaxStart(function(){
    $(".spinner").show();
    $(".loading-content").hide();
  });
  
  $(document).ajaxStop(function(){
    $(".spinner").hide();
    $(".loading-content").show();
  });
});