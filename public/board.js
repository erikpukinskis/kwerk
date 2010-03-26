var items
function initialize() {
  items = {"red": [], "yellow": [], "green": [], "blue": []};
}

function add_item(description, color) {
  items[color].push(description);
  draw_board();
}

function draw_board() {
  $('board').set('html','');
  draw_quadrant("blue", -1,-1)
  draw_quadrant("red", 1,-1)
  draw_quadrant("green", -1,1)
  draw_quadrant("yellow", 1,1)
}

function draw_quadrant(color, x_direction, y_direction) {
  var width = quadrant_size(color);
  ix = 0;
  iy = 0;
  
  for(var i=0; i<items[color].length; i++) {
    add_box(ix, iy, x_direction, y_direction, color, items[color][i]);
    ix++;
    if (ix >= width) {
      ix = 0;
      iy++;
    }
  }
}

function add_box(ix, iy, x_direction, y_direction, color, description) {
  origin_x = 1000;
  origin_y = 1000;
  box_size = 100;

  x = origin_x + ix * box_size * x_direction + x_direction*50;
  y = origin_y + iy * box_size * y_direction + y_direction*50;
  add_div(x, y, color, description);
}

function add_div(x, y,color, description) {
  var style = 'left: ' + x + 'px; top: ' + y + 'px';
  var el = new Element('div', {'class': 'item ' + color, 'html': description, 'style': style});
  el.injectInside($('board'));
}

function quadrant_size(color) {
  return Math.ceil(Math.sqrt(items[color].length));
}

initialize();
