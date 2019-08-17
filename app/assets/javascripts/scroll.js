$(function(){
  $('a[href^="#parent"]').on('click',function() {
    var speed = 1000;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, 2000, 'swing');
    return false;
  });
})