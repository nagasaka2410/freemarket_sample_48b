$(function() {
  var edit_width = $(".edit-image").length;
  var update_width = $(".edit-image").length - 1;
  var thumbnail = '';
  thumbnail = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="product[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;

  $(".edit-dropbox-container").css({
    'width': `calc(100% - (22% * ${edit_width}))`
  })

  $('.edit-image').on('click', function(){

    $('.edit-image').change(function(e){
      //ファイルオブジェクトを取得する
      var file = e.target.files[0];
      var reader = new FileReader();
  
      //画像でない場合は処理終了
      if(file.type.indexOf("image") < 0){
        alert("画像ファイルを指定してください。");
        return false;
      }
  
      //アップロードした画像を設定する
      reader.onload = (function(file){
        return function(e){
          $('.listing-select-wrapper__box2').append(thumbnail);
          $("#img1").attr("src", e.target.result);
          $("#img1").attr("title", file.name);

          $(".edit-dropbox-container").css({
            'width': `calc(100% - (22% * ${update_width}))`
          })
        };
      })(file);
      reader.readAsDataURL(file);
  
    });
  });
});