$(function(){

  function appendChildOptions(child){
    var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
    $('#child-select').append(child_option);
  }
  function appendGrandChildOptions(child){
    var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
    $('#grandchild-select').append(child_option);
  }

  function showBrandInput(){
    $("#brand-wrap").show();
  }

  function searchBrand(brand){
    let brands_list = `<li class="search_result" data-id="${brand.id}" data-name="${brand.name}">${brand.name}</li>`
    $("#brands-search-list").append(brands_list)
  }



// 商品出品フォームの場合
  if (window.location.href.match(/\/items\/new/)){
      $("#brand-wrap").hide();
      $("#child-wrap").hide();
      $("#grandchild-wrap").hide();
      $("#delivery-method-wrap").hide();
  




    $(document).on('change','#category-select', function(){
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

    $(document).on('change', '#child-select', function(){
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

    $(document).on('change', '#grandchild-select', function(){
      var child_id = $('#child-select').val();
      if (child_id < 380){
        showBrandInput();

      }else{
        $('#brand-wrap').hide();
      }
    });



    $(document).on('keyup', "#brand-select", function(){
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
        }else if (input.length == 0) {
          return false;
        }else {
        }
      })
      .fail(function(){
        return false;
      })

    });

    $(document).on('click', '.search_result', function(){
      let brand_name = $(this).data("name");
      $('#brand-select').val(brand_name);
      $("#brands-search-list").empty();
    });




    $(document).on('change', '#condition-select', function(){
      $("#delivery-method-wrap").show();
    });


    $(document).on('keyup', "#price-input", function(){
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
  
  // 商品編集ページの場合
  else{
    $(function(){
      parent_id = $('#category-select').val();
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
          appendChildOptions(child)
        })
      });

    })

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
    

    
    $(document).on('change','#category-select', function(){
      var parent_id = $(this).val();
      console.log(parent_id)
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

    $(document).on('change', '#child-select', function(){
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


    $(document).on('keyup', "#price-input", function(){
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

    $(document).on('keyup', "#brand-select", function(){
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
        }else if (input.length == 0) {
          return false;
        }else {
        }
      })
      .fail(function(){
        return false;
      })

    });

    $(document).on('click', '.search_result', function(){
      let brand_name = $(this).data("name");
      $('#brand-select').val(brand_name);
      $("#brands-search-list").empty();
    });

  }






  
});