function radio_value(element) {
  for(var i=0; i<element.length; i++) {
    if (element[i].checked) {
      return element[i].value;
    }
  }
}

function handle_add_item_form_submit(form) {
  var color = radio_value(form.color)
  top.frames[0].add_item(form.description.value, color);
}
