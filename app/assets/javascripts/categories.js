// カテゴリーにおけるjQueryの設定
$(function(){
  // マウスオーバーしたらカテゴリーの色が変化
  $('.category-children__box-list').hover(
    function(){
      $(this).css('background-color', '#EA352D');
      $(this).css('color', 'White');
    },
    function(){
      $(this).css('background-color', 'white');
      $(this).css('color', '#333333');
    }
  )

  // マウスオーバーしたらカテゴリーの孫要素の色が変化
  $('.category-child__all-text').hover(
    function(){
      $(this).css('opacity', '0.7');
      $(this).css('border-bottom', '1px solid');
    },
    function(){
      $(this).css('border-bottom', 'none');
      $(this).css('opacity', '1.0');
    }
  )

  $('.category-grandchild__title-text').hover(
    function(){
      $(this).css('opacity', '0.7');
      $(this).css('border-bottom', '1px solid');
    },
    function(){
      $(this).css('border-bottom', 'none');
      $(this).css('opacity', '1.0');
    }
  )
})