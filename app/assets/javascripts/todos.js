function bindSortable(){
  $('[data-behavior~=sort_todo]').sortable({
    forcePlaceholderSize: true     
  }).bind('sortupdate', function(e, ui) {
    //ui.item contains the current dragged element.
    //Triggered when the user stopped sorting and the DOM position has changed.
    var ids = [];
    $(ui.item).parent().children('li').each(function (idx, el) {
      ids.push('#' + el.id);
    });    
    $.post($(this).data('update-url'), {todo_ids: ids})    
  });  
} 



$(document).on("keypress", "[data-behavior~=create_todo]", function(e) {
  if (e.keyCode === 13) {
    if ($(this).val().trim().length) {
      $(this).closest("form").submit();
    }
    return e.preventDefault();
  }
});

$(document).on("click", "[data-behavior~=toggle_todo]", function() {
  return $(this).closest("form").submit();
});

$(document).ready(function () {
  bindSortable();
})  