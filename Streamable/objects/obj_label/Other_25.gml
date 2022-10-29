/// @description Insert description here

var draw_x = x;
var draw_y = y;

if parent_component != noone
{
	draw_x -= parent_component.x;
	draw_y -= parent_component.y;
}

draw_set_color(label_color);
draw_set_font(label_font);
draw_set_halign(label_halign);
draw_set_valign(label_valign);

gpu_set_colorwriteenable(true, true, true, false);
draw_text(draw_x, draw_y, label_text);
gpu_set_colorwriteenable(true, true, true, true);