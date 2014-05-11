$(document).on("keypress", "[data-behavior~=create_todo]", function(e) {
  if (e.keyCode === 13) {
    if ($(this).val().trim().length) {
      $(this).closest("form").submit();
    }
    return e.preventDefault();
  }
});
