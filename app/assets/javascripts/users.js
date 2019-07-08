$(function() {
    $('.registration__sms').hide();
    $('.registration__address').hide();
    $('.registration__payment').hide();
  
    $('.btn-next').on('click', function(){//携帯番号へ移動するボタン
      let error = $('form').find('span.error-info').length;
      let nickname = $('input#user_nickname').val();
      let email = $('input#user_email').val();
      let password = $('input#user_password').val();
      let confirmation = $('input#user_password_confirmation').val();
      let lname = $('input#user_user_detail_attributes_last_name').val();
      let fname = $('input#user_user_detail_attributes_first_name').val();
      let lnamekana = $('input#user_user_detail_attributes_last_name_kana').val();
      let fnamekana = $('input#user_user_detail_attributes_first_name_kana').val();
      let byear = $('select#user_user_detail_attributes_birth_year').val();
      let bmonth = $('select#user_user_detail_attributes_birth_month').val();
      let bday = $('select#user_user_detail_attributes_birth_day').val();
      let check = nickname&&email&&password&&confirmation&&lname&&fname&&lnamekana&&fnamekana&&byear&&bmonth&&bday
      if(error){
        alert("入力エラーがあります");
        return false;
      }
      else if(check == "") {
        alert("入力エラーがあります");
        return false;
      }
      else {
        $('.registration__basic').hide();
        $('.registration__sms').show();
        $('h2').text("電話番号の確認");
        $('#active').css('color','#ea352d');
        $('#through').css('color','#888');
        $('#through .progress-status_bar').css('background','#ea352d');
        $('#active .progress-status').css('background','#ea352d');
        $('body, html').animate({ scrollTop: 0 }, 0);
      }
    });

    $('.btn-sms').on('click', function(){//住所入力へ移動するボタン
      let error = $('form').find('span.error-info').length;
      let value = $('input#user_user_detail_attributes_mobile_phone').val();
      if(error){
        alert("入力エラーがあります");
        return false;
      }
      else if(value == "") {
        alert("入力エラーがあります");
        return false;
      }
      else {
        $('.registration__sms').hide();
        $('.registration__address').show();
        $('h2').text("住所入力");
        $('#address').css('color','#ea352d');
        $('#active').css('color','#888');
        $('#active .progress-status_bar').css('background','#ea352d');
        $('#address .progress-status').css('background','#ea352d');
        $('body, html').animate({ scrollTop: 0 }, 0);
      }
    });

    $('.btn-address').on('click', function(){//クレカ入力へ移動するボタン
      let error = $('form').find('span.error-info').length;
      let postal = $('input#user_user_address_attributes_postal_code').val();
      let city = $('input#user_user_address_attributes_city').val();
      let block = $('input#user_user_address_attributes_block_number').val();

      let check = postal&&city&&block
      if(error){
        alert("入力エラーがあります");
        return false;
      }
      else if(check == "") {
        alert("入力エラーがあります");
        return false;
      }
      else {
        $('.registration__address').hide();
        $('.registration__payment').show();
        $('h2').text("支払い方法");
        $('#payment').css('color','#ea352d');
        $('#address').css('color','#888');
        $('#address .progress-status_bar').css('background','#ea352d');
        $('#payment .progress-status').css('background','#ea352d');
        $('body, html').animate({ scrollTop: 0 }, 0);
        $('input#user_creditcard_attributes_card_number').focus();
      }
    });
  });

$(function(){//誕生日
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

$(function(){//カード有効期限
  var time = new Date();
  var year = time.getFullYear();
  for (var i = 2030; i >= 2019; i--) {
      $('#user_creditcard_attributes_valid_year').append('<option value="' + i + '">' + i + '</option>');
  }
  for (var i = 1; i <= 12; i++) {
      $('#user_creditcard_attributes_valid_month').append('<option value="' + i + '">' + i + '</option>');
  }
});

$(function(){//ニックネーム必須判定
  $('input#user_nickname').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/[^\s\t]/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">必須項目です</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//メール必須判定
  $('input#user_email').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しいメールアドレスを入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//パス必須判定
  $('input#user_password').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^([a-zA-Z0-9]{6,})$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しいパスワードを入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//パス確認判定
  $('input#user_password_confirmation').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (user_password.value != user_password_confirmation.value){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">入力値が一致しません</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//姓必須判定
  $('input#user_user_detail_attributes_last_name').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^[ぁ-んァ-ン一-龥]/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//名必須判定
  $('input#user_user_detail_attributes_first_name').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^[ぁ-んァ-ン一-龥]/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//姓カナ必須判定
  $('input#user_user_detail_attributes_last_name_kana').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^([ァ-ン]|ー)+$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//名カナ必須判定
  $('input#user_user_detail_attributes_first_name_kana').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^([ァ-ン]|ー)+$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//携帯番号必須判定
  $('input#user_user_detail_attributes_mobile_phone').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^0[789]0(-\d{4}-\d{4}|\d{8})$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//郵便番号必須判定
  $('input#user_user_address_attributes_postal_code').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/^\d{3}[-]\d{4}$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//市町村必須判定
  $('input#user_user_address_attributes_city').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/[^\s\t]/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">必須項目です</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//番地必須判定
  $('input#user_user_address_attributes_block_number').on('blur',function(){
    let error;
    let value = $(this).val();
    if(value == ""){
      error = true;
    }
    else if (!value.match(/[^\s\t]/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">必須項目です</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//任意電話判定
  $('input#user_user_address_attributes_telephone').on('blur',function(){
    let error;
    let value = $(this).val();
    if (!value.match(/^0\d{1,4}(-\d{1,4}-\d{4}|\d{6,8})$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">正しく入力してください</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//クレカ番号判定
  $('input#user_creditcard_attributes_card_number').on('blur',function(){
    let error;
    let value = $(this).val();
    if (!value.match(/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">必須項目です</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//セキュリティ番号判定
  $('input#user_creditcard_attributes_security_code').on('blur',function(){
    let error;
    let value = $(this).val();
    if (!value.match(/^\d{3,4}$/)){
      error = true;
    }

    if(error){//エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('span.error-info').length){//メッセージを後ろに追加
        $(this).after('<span class = "error-info">必須項目です</span>');
      }
    }
    else {//エラーじゃないのにメッセージがあったら
      if($(this).nextAll('span.error-info').length){//消す
        $(this).nextAll('span.error-info').remove();
      }
    }
  });
});

$(function(){//登録前判定
  $('form').on('submit',function(){
    let error = $(this).find('span.error-info').length;
    let code = $('input#user_creditcard_attributes_security_code').val();
    let vmonth = $('select#user_creditcard_attributes_valid_month').val();
    let vyear = $('select#user_creditcard_attributes_valid_year').val();
    let check = code&&vmonth&&vyear
    if(error){
      alert("入力エラーがあります");
      return false;
    }
    else if(check == "") {
      alert("入力エラーがあります");
      return false;
    }
  });
});

$(function(){//Enterキーでsubmit無効化
  $("input"). keydown(function(e) {
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
          return false;
      } else {
          return true;
      }
  });
});