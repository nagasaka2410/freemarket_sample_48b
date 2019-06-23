$(function() {
    $('.registration__sms').hide();
    $('.registration__adress').hide();
    $('.registration__payment').hide();
  
    $('.btn-next').on('click', function(){
      $('.registration__basic').hide();
      $('.registration__sms').show();
      $('h2').text("電話番号の確認");
      $('#active').css('color','#ea352d');
      $('#through').css('color','#888');
      $('#through .progress-status_bar').css('background','#ea352d');
      $('#active .progress-status').css('background','#ea352d');
      $('body, html').animate({ scrollTop: 0 }, 0);
    });

    $('.btn-sms').on('click', function(){
      $('.registration__sms').hide();
      $('.registration__adress').show();
      $('h2').text("住所入力");
      $('#address').css('color','#ea352d');
      $('#active').css('color','#888');
      $('#active .progress-status_bar').css('background','#ea352d');
      $('#address .progress-status').css('background','#ea352d');
      $('body, html').animate({ scrollTop: 0 }, 0);
    });

    $('.btn-adress').on('click', function(){
      $('.registration__adress').hide();
      $('.registration__payment').show();
      $('h2').text("支払い方法");
      $('#payment').css('color','#ea352d');
      $('#address').css('color','#888');
      $('#address .progress-status_bar').css('background','#ea352d');
      $('#payment .progress-status').css('background','#ea352d');
      $('body, html').animate({ scrollTop: 0 }, 0);
    });
  });

$(function(){
  //日付範囲決定
  function calcDays(){
    $('#day').empty();
    var y = $('#year').val();
    var m = $('#month'). val();

    if (m == "" || y == "") { //年か月が選択されていない時は31日まで表示
      var last = 31;
    } else if (m == 2 && ((y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0)))) {
      var last = 29; //うるう年判定
    } else {
      var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m-1];
    }

    $('#day').append('<option value="">--</option>');
    for (var i = 1; i <= last; i++) {
      if (d == i) { //日がすでに選択されている場合はその値が選択された状態で表示
        $('#day').append('<option value="' + i + '" selected>' + i + '</option>');
      } else {
        $('#day').append('<option value="' + i + '">' + i + '</option>');
      }
    }
  }

  var d = 0;
  $(function(){
    //1900年～2019年まで表示
    for (var i = 2019; i >= 1900; i--) {
      $('#year').append('<option value="' + i + '">' + i + '</option>');
    }
    //1月～12月まで表示
    for (var i = 1; i <= 12; i++) {
      $('#month').append('<option value="' + i + '">' + i + '</option>');
    }
    //1日～31日まで表示
    for (var i = 1; i <= 31; i++) {
      $('#day').append('<option value="' + i + '">' + i + '</option>');
    }

    $('#day').change(function(){
      d = $(this).val();
    });
    //年か月が変わるごとに日数を計算
    $('#year').change(calcDays);
    $('#month').change(calcDays);
  });
});

$(function(){
  var time = new Date();
  var year = time.getFullYear();
  for (var i = year; i >= 1900; i--) {
      $('#year2').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 12; i++) {
      $('#month2').append('<option value="' + i + '">' + i + '</option>');
  }
});