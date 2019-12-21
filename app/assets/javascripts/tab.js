  //マイページ お知らせ・やることリスト  
$(function(){
  $('.mypage-tabs li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $(".mypage-tabs li").index(this);
      $(".mypage-content ul").eq(index).addClass('active').siblings("ul").removeClass('active');
    }
  });

  //マイページ 購入した商品
  $('.mypage-tabs li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $(".buy li").index(this);
      $(".mypage-item-list li").eq(index).addClass('active').siblings("li").removeClass('active');
    }
  });

  //マイページ 出品した商品
  $('.mypage-tabs li').on('click',function(e){
    e.preventDefault(); //ページトップへ移動するのを防ぐ
    if($(this).not('active')){
      $(this).addClass('active').siblings('li').removeClass('active');
      var index = $(".mypage-tabs li").index(this);
      $(".listing-item").eq(index).addClass('active').siblings("ul").removeClass('active');
    }
  });

}); 

