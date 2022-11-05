/// @description Insert description here
var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_set_color(draw_color);
draw_roundrect_ext(draw_x, draw_y, draw_x + 49, draw_y + 49, 25, 25, false);

var percentage = smootherstep(0, 15, ticker)

if checked {
	percentage = 1 - smootherstep(0, 15, ticker);	
}

draw_set_color(checked_color);
draw_set_alpha(percentage);
draw_roundrect_ext(draw_x + 10, draw_y + 10, draw_x + 39, draw_y + 39, 15, 15, false);
draw_set_alpha(1);
draw_set_color(c_white);

