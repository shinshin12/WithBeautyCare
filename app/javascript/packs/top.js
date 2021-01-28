$(window).on('load', function(){
  let top = $("#scrollTop");
  top.hide();
})

$(window).scroll(function(){
  if($(this).scrollTop() > 700){
    top.fadeIn();
  }else{
    top.fadeOut();
  }
})