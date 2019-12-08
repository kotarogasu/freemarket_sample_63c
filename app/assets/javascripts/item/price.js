$(function(){
  $(".sell-form-box").on('keyup', "#price-input", function(){
    let price = $(this).val();
    let fee = price * 0.1
    let fee_to_i = parseInt(fee);
    let added_comma_fee = fee_to_i.toLocaleString();
    var profit = price - fee_to_i
    var added_comma_profit =profit.toLocaleString();
    if (price >= 300 && price <= 9999999) {
      $("#fee").html("¥" + added_comma_fee);
      $("#profit").html("¥" + added_comma_profit);
    }else {
      $("#fee").empty();
      $("#profit").empty();
    };  
  })
});
