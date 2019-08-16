$(function(){
  // // rootカテゴリ
  // var root_id = $("#parent").data("root");
  // var root = $(`#parent > option[value=${root_id}]`);
  // root.attr("selected","selected");
  
  // // childカテゴリ
  // var child_id = $("#child").data("child");
  // var child = $(`#child > option[value=${child_id}]`);
  // child.attr("selected","selected");

  // 画像の削除
  $(".delete-btn").click(function(e) {
      e.preventDefault();
      var image_id = $(this).data("imgid")
    //   if(!confirm('本当に削除しますか？')){
    //     /* キャンセルの時の処理 */
    //     return false;
    // }else{
    //     /*　OKの時の処理 */
    //     location.href = 'index.html';
    // }
    //   alert('こんにちは!');
      $(this).parents('.sell-form--upload-box__upload__item').hide();

      $(".btn_edit").click(function() {
        // 新規で画像をいれらときはlengthは「0」になる
        if ( image_id.length != 0 ) {
            $.ajax({
                // Api::ProductsControllerのimage_destroyに飛ぶ
                type: 'DELETE',
                url: '/api/destroy/image_destroy',
                data: {img_id: image_id},
                dataType: 'json'
            })
            .done(function() {
                alert("削除しました");
            })
            .fail(function() {
                alert("削除に失敗しました");
            });
          }
      });
  });

//   $(".edit-image-btn").click(function(){
//     $(".edit-image").click();
//     return false;
//   });

$(function(){
    $('#edit-image').change(function(e){
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
          $(this).parents('.upload-image').find("#img1");
          $("#img1").attr("src", e.target.result);
          $("#img1").attr("title", file.name);
        };
      })(file);
      reader.readAsDataURL(file);
   
    });
  });

});