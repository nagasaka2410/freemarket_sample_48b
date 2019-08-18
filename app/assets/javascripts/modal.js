$(function(){

  $('#modal-open-btn').on('click', function() {
    $('#overlay').fadeIn();

  $('#modal-close-btn').on('click', function() {
    $('#overlay').fadeOut();
    });
  });

  $('#delete-comformation-btn').on('click', function() {
    $(".btn-delete").click();
  });
});


$(function(){
  $('.btm_create').on('click', function() {
    $('#create-modal').fadeIn();

  $('#modal-close-btn').on('click', function() {
    $('#create-modal').fadeOut();
    });
  });

  $('#delete-comformation-btn').on('click', function() {
    $("").click();
  });
});