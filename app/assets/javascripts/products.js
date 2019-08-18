$(function (){
  // カテゴリーから探すをマウスオーバーするとカテゴリーを表示
  $('.category-search').hover(
    function(){
      $(this).css('color', '#0099E8');
      $('.parent-wrap').css('display', 'block');
    },
    function(){
      $(this).css('color', ' #333');
      $('.parent-wrap').css('display', 'none');
    }
  )
    // カテゴリーのリストをマウスオーバーすると発火
  $('.parent-wrap__list').hover(
    function(){
      $('.parent-wrap').css('display', 'block');
      $(this).css('background-color', '#EA352D');
      $(this).children('a').css('color', 'white');
      $(this).find('.child-wrap').css('display', 'block');

      var $child = $(this).find('.child-wrap__list')
      $child.hover(
        function(){
          $(this).css('background-color', '#EEEEEE');
          $(this).find('.grandchild-wrap').css('display', 'block');

          var $grandchild = $(this).find('.grandchild-wrap__list')

          $grandchild.hover(
            function(){
              $(this).css('background-color', '#EEEEEE');
            },
            function(){
              $(this).css('background-color', 'white');
            })
        },
        function(){
          $(this).css('background-color', 'white');
          $(this).find('.grandchild-wrap').css('display', 'none');
        }
      )
    },
    function(){
      $(this).css('background-color', 'white');
      $(this).find('a').css('color', '#333');
      $('.parent-wrap').css('display', 'none');
      $(this).find('.child-wrap').css('display', 'none');
    }
  )

// ブランドから探すをマウスオーバーすると発火する
  $('.brand-search').hover(
    function(){
      $(this).css('color', '#0099E8');
      $('.b-parent-wrap').css('display', 'block');
    },
    function(){
      $(this).css('color', ' #333');
      $('.b-parent-wrap').css('display', 'none');
    }
  )

  $('.b-parent-wrap__list').hover(
    function(){
      $('.b-parent-wrap').css('display', 'block');
      $(this).css('background-color', '#EA352D');
      $(this).children('a').css('color', 'white');
    },
    function(){
      $(this).css('background-color', 'white');
      $('.b-parent-wrap').css('display', 'none');
      $(this).find('a').css('color', '#333');
    }
  )

  // アイテム上でマウスオーバーした際の対応
  $('.items-container__title h3, .view-all, .category-items__index--list').find('a').hover(
    function(){
      $(this).css('border-bottom', 'solid 1px #0099E8');
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('border-bottom', 'none');
      $(this).css('opacity', '1.0');
    }
  )

  $('.view-all').find('a').hover(
    function(){
      $(this).css('border-bottom', 'solid 1px #0099E8');
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('border-bottom', 'none');
      $(this).css('opacity', '1.0');
    }
  )
})

// 商品詳細ページ商品画像スライダー
$(function() {
  var $slider = $('.is-slider');
  if ($slider.length < 1) { return; }

  var $thumbs = $('.is-thumbnails__item');

  $slider.slick({
    arrows: false,
  });

  $('.is-thumbnails__item:first').addClass('current');

  $thumbs.on('mouseover', function(e){
    e.preventDefault();
    var index = $thumbs.index(this);
    $slider.slick('slickGoTo', index, true);
  });

  $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide){
    var currentClass = 'current';
    $thumbs.removeClass(currentClass)
      .eq(nextSlide).addClass(currentClass);
  });
});

//ログイン時の右上のアイコンを触る
$(function(){
  $('.h-right__list').hover(
    function(){
      $(this).children('a').css('color', '#0099E8');
      $(this).find('.top-page__icon').css('color', '#0099E8');
      $(this).children('.header-mypage-box').css('display', 'block');
    },
    function(){
      $(this).children('a').css('color', ' #333');
      $(this).find('.top-page__icon').css('color', '#333');
      $(this).children('.header-mypage-box').css('display', 'none');
    }
  )
})
