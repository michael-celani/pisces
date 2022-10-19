/// @description
draw_set_color(c_black);
draw_set_alpha(0.1);
draw_rectangle(x + 20, y + 20, x + 20 + width, y + 20 + height, false);
draw_set_alpha(1);
draw_set_color(c_white);

draw_set_color(window_color);
draw_rectangle(x, y, x + width, y + height, false);
draw_set_color(c_white);