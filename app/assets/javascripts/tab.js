  //マイページ お知らせ・やることリスト  
$(function(){
  $('#notification li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $("#notification li").index(this);
      $(".messages ul").eq(index).addClass('active').siblings("ul").removeClass('active');
    }
    console.log("OKお知らせ")
  });

  //マイページ 購入した商品
  $('.buy li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $(".buy li").index(this);
      $("#shopping ul").eq(index).addClass('active').siblings("ul").removeClass('active');
    }
  });

  // マイページ 出品した商品
  $('.mypage-tabs--listing li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $(".mypage-tabs--listing li").index(this);
      $(".listing-item").eq(index).addClass('active').siblings("ul").removeClass('active');
    }
    console.log(index)
  });

}); 

