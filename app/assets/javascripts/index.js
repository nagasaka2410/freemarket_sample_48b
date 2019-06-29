$(function() {
  $('.up li').click(function() {
    var index = $('.up li').index(this);
    $('.tab').css('display','none');
    $('.tab').eq(index).css('display','block');
    $('.up li').removeClass('is-active');
    $(this).addClass('is-active');
    $('.hide').css('display','block'); 
  });
});


$(function() {
  $('.under li').click(function() {
    var index = $('.under li').index(this);
    $('.ta').css('display','none');
    $('.ta').eq(index).css('display','block');
    $('.under li').removeClass('is-action');
    $(this).addClass('is-action');
    $('.traded-item-not-found').css('display','block'); 
  });
  window.onload = function(){
    $('.traded-item-not-found').css('display','none'); 
    $('.hide').css('display','none');
  };
});
