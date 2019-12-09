$(function(){
  function appendChildOptions(child){
    var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
    $('#child-select').append(child_option);
  }
  function appendGrandChildOptions(child){
    var child_option =`<option value="${child.id}" class="grandchild-option">${child.name}</option>`
    $('#grandchild-select').append(child_option);
  } 
  function searchBrand(brand){
    let brands_list = `<li class="search_result" data-id="${brand.id}" data-name="${brand.name}">${brand.name}</li>`
    $("#brands-search-list").append(brands_list)
  }

  if (window.location.href.match(/\/edit/)){

    $(function(){
      $("#brand-wrap").show();
      $("#child-wrap").show();
      $("#grandchild-wrap").show();
      $("#delivery-method-wrap").show();
      let root_id = $('#category-select').val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: root_id
        }
      })
      .done(function(children){
        children.forEach(function(child){
          appendChildOptions(child)
        })
      });
    })


    // ロードして即 
    $(function(){
      parent_id = $('#child-select').val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: parent_id
        }
      })
      .done(function(children){
        children.forEach(function(child){
          appendGrandChildOptions(child)
        })
      });
    })



    $('#category-wraps').on('change','#category-select', function(){
      var parent_id = $(this).val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: parent_id
        }
      })
      .done(function(children){
        $('.child-option').remove();
        $('#child-select').append(`<option value="" class="child-option">---</option>`);
        $("#grandchild-wrap").hide();
        children.forEach(function(child){
          appendChildOptions(child)
        })
      });
    });

    $('#category-wraps').on('change', '#child-select', function(){
      var parent_id = $(this).val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: parent_id
        }
      })
      .done(function(children){
        $("#grandchild-wrap").show();
        $('.grandchild-option').remove();
        $('#grandchild-select').append(`<option value="" class="grandchild-option">---</option>`);
        children.forEach(function(child){
          appendGrandChildOptions(child)
        })
      });
    });


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

    $("#brand-wrap").on('keyup', "#brand-select", function(){
      let input = $(this).val();
      $.ajax({
        type: "GET",
        url: "/items/brand_find",
        data: { keyword: input},
        dataType: "json"
      })
      .done(function(brands){
        $("#brands-search-list").empty();
        if (brands.length !== 0) {
          brands.forEach(function(brand){
            searchBrand(brand);
          });
        }else{
          return false;
        }
      })
      .fail(function(){
        return false;
      })
    });

    $("#brand-wrap").on('click', '.search_result', function(){
      let brand_name = $(this).data("name");
      $('#brand-select').val(brand_name);
      $("#brands-search-list").empty();
    });
  }else{

    $("#brand-wrap").hide();
    $("#child-wrap").hide();
    $("#grandchild-wrap").hide();
    $("#delivery-method-wrap").hide();


// 親カテゴリーが変わったら
    $('#category-wraps').on('change','#category-select', function(){
      var parent_id = $(this).val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: parent_id
        }
      })
      .done(function(children){
        $("#child-wrap").show();
        $('.child-option').remove();
        $("#grandchild-wrap").hide();
        $('.grandchild-option').remove();
        children.forEach(function(child){
          appendChildOptions(child)
        })
      });

    });
  // 子カテゴリーが変わったら
    $('#category-wraps').on('change', '#child-select', function(){
      var parent_id = $(this).val();
      $.ajax({
        url: "/items/category_find",
        type: "GET",
        dataType: 'json',
        data: {
          category_id: parent_id
        }
      })
      .done(function(children){
        $("#grandchild-wrap").show();
        $('.grandchild-option').remove();
        children.forEach(function(child){
          appendGrandChildOptions(child)
        })
      });

    });
  // 孫カテゴリーが変わったら
    $('#category-wraps').on('change', '#grandchild-select', function(){
      var child_id = $('#child-select').val();
      if (child_id < 380){
        $("#brand-wrap").show();

      }else{
        $('#brand-wrap').hide();
      }
    });


  // ブランドフォームに入力したら
    $("#brand-wrap").on('keyup', "#brand-select", function(){
      let input = $(this).val();
      $.ajax({
        type: "GET",
        url: "/items/brand_find",
        data: { keyword: input},
        dataType: "json"
      })
      .done(function(brands){
        $("#brands-search-list").empty();
        if (brands.length !== 0) {
          brands.forEach(function(brand){
            searchBrand(brand);
          });
        }else {
          return false;
        }
      })
      .fail(function(){
        return false;
      })

    });
  // 検索結果を押したら
    $("#brand-wrap").on('click', '.search_result', function(){
      let brand_name = $(this).data("name");
      $('#brand-select').val(brand_name);
      $("#brands-search-list").empty();
    });




    $(".sell-form-box").on('change', '#condition-select', function(){
      $("#delivery-method-wrap").show();
    });


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


  }
});