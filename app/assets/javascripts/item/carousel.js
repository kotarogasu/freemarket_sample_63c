$(function(){
  var timerId;
  $('.owl-dot').eq(0).addClass('active')

  $('.owl-dot').hover(function(){
    if($(this).not('active')){
      console.log("OK")
      $(this).addClass('active').siblings('.owl-dot').removeClass('active');
      var index = $(".owl-dots").children().index(this);
      $(".owl-stage").children().eq(index).addClass('active').siblings(".owl-item").removeClass('active');
      timerId = setTimeout(function(){
        var stage_length = index * -300
        $(".owl-stage").css("left", `${stage_length}px` )
      }, 300)
    }
  })
})