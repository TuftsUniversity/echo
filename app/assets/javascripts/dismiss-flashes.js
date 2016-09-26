Echo.dismissFlashesOnClick = function(){
  setTimeout(function(){
    $(".flash").slideUp();  
  }, 3000);
  
  $(".flash").click(function(){
    $(this).slideUp();
  });
};