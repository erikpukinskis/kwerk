var items
function initialize() {
  items = {"red": [], "yellow": [], "green": [], "blue": []};
}

function radio_value(element) {
  for(var i=0; i<element.length; i++) {
    if (element[i].checked) {
      return element[i].value;
    }
  }
}

function handle_add_item_form_submit(form) {
  var color = radio_value(form.color)
  add_item(form.description.value, color);
}

function add_item(description, color) {
  items[color].push(description);
  draw_board();
}

function draw_board() {

}

initialize();
