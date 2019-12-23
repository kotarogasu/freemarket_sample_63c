$(function(){
  function appendChildOptions(child){
    var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
    $('#child-select').append(child_option);
  }
  function appendGrandChildOptions(child){
    var child_option =`<option value="${child.id}" class="grandchild-option">${child.name}</option>`
    $('#grandchild-select').append(child_option);
  } 


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
      $('#child-select').append(`<option value="" class="child-option">---</option>`);
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
      $('#grandchild-select').append(`<option value="" class="grandchild-option">---</option>`);
      children.forEach(function(child){
        appendGrandChildOptions(child)
      })
    });
  });

// 孫カテゴリーが変わったら


  $(".sell-form-box").on('change', '#condition-select', function(){
    $("#delivery-method-wrap").show();
  });


  if(window.location.href.match(/\/items\/new/)){
    // 商品の出品ページ用js
    $("#brand-wrap").hide();
    $("#child-wrap").hide();
    $("#grandchild-wrap").hide();
    $("#delivery-method-wrap").hide();
    console.log("OK")
    
  }else if (window.location.href.match(/\/items/)){
    // 商品の出品失敗ページ、編集ページ
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



  // ロードして即 
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
 
    })
  }
});
