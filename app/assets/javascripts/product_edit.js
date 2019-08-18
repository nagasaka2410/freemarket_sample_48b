$(function() {
  var edit_width = $(".edit-image").length;
  var update_width = $(".edit-image").length - 1;

  $(".edit-dropbox-container").css({
    'width': `calc(100% - (22% * ${edit_width}))`
  })


  $(function(){
    // 画像の削除
    $(".delete-btn").click(function(e) {
        e.preventDefault();
        var image_id = $(this).data("imgid");
      if(edit_width == 1){
        $(".edit-image")[0].click();
      }
      else{
        if ( image_id.length != 0 ) {
          if(!confirm('本当に削除しますか？')){
            return false;
          }else{
            $(this).parents('.sell-form--upload-box__upload__item').hide();
            
            $.ajax({
                // Api::ProductsControllerのimage_destroyに飛ぶ
                type: 'DELETE',
                url: '/api/destroy/image_destroy',
                data: {img_id: image_id},
                dataType: 'json'
            })
            .done(function() {
                alert("削除しました");
                $(".edit-dropbox-container").css({
                  'width': `calc(100% - (22% * ${update_width}))`
                })
            })
            .fail(function() {
                alert("削除に失敗しました");
            });
          }
        }
      }
    });
  });
});

$(function (){
  $('.edit-image').on('click', function(){
    var id =  $(this).attr("id");
    var img_id = "i" + id
    // alert(id);

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
          $(id).parents('.upload-image').find("#img1");
          $("#img1").attr("src", e.target.result);
          $("#img1").attr("title", file.name);
        };
      })(file);
      reader.readAsDataURL(file);
  
    });
  });
});