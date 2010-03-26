function radio_value(element) {
  for(var i=0; i<element.length; i++) {
    if (element[i].checked) {
      return element[i].value;
    }
  }
}

function handle_add_item_form_submit(form) {
  var color = radio_value(form.color);
  var description = form.description.value;
  new Request({ 
    url: '/items', 
    method: 'post', 
    data: { description: description, color: color },
    onFailure: function(instance){ 
      alert('oops! something went wrong.');
    }, 
    onSuccess: function(result){ 
      top.frames[0].add_item(description, color);
    } 
  }).send(); 
}
