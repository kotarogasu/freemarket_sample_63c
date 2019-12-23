$(function(){
  function searchBrand(brand){
    let brands_list = `<li class="search_result" data-id="${brand.id}" data-name="${brand.name}">${brand.name}</li>`
    $("#brands-search-list").append(brands_list)
  }  

  $('#category-wraps').on('change', '#grandchild-select', function(){
    var child_id = $('#child-select').val();
    if (child_id < 380){
      $("#brand-wrap").show();

    }else{
      $('#brand-wrap').hide();
    }
  });

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
});

