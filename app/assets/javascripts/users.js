$(function() {
    $('.registration__sms').hide();
    $('.registration__address').hide();
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
      $('.registration__address').show();
      $('h2').text("住所入力");
      $('#address').css('color','#ea352d');
      $('#active').css('color','#888');
      $('#active .progress-status_bar').css('background','#ea352d');
      $('#address .progress-status').css('background','#ea352d');
      $('body, html').animate({ scrollTop: 0 }, 0);
    });

    $('.btn-address').on('click', function(){
      $('.registration__address').hide();
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
    $('#user_user_detail_attributes_birth_day').empty();
    var y = $('#user_user_detail_attributes_birth_year').val();
    var m = $('#user_user_detail_attributes_birth_month'). val();

    if (m == "" || y == "") { //年か月が選択されていない時は31日まで表示
      var last = 31;
    } else if (m == 2 && ((y % 400 == 0) || ((y % 4 == 0) && (y % 100 != 0)))) {
      var last = 29; //うるう年判定
    } else {
      var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m-1];
    }

    $('#user_user_detail_attributes_birth_day').append('<option value="">--</option>');
    for (var i = 1; i <= last; i++) {
      if (d == i) { //日がすでに選択されている場合はその値が選択された状態で表示
        $('#user_user_detail_attributes_birth_day').append('<option value="' + i + '" selected>' + i + '</option>');
      } else {
        $('#user_user_detail_attributes_birth_day').append('<option value="' + i + '">' + i + '</option>');
      }
    }
  }

  var d = 0;
  $(function(){
    //1900年～2019年まで表示
    for (var i = 2019; i >= 1900; i--) {
      $('#user_user_detail_attributes_birth_year').append('<option value="' + i + '">' + i + '</option>');
    }
    //1月～12月まで表示
    for (var i = 1; i <= 12; i++) {
      $('#user_user_detail_attributes_birth_month').append('<option value="' + i + '">' + i + '</option>');
    }
    //1日～31日まで表示
    for (var i = 1; i <= 31; i++) {
      $('#user_user_detail_attributes_birth_day').append('<option value="' + i + '">' + i + '</option>');
    }

    $('#user_user_detail_attributes_birth_day').change(function(){
      d = $(this).val();
    });
    //年か月が変わるごとに日数を計算
    $('#user_user_detail_attributes_birth_year').change(calcDays);
    $('#user_user_detail_attributes_birth_month').change(calcDays);
  });
});

// $('#btn-red').on('click',function()
// {
//   let error = $(this).find('span.error-info').length;
//   if(error)
//   {
//     alert("入力エラーがあります");
//     return false;
//   }
// });