$(function(){

  var icon = `<i class="fas fa-chevron-down"></>`

  function showChildSelect(children){
    

    $("#child-wrap").append(icon)  
    $('.child-option').remove();
    $('.grandchild-option').remove();
    children.forEach(function(child){
      var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
      $('#child-select').append(child_option);
    })
    $('#child-select').show();
  }

  function showGrandChildSelect(children){
    console.log(children)
    $("#grandchild-wrap").append(icon) 
    $('.grandchild-option').remove();
    children.forEach(function(child){
      var child_option =`<option value="${child.id}" class="grandchild-option">${child.name}</option>`
      $('#grandchild-select').append(child_option);    
    })
    $('#grandchild-select').show();
  }
    


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
      showChildSelect(children);
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
      showGrandChildSelect(children); 
    });

  });

});